## 练习1: 加载应用程序并执行

**请在实验报告中简要说明你的设计实现过程。**

首先清空中断帧 ，将当前进程的中断帧内存区域完全清零。因为旧进程的寄存器值（通用寄存器）可能包含敏感数据或垃圾值，为了防止信息泄露，也为了让新程序在一个干净的环境中开始，必须清空 `trapframe`。

```plain&#x20;text
memset(tf, 0, sizeof(struct trapframe));
```

设置用户栈指针，为新程序准备函数调用的栈空间，将通用寄存器 `sp`设置为用户地址空间的栈顶地址 `USTACKTOP`。在第 4 步中，内核已经映射了用户栈的虚拟内存，当程序回到用户态开始运行时，第一个被调用的函数可能会进行压栈操作。如果 `sp` 未正确设置，程序一运行就会触发页错误而崩溃。

```plain&#x20;text
tf->gpr.sp = USTACKTOP;
```

设置程序入口地址，告诉 CPU 第一条指令从哪里开始执行。将 `epc` 设置为 ELF 文件头中读取到的入口地址 `e_entry`。

```plain&#x20;text
tf->epc = elf->e_entry;
```

设置处理器状态：

```plain&#x20;text
tf->status = (sstatus & ~(SSTATUS_SPP | SSTATUS_SIE)) | SSTATUS_SPIE;
```

清除 `sstatus` 寄存器中的 **SPP&#x20;**&#x4F4D;。因为RISC-V 规定，`sret` 指令执行后，CPU 的当前特权级会恢复为 `SPP` 位记录的值。

* **SPP = 1** 代表之前的特权级是 Supervisor。

* **SPP = 0** 代表之前的特权级是 User 。

我们需要让 CPU 认为“我之前是在用户态”，这样 `sret` 后它就会乖乖回到用户态执行新程序。



置位 `sstatus` 寄存器中的 **SPIE** 位。`sret` 指令执行后，CPU 的全局中断使能位 (SIE) 会被恢复为 `SPIE` 位记录的值。如果不设置这一位，新程序进入用户态后，全局中断默认是关闭的。如果中断关闭，时钟中断将被屏蔽，操作系统无法剥夺该进程的 CPU 使用权（无法抢占）。一旦用户程序写了个 `while(1);` 死循环，整个系统就会死机。因此，**必须置位 SPIE**，确保用户程序运行时，操作系统依然拥有控制权（响应中断）。



**请简要描述这个用户态进程被ucore选择占用CPU执行（RUNNING态）到具体执行应用程序第一条指令的整个经过。**

1. 进程调度选择（schedule函数）

当操作系统需要选择下一个进程执行时，会调用 schedule 函数，函数首先将当前进程的 need\_resched 标志清零，从当前进程的链表节点开始遍历进程列表（ proc\_list ），寻找第一个状态为 PROC\_RUNNABLE 的进程，如果找到可运行进程（next），则调用 proc\_run(next) 切换到该进程执行，如果没有找到可运行进程，则切换到idle进程。

* 进程切换准备（proc\_run函数）

在 proc\_run 函数中，首先检查是否需要切换进程；同时保存当前中断状态，禁用中断，将全局 current 指针切换到新进程。如果新进程的页表（ pgdir ）与当前进程不同，通过 lsatp 指令更新satp寄存器，将新进程的页表基址加载到硬件；然后增加新进程的运行次数计数，清零调度请求标志；最后调用 switch\_to 进行上下文切换。

* 上下文切换（switch\_to函数）

switch\_to 函数（kern/process/switch.S）是一个汇编函数，负责保存当前进程的上下文并恢复新进程的上下文

* 保存当前进程上下文 ：将当前进程的 ra 、 sp 和 s0-s11 寄存器保存到当前进程的 context 结构体中

* 恢复新进程上下文 ：从新进程的 context 结构体中加载 ra 、 sp 和 s0-s11 寄存器的值

最后执行 ret 指令，跳转到新进程的返回地址继续执行。

* 新进程执行入口（forkret函数）

