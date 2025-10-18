#include <pmm.h>
#include <list.h>
#include <string.h>
#include <buddy_pmm.h>
#include <stdio.h>

free_area_t free_area;

#define free_list (free_area.free_list)
#define nr_free (free_area.nr_free)

// 每个order的空闲链表
static list_entry_t buddy_free_lists[MAX_ORDER + 1];

// 记录每个页面对应的order
static int page_orders[1 << 20]; // 假设最大1M页

// 判断两个块是否是伙伴
static bool is_buddy(struct Page *base, struct Page *p, int order) {
    // 检查p是否在有效范围内
    if (p < base || p >= base + (1 << MAX_ORDER)) {
        return 0;
    }
    
    // 计算两个页面的索引差
    unsigned long diff = p - base;
    
    // 伙伴关系：两个块大小相同，且它们的索引满足特定关系
    // 对于order为k的块，其伙伴的索引是 idx ^ (1 << k)
    unsigned long idx1 = (p - base);
    unsigned long idx2 = (base - base); // 总是0
    
    // 简化判断：检查p是否是对应order的空闲块
    return PageProperty(p) && page_orders[p - base] == order;
}

static void
buddy_init(void) {
    // 初始化每个order的空闲链表
    for (int i = 0; i <= MAX_ORDER; i++) {
        list_init(buddy_free_lists + i);
    }
    nr_free = 0;
}

static void
buddy_init_memmap(struct Page *base, size_t n) {
    assert(n > 0);
    
    // 初始化所有页面
    struct Page *p = base;
    for (; p != base + n; p++) {
        assert(PageReserved(p));
        p->flags = 0;
        SetPageProperty(p);
        set_page_ref(p, 0);
    }
    
    nr_free += n;
    
    // 找到最大的2的幂次方来存放这些页面
    size_t size = 1;
    int order = 0;
    while (size * 2 <= n) {
        size *= 2;
        order++;
    }
    
    // 将整个内存区域作为一个大块添加到对应order的链表中
    base->property = size;
    page_orders[base - base] = order;
    list_add(&(buddy_free_lists[order]), &(base->page_link));
    
    // 如果有剩余页面，递归初始化
    if (n > size) {
        buddy_init_memmap(base + size, n - size);
    }
}

static struct Page *
buddy_alloc_pages(size_t n) {
    assert(n > 0);
    if (n > nr_free) {
        return NULL;
    }
    
    // 找到满足 2^order >= n 的最小order
    int order = 0;
    size_t size = 1;
    while (size < n) {
        size <<= 1;
        order++;
    }
    
    // 从当前order开始，向上查找可用的块
    int current_order = order;
    struct Page *page = NULL;
    
    while (current_order <= MAX_ORDER) {
        if (!list_empty(&buddy_free_lists[current_order])) {
            // 找到可用的块
            list_entry_t *le = list_next(&buddy_free_lists[current_order]);
            page = le2page(le, page_link);
            list_del(le);
            break;
        }
        current_order++;
    }
    
    if (page == NULL) {
        return NULL; // 没有找到合适的块
    }
    
    // 如果找到的块比需要的大，进行分割
    while (current_order > order) {
        current_order--;
        size >>= 1; // 块大小减半
        
        // 创建伙伴块
        struct Page *buddy = page + size;
        buddy->property = size;
        page_orders[buddy - page] = current_order;
        SetPageProperty(buddy);
        
        // 将伙伴块添加到对应order的链表
        list_add(&buddy_free_lists[current_order], &(buddy->page_link));
        
        // 更新当前块的属性
        page->property = size;
        page_orders[page - page] = current_order;
    }
    
    nr_free -= size;
    ClearPageProperty(page); // 标记为已分配
    return page;
}

static void
buddy_free_pages(struct Page *base, size_t n) {
    assert(n > 0);
    
    // 找到对应的order
    int order = 0;
    size_t size = 1;
    while (size < n) {
        size <<= 1;
        order++;
    }
    
    struct Page *p = base;
    for (int i = 0; i < size; i++) {
        assert(!PageReserved(p) && !PageProperty(p));
        p->flags = 0;
        set_page_ref(p, 0);
    }
    
    base->property = size;
    page_orders[base - base] = order;
    SetPageProperty(base);
    nr_free += size;
    
    // 尝试合并伙伴块
    int current_order = order;
    struct Page *current_block = base;
    
    while (current_order < MAX_ORDER) {
        // 计算伙伴块的地址
        unsigned long block_index = current_block - base;
        unsigned long buddy_index = block_index ^ (1 << current_order);
        struct Page *buddy = base + buddy_index;
        
        // 检查伙伴块是否存在且大小相同且空闲
        if (buddy >= base + (1 << MAX_ORDER) || 
            !PageProperty(buddy) || 
            page_orders[buddy_index] != current_order ||
            buddy->property != (1 << current_order)) {
            break; // 不能合并
        }
        
        // 从链表中移除伙伴块
        list_del(&(buddy->page_link));
        
        // 合并块（取地址较小的那个作为新块）
        if (current_block > buddy) {
            struct Page *temp = current_block;
            current_block = buddy;
            buddy = temp;
        }
        
        // 更新合并后块的属性
        current_order++;
        current_block->property = 1 << current_order;
        page_orders[current_block - base] = current_order;
    }
    
    // 将最终块（可能是合并后的）添加到对应order的链表
    list_add(&buddy_free_lists[current_order], &(current_block->page_link));
}

static size_t
buddy_nr_free_pages(void) {
    return nr_free;
}

static void
buddy_check(void) {
    cprintf("=== Buddy System Check ===\n");
    
    // 测试基础分配释放
    struct Page *p0, *p1, *p2;
    p0 = p1 = p2 = NULL;
    
    assert((p0 = buddy_alloc_pages(1)) != NULL);
    assert((p1 = buddy_alloc_pages(2)) != NULL);
    assert((p2 = buddy_alloc_pages(1)) != NULL);
    
    cprintf("Allocation test passed.\n");
    
    buddy_free_pages(p0, 1);
    buddy_free_pages(p1, 2);
    buddy_free_pages(p2, 1);
    
    cprintf("Free test passed.\n");
    
    // 测试伙伴合并
    p0 = buddy_alloc_pages(1);
    p1 = buddy_alloc_pages(1);
    
    // p0和p1应该是伙伴
    assert(p1 == p0 + 1 || p0 == p1 + 1);
    
    buddy_free_pages(p0, 1);
    buddy_free_pages(p1, 1);
    
    // 合并后应该能分配一个大小为2的块
    p2 = buddy_alloc_pages(2);
    assert(p2 != NULL);
    buddy_free_pages(p2, 2);
    
    cprintf("Buddy merge test passed.\n");
    cprintf("=== Buddy System Check Finished ===\n");
}

const struct pmm_manager buddy_pmm_manager = {
    .name = "buddy_pmm_manager",
    .init = buddy_init,
    .init_memmap = buddy_init_memmap,
    .alloc_pages = buddy_alloc_pages,
    .free_pages = buddy_free_pages,
    .nr_free_pages = buddy_nr_free_pages,
    .check = buddy_check,
};