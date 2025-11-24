## 练习1：分配并初始化一个进程控制块

alloc\_proc函数（位于kern/process/proc.c中）负责分配并返回一个新的struct proc\_struct结构，用于存储新建立的内核线程的管理信息。ucore需要对这个结构进行最基本的初始化。

### 设计实现过程介绍

`alloc_proc` 函数负责分配并初始化一个新的进程控制块（`struct proc_struct`）。作为进程创建的第一步，需要确保所有字段都处于一个确定的安全初始状态。

#### 代码实现

```c
static struct proc_struct *
alloc_proc(void)
{
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
    if (proc != NULL)
    {
        // LAB4:EXERCISE1 
        proc->state = PROC_UNINIT;        // 进程状态：未初始化
        proc->pid = -1;                   // 进程ID：未分配（-1表示无效）
        proc->runs = 0;                   // 运行次数：初始为0
        proc->kstack = 0;                 // 内核栈地址：未分配
        proc->need_resched = 0;           // 不需要重新调度
        proc->parent = NULL;              // 父进程指针：无父进程
        proc->mm = NULL;                  // 内存管理结构：内核线程通常为NULL
        memset(&(proc->context), 0, sizeof(struct context)); // 上下文清零
        proc->tf = NULL;                  // 陷阱帧指针：未设置
        proc->pgdir = NULL;               // 页目录基址：未分配页表
        proc->flags = 0;                  // 进程标志：无特殊标志
        memset(proc->name, 0, PROC_NAME_LEN + 1); // 进程名初始化为空字符串
    }
    return proc;
}
```

### 初始化字段说明

1. state：设置为 `PROC_UNINIT`，表示进程处于未初始化状态

2. pid：设置为 -1，表示尚未分配有效进程ID

3. runs：初始化为 0，记录进程运行次数

4. kstack：设置为 0，内核栈地址待后续分配

5. need\_resched：设置为 0，初始不需要调度

6. parent：设置为 NULL，创建时无父进程

7. mm：设置为 NULL，内核线程不管理用户空间内存

8. context：全部清零，上下文信息待后续设置

9. tf：设置为 NULL，陷阱帧指针待后续设置

10. pgdir：设置为 NULL，页表目录待后续分配

11. flags：设置为 0，无特殊进程标志

12. name：全部清零，进程名待后续设置

* 说明proc\_struct中`struct context context`和`struct trapframe *tf`成员变量含义和在本实验中的作用是什么

### struct context 上下文结构

#### 含义和作用

`struct context` 用于保存进程/线程的执行上下文，主要在进程切换时保存和恢复关键的寄存器状态。

#### 在实验中的作用

1. 进程切换保存：当从当前进程切换出去时，将其上下文保存到 `from->context`

2. 进程切换恢复：当切换到目标进程时，从 `to->context` 恢复其执行上下文

3. 确保连续性：保证进程被再次调度时能够从上次中断的位置继续执行

#### 使用场景

在 `switch_to` 函数中实现上下文切换：

```c
// 保存当前上下文，恢复目标上下文
switch_to(&(prev->context), &(next->context));
```

### struct trapframe 陷阱帧结构

#### 含义和作用

`struct trapframe` 用于保存进程在陷入内核时的完整处理器状态，包括所有通用寄存器、控制状态寄存器等。

#### 在实验中的作用

1. 中断/异常处理：当发生中断、异常或系统调用时，自动保存用户态进程的完整状态

2. 内核线程创建：在 `kernel_thread` 和 `copy_thread` 中初始化新进程的执行环境

3. 状态恢复：从内核态返回用户态时，恢复进程的完整状态

4. 系统调用参数传递：通过寄存器传递系统调用参数和返回值

#### 使用场景

```c
// 在 copy_thread 中设置新进程的陷阱帧
proc->tf = (struct trapframe *)(proc->kstack + KSTACKSIZE - sizeof(struct trapframe));*(proc->tf) = *tf;
proc->tf->gpr.a0 = 0;  // 子进程返回值
```

***

#### 练习2：为新创建的内核线程分配资源