对于首次执行的用户态进程，其 context 结构体中的返回地址指向 forkret 函数，这个函数接收新进程的 trapframe 指针作为参数。调用 forkrets 函数，将新进程的 trapframe 指针传递给它。

* &#x20;trapframe恢复与用户态进入（forkrets -> \_\_trapret -> RESTORE\_ALL）

forkrets 函数将栈指针设置为新进程的 trapframe 地址，跳转到 \_\_trapret 标签执行，\_\_trapret 调用 RESTORE\_ALL 宏恢复所有寄存器，RESTORE\_ALL 宏（kern/trap/trapentry.S）从栈（即trapframe）中恢复所有寄存器。

* &#x20;用户态执行

执行 sret 指令，将CPU模式从内核态切换到用户态。该指令会：

* 将 status 寄存器的 SIE 位设置为 SPIE 位的值（启用/禁用中断）

* 将 status 寄存器的 SPIE 位设置为1

* 将 status 寄存器的 SPP 位设置为0（用户态）

* 将程序计数器（PC）设置为 epc 寄存器的值（应用程序入口地址）

* CPU开始执行用户态应用程序的第一条指令，完成整个切换过程

***

## 练习2: 父进程复制自己的内存空间给子进程

**请在实验报告中简要说明你的设计实现过程。**

父进程复制内存空间给子进程的实现是通过以下函数链协作完成的：

1. 首先是入口do\_fork函数。当调用sys\_fork系统调用时，最终会执行do\_fork函数。在do\_fork中：

* 第3步调用copy\_mm(clone\_flags, proc)来处理内存复制

* 如果clone\_flags包含CLONE\_VM，则子进程与父进程共享内存空间

* 否则，子进程会复制父进程的内存空间

- copy\_mm函数

负责创建或共享进程的内存地址空间：

* 如果父进程是内核线程（oldmm == NULL），则直接返回

* 如果设置了CLONE\_VM标志，则子进程共享父进程的内存空间

* 否则：

  创建新的mm\_struct结构体，为子进程分配页目录（setup\_pgdir），调用dup\_mmap复制父进程的内存映射，将新的内存管理结构关联到子进程的proc\_struct中

- dup\_mmap函数

负责复制父进程的内存区域映射：首先遍历父进程的所有内存区域（VMA），为每个VMA创建一个新的VMA结构体，复制相同的起始地址、结束地址和标志；然后将新的VMA插入到子进程的内存管理结构中，再调用copy\_range函数复制每个VMA对应的内存内容。

* copy\_range函数

实际执行内存内容复制的函数：

* 按页（PGSIZE）为单位进行复制

* 对于父进程地址空间中的每个页：

  找到父进程对应的页表项（PTE），为子进程创建对应的页表项，分配新的物理页帧给子进程，再将父进程页的内容复制到子进程的新页中，最后建立子进程虚拟地址到新物理页的映射。

完整调用链：

```plain&#x20;text
do_fork
  └── copy_mm
        └── dup_mmap
              └── copy_range
                    ├── get_pte (父进程)
                    ├── get_pte (子进程)
                    ├── alloc_page
                    ├── memcpy
                    └── page_insert
```



**如何设计实现`Copy on Write`机制？给出概要设计，鼓励给出详细设计。**

在 `fork()` 时，不立即复制父进程的物理内存给子进程，而是让父子进程共享同一块物理内存，并将这些内存页标记为只读。只有当其中一个进程尝试写数据时，内核才捕获异常，分配新的物理页，复制数据，并修改页表映射。

CoW 机制的生命周期包含三个关键阶段：

1. **设置阶段 (Fork)**：

   * 修改内存复制逻辑（`copy_range`）。

   * 不再分配新物理页，而是将子进程的 PTE（页表项）指向父进程的物理页。

   * **关键点**：将父进程和子进程的该页 PTE 权限都设置为 不可写 。

   * 启用页表项中的保留位，标记该页为 CoW 页。

   * 增加物理页的引用计数。

2. **检测阶段 (Page Fault)**：

   当进程尝试写入这些只读页时，CPU 触发 `Store/AMO Page Fault`。在中断处理函数中检查出错原因。如果是写权限错误，且该页被标记为 CoW 页，则进入 CoW 处理流程。

