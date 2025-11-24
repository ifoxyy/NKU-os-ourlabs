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

这是最关键的一步，`switch_to` 函数（在 `switch.S` 中实现）会保存前一个进程的寄存器上下文，恢复新进程的上下文。函数参数是前一个进程和后一个进程的process context。

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

## 答辩问题解答补充

### 1.哈希表

哈希表的初始化过程在kern\process\proc.c文件中，具体是**proc\_init函数**中：

```c++
void proc_init(void)
{
    int i;
    list_init(&proc_list);
    // 初始化哈希表
    for (i = 0; i < HASH_LIST_SIZE; i++)
    {
        list_init(hash_list + i);
    }
    // ......
}
```

文件头部有如下**关于哈希表的定义**：

```c++
#define HASH_SHIFT 10
#define HASH_LIST_SIZE (1 << HASH_SHIFT)
#define pid_hashfn(x) (hash32(x, HASH_SHIFT))
static list_entry_t hash_list[HASH_LIST_SIZE];
```

表示使用 10位 作为哈希键的位数，由此可以计算哈希表的大小为 1024（2的10次方）个桶。

定义根据PID计算哈希桶索引的函数，`hash32(x, HASH_SHIFT)`是32位哈希函数，返回 0 到 1023 的值，结果用于索引哈希表：`hash_list[pid_hashfn(pid)]`。

libs\list.h中的**list\_init()函数**的定义如下：

```c++
static inline void
list_init(list_entry_t *elm) {
    elm->prev = elm->next = elm;
}
```

这是一个双向循环链表的初始化函数，用于将一个链表节点初始化为空的双向循环链表。

**初始化过程：**

首先循环遍历所有哈希桶，对每个哈希桶调用 `list_init()` 函数进行初始化。每个哈希桶是一个双向链表的头节点，初始化后形成自指向的空循环链表，为后续存储进程节点做好准备。

当进程创建时，系统会根据进程的PID通过哈希函数计算得到桶索引，将进程控制块添加到对应的哈希链表中，这样以后我们就能通过PID快速查找特定进程，比遍历全局链表快很多。



### 2.返回ret

在`proc_run()`中调用了函数：

```c
switch_to(&prev->context, &proc->context);
```

`switch_to()`函数定义在`switch.S`中：

```c
switch_to:
    # save from's registers
    STORE ra, 0*REGBYTES(a0)
    STORE sp, 1*REGBYTES(a0)
    STORE s0, 2*REGBYTES(a0)
    STORE s1, 3*REGBYTES(a0)
    STORE s2, 4*REGBYTES(a0)
    STORE s3, 5*REGBYTES(a0)
    STORE s4, 6*REGBYTES(a0)
    STORE s5, 7*REGBYTES(a0)
    STORE s6, 8*REGBYTES(a0)
    STORE s7, 9*REGBYTES(a0)
    STORE s8, 10*REGBYTES(a0)
    STORE s9, 11*REGBYTES(a0)
    STORE s10, 12*REGBYTES(a0)
    STORE s11, 13*REGBYTES(a0)

    # restore to's registers
    LOAD ra, 0*REGBYTES(a1)
    LOAD sp, 1*REGBYTES(a1)
    LOAD s0, 2*REGBYTES(a1)
    LOAD s1, 3*REGBYTES(a1)
    LOAD s2, 4*REGBYTES(a1)
    LOAD s3, 5*REGBYTES(a1)
    LOAD s4, 6*REGBYTES(a1)
    LOAD s5, 7*REGBYTES(a1)
    LOAD s6, 8*REGBYTES(a1)
    LOAD s7, 9*REGBYTES(a1)
    LOAD s8, 10*REGBYTES(a1)
    LOAD s9, 11*REGBYTES(a1)
    LOAD s10, 12*REGBYTES(a1)
    LOAD s11, 13*REGBYTES(a1)

    ret
```