创建一个内核线程需要分配和设置好很多资源。kernel\_thread函数通过调用**do\_fork**函数完成具体内核线程的创建工作。do\_kernel函数会调用alloc\_proc函数来分配并初始化一个进程控制块，但alloc\_proc只是找到了一小块内存用以记录进程的必要信息，并没有实际分配这些资源。ucore一般通过do\_fork实际创建新的内核线程。do\_fork的作用是，创建当前内核线程的一个副本，它们的执行上下文、代码、数据都一样，但是存储位置不同。因此，我们**实际需要"fork"的东西就是stack和trapframe**。在这个过程中，需要给新内核线程分配资源，并且复制原进程的状态。在kern/process/proc.c中完成do\_fork函数中的处理过程。它的大致执行步骤包括：

* 调用alloc\_proc，首先获得一块用户信息块。

* 为进程分配一个内核栈。

* 复制原进程的内存管理信息到新进程（但内核线程不必做此事）

* 复制原进程上下文到新进程

* 将新进程添加到进程列表

* 唤醒新进程

* 返回新进程号

```c++
int do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf)
{
    int ret = -E_NO_FREE_PROC;
    struct proc_struct *proc;
    if (nr_process >= MAX_PROCESS)
    {
        goto fork_out;
    }
    ret = -E_NO_MEM;

    //    1. call alloc_proc to allocate a proc_struct
    proc = alloc_proc();
    if (proc == NULL) {
        goto fork_out;
    }

    //    2. call setup_kstack to allocate a kernel stack for child process
    if (setup_kstack(proc) != 0) {
        goto bad_fork_cleanup_proc;
    }

    //    3. call copy_mm to dup OR share mm according clone_flag
    if (copy_mm(clone_flags, proc) != 0) {
        goto bad_fork_cleanup_kstack;
    }

    //    4. call copy_thread to setup tf & context in proc_struct
    copy_thread(proc, stack, tf);

    //    5. insert proc_struct into hash_list && proc_list
    bool intr_flag;
    local_intr_save(intr_flag);
    {
        proc->pid = get_pid();
        hash_proc(proc);
        list_add(&proc_list, &(proc->list_link));
        nr_process++;
    }
    local_intr_restore(intr_flag);

    //    6. call wakeup_proc to make the new child process RUNNABLE
    wakeup_proc(proc);

    //    7. set ret vaule using child proc's pid
    ret = proc->pid;
    
fork_out:
    return ret;

bad_fork_cleanup_kstack:
    put_kstack(proc);
bad_fork_cleanup_proc:
    kfree(proc);
    goto fork_out;
}
```

##### 请说明ucore是否做到给每个新fork的线程一个唯一的id？请说明你的分析和理由。

首先，在do\_fork()函数中通过proc->pid = get\_pid();指令调用了get\_pid()函数，这个函数的具体内容如下：

```c++
static int
get_pid(void)
{
    static_assert(MAX_PID > MAX_PROCESS);
    struct proc_struct *proc;
    list_entry_t *list = &proc_list, *le;
    static int next_safe = MAX_PID, last_pid = MAX_PID;
    if (++last_pid >= MAX_PID)
    {
        last_pid = 1;
        goto inside;
    }
    if (last_pid >= next_safe)
    {
    inside:
        next_safe = MAX_PID;
    repeat:
        le = list;
        while ((le = list_next(le)) != list)
        {
            proc = le2proc(le, list_link);
            if (proc->pid == last_pid)
            {
                if (++last_pid >= next_safe)
                {
                    if (last_pid >= MAX_PID)
                    {
                        last_pid = 1;
                    }
                    next_safe = MAX_PID;
                    goto repeat;
                }
            }
            else if (proc->pid > last_pid && next_safe > proc->pid)
            {
                next_safe = proc->pid;
            }
        }
    }
    return last_pid;
}
```

`get_pid` 函数的核心在于通过维护一个动态的安全边界来优化性能，确保在绝大多数情况下能够快速分配，同时在必要时进行彻底的冲突检查。

1. 先通过 `++last_pid` 对静态变量 `last_pid` 递增，函数首先检查递增后的 `last_pid` 是否达到了系统规定的上限（`MAX_PID`），如果达到，则将其回绕到1重新开始，并需要立即进行冲突检测。

2. 接下来是安全边界检查， `next_safe` 变量记录了从当前 `last_pid` 开始，第一个遇到的已被占用的PID值。如果当前的 `last_pid` 小于 `next_safe`，说明它处于一个已知安全的区间内，函数会直接将其作为新PID返回。