3. **处理阶段 (Resolution)**：

   * 情况 A（多进程共享）：分配新物理页 -> 拷贝数据 -> 更新当前进程页表指向新页 -> 恢复写权限 -> 减少原物理页引用计数。

   * 情况 B（独占）：如果该页的引用计数仅为 1（其他进程已退出或已发生过 CoW），则无需拷贝，直接恢复写权限即可。

***

## 练习3: 阅读分析源代码，理解进程执行 fork/exec/wait/exit 的实现，以及系统调用的实现

**请在实验报告中简要说明你对 fork/exec/wait/exit函数的分析。并回答如下问题：**

**请分析fork/exec/wait/exit的执行流程。重点关注哪些操作是在用户态完成，哪些是在内核态完成？内核态与用户态程序是如何交错执行的？内核态执行结果是如何返回给用户程序的？**

#### 执行流程详细分析：

1. fork() 系统调用

用户态执行流程：

```c++
// user/libs/syscall.c
int sys_fork(void) {
    return syscall(SYS_fork);  // 调用通用系统调用接口
}

// 通用系统调用实现
static inline int syscall(int64_t num, ...) {
    // ... 参数处理 ...
    asm volatile (
        "ld a0, %1\n"        // 将系统调用号放入 a0
        "ecall\n"            // 触发系统调用，进入内核态
        "sd a0, %0"          // 保存返回值
        : "=m" (ret)
        : "m"(num), ...
        :"memory"
    );
    return ret;
}
```

内核态执行流程：

```c++
// kern/syscall/syscall.c
static int sys_fork(uint64_t arg[]) {
    struct trapframe *tf = current->tf;
    uintptr_t stack = tf->gpr.sp;
    return do_fork(0, stack, tf);  // 调用核心实现
}

// kern/process/proc.c
int do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf) {
    // 1. 分配进程控制块
    // 2. 建立父子关系
    // 3. 为子进程分配内核栈
    // 4. 复制内存空间（使用COW机制）
    // 5. 设置子进程的 trapframe 和 context
    // 6. 将子进程加入就绪队列
    // 7. 返回子进程PID
}
```

关键交互点：

* 用户态通过 ecall 指令触发系统调用

* 内核态通过 syscall() 函数接收并分发系统调用

* do\_fork 复制父进程内存空间

* 子进程创建成功后返回子进程PID给父进程，返回0给子进程

- exec() 系统调用

用户态执行流程：

```plain&#x20;text
// 用户程序调用 exec()
// 例如：exec("/bin/ls", argv, envp);
```

内核态执行流程：

```c++
// kern/syscall/syscall.c
static int sys_exec(uint64_t arg[]) {
    const char *name = (const char *)arg[0];
    size_t len = (size_t)arg[1];
    unsigned char *binary = (unsigned char *)arg[2];
    size_t size = (size_t)arg[3];
    return do_execve(name, len, binary, size);  // 调用核心实现
}

// kern/process/proc.c
int do_execve(const char *name, size_t len, unsigned char *binary, size_t size) {
    // 1. 释放当前进程的内存空间
    // 2. 加载新程序的ELF文件
    // 3. 建立新的内存映射（代码段、数据段、BSS段、栈）
    // 4. 设置trapframe，指向新程序的入口点
    // 5. 返回0表示成功
}
```

关键交互点：

* do\_execve 会替换当前进程的内存空间，但保持进程ID不变

* 加载新程序后，通过设置 trapframe->epc 指向程序入口点

* 从系统调用返回后，CPU会执行新程序的第一条指令

- wait() 系统调用

用户态执行流程：

```plain&#x20;text
// 用户程序调用 wait()
int status;
int pid = wait(&status);  // 等待任意子进程退出
```

内核态执行流程：

```c++
// kern/syscall/syscall.c
static int sys_wait(uint64_t arg[]) {
    int pid = (int)arg[0];
    int *store = (int *)arg[1];
    return do_wait(pid, store);  // 调用核心实现
}

// kern/process/proc.c
int do_wait(int pid, int *code_store) {
    // 1. 检查参数合法性
    // 2. 遍历子进程，查找状态为ZOMBIE的子进程
    // 3. 如果找到，回收子进程资源并返回
    // 4. 如果没找到，将父进程设为等待状态
    // 5. 返回退出子进程的PID
}
```