由于我们在`copy_thread()`函数中将`ra`寄存器设定成了`forkret`函数的入口，所以这里会返回到`forkret`函数。

```c
static void
copy_thread(struct proc_struct *proc, uintptr_t esp, struct trapframe *tf)
{
    ...

    // 设置上下文中的返回地址(ra)为forkret函数入口
    // 当进程第一次被调度时，会从这里开始执行
    proc->context.ra = (uintptr_t)forkret;
    
    ...
}
```

`forkret`中调用 `forkrets` 函数，并传递当前进程的陷阱帧指针 `current->tf` 作为参数。

```c
static void
forkret(void)
{
    forkrets(current->tf);
}
```

`forkrets` 函数定义在`kern/trap/trapentry.S`中：

```c
    .globl forkrets
forkrets:
    # set stack to this new process's trapframe
    move sp, a0
    j __trapret
```

将栈指针 `sp` 设置为 `a0` 寄存器中的值（`current->tf`），并跳转`__trapret`执行：

```c
    .globl __trapret
__trapret:
    RESTORE_ALL
    # go back from supervisor call
    sret
```

`RESTORE_ALL` 宏使用 `sp`直接从中断帧里面恢复所有的寄存器。

这样就实现了新进程的上下文切换。

### 3. 状态寄存器

`kernel_thread_entry` 是一个汇编函数，作为所有内核线程的统一入口点：

```c++
kernel_thread_entry:
    # 从寄存器中获取函数指针和参数
    move a0, s1    # 将参数(arg)放入a0寄存器
    jalr s0        # 跳转到线程函数(fn)
    
    # 线程函数返回后的处理
    call do_exit   # 调用进程退出函数
```

执行流程：

1. 从 `s1` 寄存器获取线程参数，放入 `a0` 寄存器（参数传递）

2. 跳转到 `s0` 寄存器指向的线程主函数

3. 当线程函数返回时，调用 `do_exit` 清理进程资源

#### 完整的执行序列

```c++
// 在 kernel_thread 中设置：
tf.gpr.s0 = (uintptr_t)fn;        // 线程主函数指针
tf.gpr.s1 = (uintptr_t)arg;       // 线程参数
tf.epc = (uintptr_t)kernel_thread_entry;  // 线程入口点
// 当新线程第一次被调度执行时：
1. 从陷阱帧恢复寄存器状态
2. 程序计数器(PC)设置为 EPC 的值 (kernel_thread_entry)
3. 开始执行 kernel_thread_entry 汇编代码
4. kernel_thread_entry 调用实际的线程函数 fn(arg)
5. 线程函数返回后执行清理工作
```

### 4.中断

#### 中断开关的具体实现原理

##### &#x20;`local_intr_save(intr_flag)` 的底层操作

```c++
#define local_intr_save(x) do { x = __intr_save(); } while (0)

static inline bool __intr_save(void) {
    if (read_csr(sstatus) & SSTATUS_SIE) {  // 检查当前中断是否启用
        intr_disable();                     // 禁用中断
        return 1;                           // 返回true表示原本中断是启用的
    }
    return 0;                               // 返回false表示原本中断就是禁用的
}

static inline void intr_disable(void) {
    clear_csr(sstatus, SSTATUS_SIE);       // 清除SIE位，禁用中断
}
```

RISC-V 架构的 SSTATUS 寄存器：

Bit 1: SIE (Supervisor Interrupt Enable)

* 0 = 禁用所有中断

* 1 = 启用中断（时钟中断、软件中断、外部中断）

##### &#x20;`local_intr_restore(intr_flag)` 的恢复机制

```c++
#define local_intr_restore(x) __intr_restore(x);

static inline void __intr_restore(bool flag) {
    if (flag) {                            // 如果原本中断是启用的
        intr_enable();                     // 重新启用中断
    }
    // 否则保持中断禁用状态
}

static inline void intr_enable(void) {
    set_csr(sstatus, SSTATUS_SIE);        // 设置SIE位，启用中断
}
```