3. 如果 `last_pid` 大于等于 `next_safe`，或者因回绕触发了冲突检测（进入inside），函数便会进入检查循环，它会遍历系统中所有已存在的进程。遍历过程中有两种主要情况：一是发现某个进程的PID与 `last_pid` 冲突，此时函数会将 `last_pid` 加一，如果新的 `last_pid` 超出了当前的安全边界，则需要重置安全边界并重新开始扫描过程；二是发现某个进程的PID大于当前的 `last_pid` 但小于当前的 `next_safe`，函数会将 `next_safe` 更新为该PID值缩小安全范围。

4. 这个循环会持续进行，直到找到一个未被任何现有进程使用的 `last_pid`。最终，函数返回这个经过验证的唯一PID。

**关于id的唯一性**，`static_assert(MAX_PID > MAX_PROCESS);`确保了 PID 空间大于最大进程数，理论上总是存在可用的 PID。

***

#### 练习3：编写proc\_run 函数

proc\_run用于将指定的进程切换到CPU上运行。它的大致执行步骤包括：

* 检查要切换的进程是否与当前正在运行的进程相同，如果相同则不需要切换。

* 禁用中断。你可以使用`/kern/sync/sync.h`中定义好的宏`local_intr_save(x)`和`local_intr_restore(x)`来实现关、开中断。

* 切换当前进程为要运行的进程。

* 切换页表，以便使用新进程的地址空间。`/libs/riscv.h`中提供了`lsatp(unsigned int pgdir)`函数，可实现修改SATP寄存器值的功能。

* 实现上下文切换。`/kern/process`中已经预先编写好了`switch.S`，其中定义了`switch_to()`函数。可实现两个进程的context切换。

* 允许中断。

```c++
// proc_run - 使进程"proc"在CPU上运行
// 注意：在调用switch_to之前，应该加载"proc"的新PDT基地址
void proc_run(struct proc_struct *proc)
{
    if (proc != current)  // 检查目标进程是否与当前进程相同
    {
        bool intr_flag;
        struct proc_struct *prev = current;  // 保存当前进程

        // 步骤1：禁用中断，确保进程切换的原子性
        local_intr_save(intr_flag);

        /* 步骤2：切换当前进程指针到新进程 */
        current = proc;

        /* 步骤3：必要时切换页表 */
        if (proc->pgdir != prev->pgdir)
        {
            lsatp((unsigned int)proc->pgdir);  // 修改SATP寄存器，切换页表
        }

        /* 步骤4：更新运行计数并清除调度请求 */
        proc->runs += 1;         // 增加进程运行次数
        proc->need_resched = 0;  // 清除需要重新调度的标志

        /* 步骤5：从prev到proc的上下文切换 */
        switch_to(&prev->context, &proc->context);

        // 步骤6：恢复中断
        local_intr_restore(intr_flag);
    }
}
```

##### `proc_run()` 函数的详细执行流程：

1\. **进程检查**

```c
if (proc != current)
```

如果要运行的进程就是当前正在运行的进程，直接跳过切换过程；避免不必要的上下文切换开销。

2\. **中断保护**

```c
local_intr_save(intr_flag);
```

保存当前中断状态并禁用中断；确保进程切换过程的原子性，防止在切换过程中被中断打断，如果切换过程被打断，可能导致进程状态不一致。

3\. **当前进程指针更新**

```c
current = proc;
```

更新全局变量 `current`，指向新要运行的进程，此后所有对当前进程的引用都将指向新进程。

4\. **页表切换**

```c
if (proc->pgdir != prev->pgdir)
{
    lsatp((unsigned int)proc->pgdir);
}
```

只有当新旧进程使用不同的页目录时才需要切换页表，`lsatp()`函数修改RISC-V的SATP寄存器，加载新进程的页目录基地址，切换后，CPU看到的虚拟地址空间变为新进程的地址空间。

5\. **进程状态更新**

```c
proc->runs += 1;
proc->need_resched = 0;
```

`runs`记录进程被调度的次数，用于统计和调试，`need_resched`清除重新调度标志，表示进程现在正在运行。

6\. **上下文切换（核心步骤）**

```c
switch_to(&prev->context, &proc->context);
```

这是最关键的一步，`switch_to` 函数（在 `switch.S` 中实现）会：

**保存当前进程上下文**：

* 将当前所有寄存器的值保存到 `prev->context` 结构中

* 包括返回地址(ra)、栈指针(sp)等关键寄存器

**恢复新进程上下文**：

* 从 `proc->context` 结构中恢复新进程的寄存器值

* 当 `switch_to` 返回时，CPU状态已经完全切换到新进程