关键交互点：

* wait() 会使父进程进入睡眠状态，直到有子进程退出

* 子进程退出时会将状态设为ZOMBIE，并唤醒父进程

* 父进程通过 code\_store 接收子进程的退出码

- exit() 系统调用

用户态执行流程：

```c++
// user/libs/syscall.c
int sys_exit(int64_t error_code) {
    return syscall(SYS_exit, error_code);  // 调用系统调用
}
```

内核态执行流程：

```c
// kern/syscall/syscall.c
static int sys_exit(uint64_t arg[]) {
    int error_code = (int)arg[0];
    return do_exit(error_code);  // 调用核心实现
}

// kern/process/proc.c
int do_exit(int error_code) {
    // 1. 释放进程资源（内存、文件等）
    // 2. 将进程状态设为ZOMBIE
    // 3. 保存退出码
    // 4. 唤醒父进程
    // 5. 调度新进程执行
}
```

关键交互点：

* exit() 不会返回，进程直接终止

* 进程终止后进入ZOMBIE状态，等待父进程回收资源

* 父进程通过 wait() 回收子进程资源

#### 用户态与内核态的交互机制

系统调用的触发方式在用户态与内核态有所不同：当程序运行在用户态时，会通过执行 ecall 指令主动触发系统调用；而进入内核态后，系统调用则交由 stvec 寄存器所指定的中断处理入口进行处理。在参数传递机制上，用户态程序需将系统调用号置于 a0 寄存器，参数依次放入 a1 至 a5 寄存器；内核态则通过访问 trapframe 结构来获取这些用户态寄存器的值。整个执行流程的切换表现为：用户态程序通过 ecall 指令陷入内核态，由 syscall 处理程序接管后执行对应的 do\_\* 函数，完成后再返回用户态。最后，返回值由内核态放入 a0 寄存器，用户态也从同一寄存器中取得系统调用的返回结果。

#### 内核态与用户态程序的交错执行

以 fork() → exec() → exit() → wait() 为例：

```plain&#x20;text
用户态：父进程调用 fork()
内核态：创建子进程，返回子进程PID给父进程
用户态：父进程调用 wait()
内核态：父进程进入睡眠状态
用户态：子进程调用 exec()
内核态：加载新程序，替换子进程内存空间
用户态：新程序执行
用户态：新程序调用 exit()
内核态：子进程退出，设为ZOMBIE状态，唤醒父进程
内核态：父进程被调度执行
内核态：父进程回收子进程资源
用户态：父进程从 wait() 返回，继续执行
```

#### 内核态执行结果返回机制

1. 寄存器传递：简单返回值通过 a0 寄存器传递

2. 内存传递：复杂数据通过用户态提供的内存地址传递（如 wait() 的状态参数）

3. 进程状态：通过修改进程控制块的状态字段通知用户态事件

4. 信号机制：特殊事件通过信号通知进程（在更复杂的系统中）

#### 总结

用户态负责发起系统调用，处理应用逻辑，等待系统调用返回；内核态负责实现系统调用的具体功能，管理系统资源，调度进程执行。通过 ecall 指令触发系统调用进行交互，使用寄存器传递参数和返回值。

执行流程：用户态 → 内核态 → 执行核心功能 → 返回用户态



**请给出ucore中一个用户态进程的执行状态生命周期图（包执行状态，执行状态之间的变换关系，以及产生变换的事件或函数调用）。（字符方式画即可）**

