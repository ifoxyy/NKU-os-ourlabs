# Lab3中断和异常处理

实验3主要讲解的是中断处理机制。通过本章的学习，我们了解了 riscv 的中断处理机制、相关寄存器与指令。我们知道在中断前后需要恢复上下文环境，用一个名为中断帧（TrapFrame）的结构体存储了要保存的各寄存器，并用了很大篇幅解释如何通过精巧的汇编代码实现上下文环境保存与恢复机制。最终，我们通过处理断点和时钟中断验证了我们正确实现了中断机制。

***

## 练习1：完善中断处理 （需要编程）

```java
    case IRQ_S_TIMER:
               // (1) 设置下次时钟中断
            clock_set_next_event();
    
              // (2) 计数器加一
            ticks++;
    
            // (3) 每100次时钟中断打印一次
            if (ticks % TICK_NUM == 0) {
            print_ticks();
            num++;
        
            // (4) 打印10次后关机
            if (num == 10) {
                sbi_shutdown();
            }
        }
        /* Supervisor timer interrupt */

        break;
```

在进行代码编辑后，每次当时钟中断发生时：

* 都会设置下一次时钟中断

* 计数器`ticks`+1

* 没100次中断调用`print_ticks()`打印信息，并增加计数`num`

* 当打印10次后，调用`sbi_shutdown()`关机

***

## 扩展练习 Challenge1：描述与理解中断流程

#### 描述ucore中处理中断异常的流程（从异常的产生开始），其中mov a0，sp的目的是什么？

##### **1.异常/中断的产生与入口跳转**

当 CPU 执行过程中产生异常（如非法指令、断点）或中断（如时钟中断）时，硬件会：

* 自动保存当前指令地址到 `sepc`

* 在 `scause` 中写入异常/中断类型编号

* 跳转到由 `stvec` 寄存器指定的入口地址执行。

在 `trap.c` 的 `idt_init()` 中：

```plain&#x20;text
extern void __alltraps(void);
write_csr(stvec, &__alltraps);
```

`stvec` 被设置为 `__alltraps`，所以异常发生后，硬件会跳转到 `trapentry.S` 中的 `__alltraps` 执行。

##### **2. \_\_alltraps：保存上下文（SAVE\_ALL）**

`__alltraps` 是汇编入口，在其中执行宏 `SAVE_ALL`，它的作用是：

* 在当前内核栈上为 `struct trapframe` 分配空间；

* 把通用寄存器 x0\~x31、`sstatus`、`sepc`、`sbadaddr`、`scause` 全部保存到栈上；

* 形成一个完整的陷入帧 `trapframe`。

关键部分（来自 `trapentry.S`）：

```plain&#x20;text
SAVE_ALL
move a0, sp     # 将栈顶地址（即trapframe地址）传给C函数的第一个参数a0
jal trap        # 调用C函数trap(tf)
```

##### 3.mov a0, sp&#x20;

这条指令的作用是：把保存了当前寄存器快照的栈顶地址（`sp`）传递给 `trap()` 函数。

`a0` 是 RISC-V 调用约定中 **第一个函数参数寄存器，**&#x56E0;为 C 函数 `trap(struct trapframe *tf)` 需要一个 `trapframe` 指针，所以这里让 `trap()` 知道从哪里取出保存好的寄存器状态。

##### **4. trap()函数：C层的分发与处理**

`trap()` 函数在 `trap.c` 中定义：

```plain&#x20;text
void trap(struct trapframe *tf) {
    trap_dispatch(tf);
}
```

它会根据 `tf->cause` 来判断是中断还是异常：

```plain&#x20;text
if ((intptr_t)tf->cause < 0)  // cause最高位=1 → 中断
    interrupt_handler(tf);
else                          // 否则为异常
    exception_handler(tf);
```

##### 5.interrupt\_handler处理中断或exception\_handler处理异常

以时钟中断（Supervisor Timer）为例：

```plain&#x20;text
case IRQ_S_TIMER:
    clock_set_next_event();
    ticks++;
    if (ticks % 100 == 0) print_ticks();
    if (print_num >= 10) shut_down();
    break;
```

当异常发生（如非法指令、断点）时：

```plain&#x20;text
case CAUSE_ILLEGAL_INSTRUCTION:
    cprintf("Illegal instruction caught at 0x%08x\n", tf->epc);
    cprintf("Exception type: Illegal instruction\n");
    tf->epc += 4;
    break;
```

##### 6.**返回过程（\_\_trapret）**

C 层处理完后，返回到 `trapentry.S`：

```plain&#x20;text
__trapret:
    RESTORE_ALL
    sret
RESTORE_ALL 
```

宏会：

* 从栈中恢复所有寄存器；

* 恢复 `sstatus` 和 `sepc`；

* 最后通过 `sret` 指令返回原程序继续执行。

#### SAVE\_ALL中寄寄存器保存在栈中的位置是什么确定的？

在 `trapentry.S` 中：

```plain&#x20;text
addi sp, sp, -36 * REGBYTES
STORE x0, 0*REGBYTES(sp)
STORE x1, 1*REGBYTES(sp)
...
STORE s1, 32*REGBYTES(sp)
STORE s2, 33*REGBYTES(sp)
...
```