**重要特性**：

* 当 `switch_to` 返回时，实际上是在新进程的上下文中返回

* 新进程会从它上次被切换出去的地方继续执行

7\. **中断恢复**

```c
local_intr_restore(intr_flag);
```

恢复之前保存的中断状态，如果之前中断是启用的，现在重新启用中断。



##### 在本实验的执行过程中，创建且运行了几个内核线程？

创建且运行了两个内核线程，`idleproc` 和`initproc`。

***

## 扩展练习 Challenge 1

1. 说明语句`local_intr_save(intr_flag);....local_intr_restore(intr_flag);`是如何实现开关中断的？

### 代码实现

```c++
         // 步骤1：禁用中断，确保进程切换的原子性
        local_intr_save(intr_flag);
        /* 步骤2：切换当前进程指针到新进程 */
        current = proc;

        /* 步骤3：必要时切换页表 */
        if (proc->pgdir != prev->pgdir)
        {
            lsatp((unsigned int)proc->pgdir);  // 修改SATP寄存器，切换页表
        }

        /* 步骤4：更新运行计数并清除调度请求 */
        proc->runs += 1;         // 增加进程运行次数
        proc->need_resched = 0;  // 清除需要重新调度的标志

        /* 步骤5：从prev到proc的上下文切换 */
        switch_to(&prev->context, &proc->context);

        // 步骤6：恢复中断
        local_intr_restore(intr_flag);
```

### 3.1 宏定义与函数声明

开关中断功能通过一组精心设计的宏和内联函数实现：

```c++
// 开关中断的宏定义
#define local_intr_save(x)      do { x = __intr_save(); } while (0)
#define local_intr_restore(x)   __intr_restore(x);

// 底层中断控制函数
static inline bool __intr_save(void);
static inline void __intr_restore(bool flag);
static inline void intr_disable(void);
static inline void intr_enable(void);
```

#### 3.2.1 中断禁用过程 (`local_intr_save`)

```c++
static inline bool __intr_save(void) {
    // 读取sstatus寄存器的当前值
    uintptr_t sstatus_val = read_csr(sstatus);
    
    // 检查SIE位是否被设置（中断是否启用）
    if (sstatus_val & SSTATUS_SIE) {
        // 如果中断原本是启用的，则禁用中断
        intr_disable();
        return 1;  // 返回true表示中断原本是启用的
    }
    return 0;  // 返回false表示中断原本就是禁用的
}

static inline void intr_disable(void) {
    // 清除sstatus寄存器的SIE位来禁用中断
    clear_csr(sstatus, SSTATUS_SIE);
}
```

执行流程：

1. 读取 `sstatus` 寄存器的当前状态

2. 检查 `SSTATUS_SIE` 位（第1位）的值

3. 如果中断原本启用：清除 `SIE` 位禁用中断，返回 `true`

4. 如果中断原本禁用：保持现状，返回 `false`

#### 3.2.2 中断恢复过程 (`local_intr_restore`)

```c++
static inline void __intr_restore(bool flag) {
    // 根据保存的状态标志决定是否重新启用中断
    if (flag) {
        intr_enable();
    }
    // 如果flag为false，则保持中断禁用状态不变
}

static inline void intr_enable(void) {
    // 设置sstatus寄存器的SIE位来启用中断
    set_csr(sstatus, SSTATUS_SIE);
}
```

执行流程：

1. 检查传入的 `intr_flag` 参数

2. 如果为 `true`：设置 `SIE` 位重新启用中断

3. 如果为 `false`：不进行任何操作，保持中断禁用状态

### 3.3 RISC-V 架构的 CSR 操作

底层通过 RISC-V 的 CSR（Control and Status Register）指令实现：

```java
// 读取CSR寄存器
#define read_csr(reg) ({ \
    unsigned long __tmp; \
    asm volatile ("csrr %0, " #reg : "=r"(__tmp)); \
    __tmp; \
})

// 设置CSR寄存器位
#define set_csr(reg, bit) ({ \
    asm volatile ("csrs " #reg ", %0" :: "r"(bit)); \
})

// 清除CSR寄存器位
#define clear_csr(reg, bit) ({ \
    asm volatile ("csrc " #reg ", %0" :: "r"(bit)); \
})
```

***

## 扩展练习 Challenge 2

#### 深入理解不同分页模式的工作原理（思考题）