```plain&#x20;text
                     ┌─────────────────┐
                     │  PROC_UNINIT    │
                     │  (未初始化)     │
                     └─────────────────┘
                             │
                             │ proc_init() / wakeup_proc()
                             ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  PROC_SLEEPING  │◄────┤  PROC_RUNNABLE  ├────►│  PROC_ZOMBIE    │
│  (睡眠)         │     │  (就绪/运行)    │     │  (僵尸)         │
└─────────────────┘     └─────────────────┘     └─────────────────┘
         │                         ▲                     │
         │ try_free_pages()         │                     │
         │ do_wait()                │                     │
         │ do_sleep()               │                     │
         ▼                         │                     │
┌─────────────────┐                │                     │
│  PROC_SLEEPING  │◄───────────────┘                     │
│  (睡眠)         │                                      │
└─────────────────┘                                      │
         │                                               │
         │ wakeup_proc()                                 │
         ▼                                               │
┌─────────────────┐                                      │
│  PROC_RUNNABLE  ├──────────────────────────────────────┘
│  (就绪/运行)    │
└─────────────────┘
```



***

## 扩展练习 Challenge

### 实现 Copy on Write （COW）机制

给出实现源码,测试用例和设计报告（包括在cow情况下的各种状态转换（类似有限状态自动机）的说明）。

本次实验中COW机制实现在仿lab自搭建的项目框架下，项目结构如下：

```plain&#x20;text
cow_test_framework/
├── Makefile
├── boot
│   └── boot.S
├── kern
│   ├── debug
│   │   └── printf.c
│   ├── mm
│   │   ├── pmm.c
│   │   ├── pmm.h
│   │   ├── vmm.c
│   │   └── vmm.h
│   ├── process
│   │   ├── proc.c
│   │   └── proc.h
│   ├── sync
│   │   └── sync.h
│   └── trap
│       └── trap.c
├── libs
│   ├── string.c
|   |—— string.h
│   └── types.h
└── user
    └── test_cow.c
```

#### COW机制概述

Copy-on-Write是一种优化技术，在进程复制时推迟页面复制直到真正需要写入时。在ucore中实现COW的主要步骤：

1. fork时设置页面为只读：父进程和子进程共享相同的物理页面，但页表项被标记为只读

2. 添加COW标志：在页表项中使用保留位标记COW页面

3. 写时触发缺页异常：当进程尝试写入COW页面时，触发页错误

4. 缺页处理程序复制页面：分配新页面，复制内容，更新页表项

5. 更新引用计数：管理共享页面的生命周期

#### COW状态转换图

```sql
                      +----------------+
                      |                |
                      |   SHARED RO    |
                      |   (Initial)    |
                      |                |
                      +-------+--------+
                              |
            fork()            | write access
            creates           | triggers page fault
            copy              |
                              v
                      +-------+--------+
                      |                |
                      |    COW PAGE    |
                      |  (Read Only)   |
                      |                |
                      +-------+--------+
                              |
        write access          | cow_copy_page()
        triggers              | allocates new page
        page fault            |
                              v
                 +------------+------------+
                 |                         |
        +--------+--------+      +---------+--------+
        |                 |      |                  |
        |  PARENT'S PAGE  |      |   CHILD'S PAGE   |
        |   (Writable)    |      |    (Writable)    |
        |                 |      |                  |
        +-----------------+      +------------------+
```

#### 状态说明

1. SHARED RO (初始状态)

   * 父子进程共享同一物理页面

   * 页表项标记为只读 + COW标志

   * 页面引用计数 = 2（父+子）

2. COW PAGE (写时触发)

   * 进程尝试写入共享页面

   * 触发缺页异常

   * COW处理程序被调用

3. 分离状态 (写后状态)

   * 分配新物理页面

   * 复制原始页面内容

   * 更新进程页表项为可写

   * 减少原始页面引用计数

#### 关键代码展示

\*具体代码参考GitHub仓库中的lab5（cha）文件夹中代码内容

```c++
// 来自pmm.c中的物理内存管理支撑
struct Page {
    int ref;            // 引用计数 - COW 核心！
    uint32_t flags;
    void *virt_addr;
};

alloc_page()    // 分配页面，ref=1
free_page()     // 减少引用计数，ref=0时才真正释放
page_ref_inc()  // 增加引用计数（fork时调用）
page_ref_dec()  // 减少引用计数（COW复制或退出时调用）
```