这些偏移量是 **固定写死的**，与 `struct trapframe` 的字段定义一一对应。
&#x20;也就是说，`trapframe` 的布局与 `SAVE_ALL` 的保存顺序严格匹配。

> 例如：`x10`（a0）被保存在 `10 * REGBYTES(sp)`；
> &#x20;这样 C 代码可以通过 `tf->gpr.a0` 正确取出原寄存器值。

#### 对于任何中断，\_\_alltraps 中都需要保存所有寄存器吗？

不是严格必须，但在 **内核设计的初始阶段（如ucore）** 通常这样做。

原因：

* 硬件陷入时可能随时打断任意代码；

* 我们不确定哪些寄存器在后续处理中会被破坏；

* 所以一次性保存所有通用寄存器，保证上下文完整性。

高级优化中：

* 某些中断（如时钟中断）可以只保存最小寄存器集；

* 但这会增加复杂度，不利于教学和调试。

***

## 扩增练习 Challenge2：理解上下文切换机制

#### 在trapentry.S中汇编代码 csrw sscratch, sp；csrrw s0, sscratch, x0实现了什么操作，目的是什么？

#### 操作流程：

```plain&#x20;text
csrw sscratch, sp      
csrrw s0, sscratch, x0 
```

1. 第一条指令：将当前栈指针`sp`保存到`sscratch`寄存器

2. 第二条指令：将`sscratch`的值读到`s0`，同时清零`sscratch`

#### 目的：

保存用户栈指针，标记异常来源，将`sscratch`清零即标记该异常在内核中处理，如果在处理该异常时又出现了新的异常，那么新异常程序就可以通过检查`sscratch`是否为0来判断异常是否来自于内核

#### save all里面保存了stval scause这些csr，而在restore all里面却不还原它们？那这样store的意义何在呢？

#### 原因：这些CSR是只读的

* scause是硬件自动设置的，只读

* stval是硬件自动设置的，只读

* 这些寄存器是记录当前异常信息的，不是需要还原的状态

#### 保存的目的：

```plain&#x20;text
void trap(struct trapframe *tf) {
// dispatch based on what type of trap occurred
trap_dispatch(tf);
}
```

保存这些CSR是为了让trap函数能够通过tf->cause了解异常原因、通过tf->badvaddr读取相关的内存地址，并进行相应的异常处理

***

## 扩展练习Challenge3：完善异常中断

#### 非法指令异常

```plain&#x20;text
case CAUSE_ILLEGAL_INSTRUCTION:
    {
        uintptr_t pc = tf->epc;
        uint16_t instr16;
        bool ok = 1;

        // 打印异常信息
        cprintf("Illegal instruction caught at 0x%08x\n", pc);
        cprintf("Exception type: Illegal instruction\n");

        // 尝试读取触发地址处的前两个字节
        // 注意：这里直接解引用假定 epc 可读（教学内核环境安全）
        // 若有 copy_from_user 等安全读函数，可替换使用
        instr16 = *(uint16_t *)pc;

        if ((instr16 & 0x3) != 0x3)
        {
            // 若低两位不为 11，则为 16-bit 压缩指令
            tf->epc += 2;
        }
        else
        {
            // 否则为 32-bit 指令
            tf->epc += 4;
        }
        break;
    }
```



#### 断点异常

```plain&#x20;text
case CAUSE_BREAKPOINT:
    cprintf("Exception type: breakpoint\n");
    cprintf("ebreak caught at 0x%08x\n", tf->epc);
    // 检测指令长度（适用于rv64imafdc等支持压缩指令的架构）
    uint16_t instr = *(uint16_t*)tf->epc;
    if ((instr & 0x3) != 0x3) {
        tf->epc += 2;  // 压缩指令
    } else {
        tf->epc += 4;  // 标准指令
    }
    break;
```

1. 使用`cprintf`输出"Exception type: breakpoint"，输出异常类型。

2. 使用`cprintf`输出"ebreak caught at 0x%08x"，其中`tf->epc`是异常程序计数器，指向触发异常的指令地址。

3. 将`tf->epc`加4，使其指向下一条指令，这样从异常返回后会继续执行下一条指令而不是再次触发相同的断点异常。

***

## 列出你认为本实验中重要的知识点，以及与对应的OS原理中的知识点，并简要说明你对二者的含义，关系，差异等方面的理解

| 实验知识点  | OS原理知识点 | 关系与差异                    |
| ------ | ------- | ------------------------ |
| 中断处理流程 | 中断与异常机制 | 实验实现了原理中的中断处理流程，但硬件细节被抽象 |
| 上下文切换  | 进程上下文切换 | 实验只涉及中断上下文，原理包含完整的进程切换   |
| 中断向量表  | 中断描述符表  | 实验使用简化版本，原理包含更复杂的分级保护    |
| 时钟中断   | 定时器管理   | 实验实现基础功能，原理包含更复杂的调度算法    |

## 列出你认为OS原理中很重要，但在实验中没有对应上的知识点

1. 进程调度算法：优先级调度、多级反馈队列、实时调度

2. 文件系统：文件组织、目录结构、磁盘分配策略

3. 死锁处理：预防、避免、检测与恢复机制

4. 内存分配算法：伙伴系统、slab分配器等

5. 多处理器同步：自旋锁、读写锁、RCU等

6. 设备驱动模型：统一的设备接口、即插即用机制

7. 系统安全机制：访问控制、权限管理、安全域





