分页的核心思想是将虚拟地址空间和物理地址空间划分为固定大小的块（页），并通过页表建立映射关系。

##### 单级页表

虚拟地址直接划分为页号和页内偏移量，通过单一的页表进行地址转换：`物理地址 = 页表[页号] × 页大小 + 偏移量`，每次地址转换只需一次内存访问（不考虑TLB）。

\*一个虚拟地址高20位作为索引即页号，低12位作为偏移，`页表[页号]`就是在页表中查页号得到的物理页框号，我们需要用它计算物理地址。

##### 二级页表

* 虚拟地址被划分为：页目录索引、页表索引、页内偏移量

* 两级查找过程：

  1. 通过页目录索引找到页表物理地址

  2. 通过页表索引找到物理页框号

  3. 组合得到物理地址

\*虚拟地址的31-22位是页目录索引，21-12位是页表索引，11-0位是偏移量。

* CR3寄存器存储的是页目录的物理地址

* 页目录项中存储的是页表的物理地址

* 页表项中存储的是数据页的物理地址

首先获取页目录的物理地址；然后用物理地址直接访问页目录，使用虚拟地址中提取的页目录索引可以通过公式获得页目录项地址（页目录项地址 = 页目录的物理地址+ 页目录索引 × 4）；从页目录项获取页表物理地址；再用物理地址直接访问页表，通过虚拟地址中储存的页表索引得到页表项地址；读取页表项中的数据页物理地址；最终物理地址 = 数据页物理地址 + 偏移量。

##### 三级页表

* 虚拟地址划分为：VPN\[2]、VPN\[1]、VPN\[0]和页内偏移量

* 三级查找过程：

  1. 一级页目录（根页表）查找

  2. 二级页目录查找

  3. 页表查找

  4. 获得物理页框号

\*具体过程与上述类似，只是多了一层索引。

#### get\_pte()函数（位于`kern/mm/pmm.c`）用于在页表中查找或创建页表项，从而实现对指定线性地址对应的物理页的访问和映射操作。这在操作系统中的分页机制下，是实现虚拟内存与物理内存之间映射关系非常重要的内容。

##### get\_pte()函数中有两段形式类似的代码， 结合sv32，sv39，sv48的异同，解释这两段代码为什么如此相像。

Sv32, Sv39, Sv48 都采用树形层次结构，只是层级数不同

每一级的执行逻辑完全相同，用索引查找下一级页表的地址，如果不存在就创建；标志位定义也基本一致（PTE\_V, PTE\_R, PTE\_W等）。

##### 目前get\_pte()函数将页表项的查找和页表项的分配合并在一个函数里，你认为这种写法好吗？有没有必要把两个功能拆开？

当前代码查找和分配在同一个函数内完成，避免了竞态条件，在需要分配时减少了函数调用开销；但是违反了函数的单一职责原则，一个函数承担了太多责任，而且两段分配逻辑极其相似，还需要测试查找成功、分配成功、分配失败等多种路径，很复杂。

**拆分方案：**

可以提取页表分配核心逻辑，设计ensure\_pde\_exists函数确保单个页表项有效，分配物理页并初始化：

```sql
static int 
ensure_pde_exists(pde_t *pdep, bool create) {
    if (*pdep & PTE_V) {
        return 0;  // 已经存在
    }
    if (!create) {
        return -E_NOT_EXIST;
    }
    struct Page *page = alloc_page();
    if (page == NULL) {return -E_NO_MEM;}// 公共的初始化逻辑
    set_page_ref(page, 1);
    uintptr_t pa = page2pa(page);
    memset(KADDR(pa), 0, PGSIZE);
    *pdep = pte_create(page2ppn(page), PTE_U | PTE_V);
    return 0;
}
```

&#x20;     重构get\_pte，变得很简洁

```c++
pte_t *get_pte(pde_t *pgdir, uintptr_t la, bool create) {
    // 第一级处理
    pde_t *pdep1 = &pgdir[PDX1(la)];
    if (ensure_pde_exists(pdep1, create) != 0) {
        return NULL;
    }
    
    // 第二级处理
    pde_t *pdep0 = &((pde_t *)KADDR(PDE_ADDR(*pdep1)))[PDX0(la)];
    if (ensure_pde_exists(pdep0, create) != 0) {
        return NULL;
    }
    
    // 返回最终页表项
    return &((pte_t *)KADDR(PDE_ADDR(*pdep0)))[PTX(la)];
}
```