```c++
//来自vmm.c中的COW逻辑设定
// A. 缺页异常处理入口
int do_pgfault(struct mm_struct *mm, uint32_t error_code, uintptr_t addr) {
    // 检查是否是 COW 触发的缺页（页面存在但无写权限）
    if (*ptep & PTE_P && (*ptep & PTE_COW) && (error_code & 0x2)) {
        return handle_cow_fault(mm->pgdir, addr, error_code);
    }
}

// B. COW 缺页处理
int handle_cow_fault(pde_t *pgdir, uintptr_t addr, uint32_t error_code) {
    // 1. 检查是否为写访问导致的缺页
    // 2. 检查页表项是否有 COW 标志
    // 3. 调用 cow_copy_page() 执行复制
}

// C. COW 页面复制（实际复制发生在这里）
static int cow_copy_page(pde_t *pgdir, uintptr_t addr, pte_t *ptep) {
    // 1. 获取原物理页
    struct Page *old_page = pa2page(PTE_ADDR(*ptep));
    
    // 2. 分配新物理页
    struct Page *new_page = alloc_page();
    
    // 3. 复制内容
    memcpy(page2kva(new_page), page2kva(old_page), PGSIZE);
    
    // 4. 更新页表项：可写，移除 COW 标志
    *ptep = page2pa(new_page) | PTE_P | PTE_W | PTE_U;
    
    // 5. 更新引用计数
    page_ref_dec(old_page);  // 原页减少引用
    set_page_ref(new_page, 1); // 新页引用为1
    
    // 6. 刷新 TLB
    tlb_invalidate(pgdir, addr);
}
```

```c++
//在proc.c中完成的fork时COW设置
// A. fork() 系统调用
int fork(void) {
    // 创建子进程
    // 复制父进程内存空间（使用 COW）
    copy_mm(0, child);  // 参数 0 表示不共享地址空间
}

// B. 内存空间复制（设置 COW 标志）
int copy_range(pde_t *to, pde_t *from, uintptr_t start, uintptr_t end, bool share) {
    while (start < end) {
        if (页存在且可写) {
            // COW 关键步骤：
            // 1. 增加物理页引用计数
            page_ref_inc(page);
            
            // 2. 设置目标页表项为只读 + COW 标志
            perm = (*src_pte & PTE_U) | PTE_P | PTE_COW;
            
            // 3. 插入到子进程页表
            *dst_pte = page2pa(page) | perm;
        }
        start += PGSIZE;
    }
}
```

#### 测试程序的数据结构图

\*在实验代码中，由于用户态执行出现问题，将测试程序添加在了proc.c文件末尾，以在内核进行测试

```plain&#x20;text
进程A页表
┌─────────────────────┐
│ VA:0x4000 → PTE     │───┐
│ [PA:X | PTE_W]      │   │
└─────────────────────┘   │
                          │
进程B页表                 │ 共享同一物理页
┌─────────────────────┐   │    ┌──────────────┐
│ VA:0x4000 → PTE     │───┼───→│ 物理页 X     │
│ [PA:X | PTE_COW]    │   │    │ ref=2        │
└─────────────────────┘   │    └──────────────┘
                          │
进程B写入触发COW          │
↓                        │
新分配物理页Y←─────────────┘
┌──────────────┐    ┌──────────────┐
│ 物理页 Y     │    │ 物理页 X     │
│ ref=1        │    │ ref=1        │
│ 内容从X复制   │    │ 内容不变     │
└──────────────┘    └──────────────┘
```

#### 说明该用户程序是何时被预先加载到内存中的？与我们常用操作系统的加载有何区别，原因是什么？&#xA;

程序由内核直接调用：测试函数 `test_cow_demo()` 是内核的一部分

1. 无用户态：代码在内核空间执行

2. 无加载过程：函数已经在内核二进制中

3. 无进程隔离：使用内核地址空间

原因：

1. 简化复杂性：用户程序加载涉及文件系统、ELF解析、内存映射等复杂机制

2. 聚焦核心：COW 机制本身已经足够复杂，不需要引入加载机制

3. 快速验证：直接在内核测试可以快速验证 COW 逻辑是否正确

4. 调试方便：内核态调试比用户态调试简单
