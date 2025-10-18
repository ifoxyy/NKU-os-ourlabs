#include <pmm.h>      // 用于调用 alloc_pages, free_pages 等
#include <list.h>     // 使用 ucore 提供的链表
#include <string.h>   // 使用 memset 等
#include <defs.h>     // 使用 container_of, offsetof 等
#include <slub.h>     // 包含自己的头文件
#include <stdio.h>    // for cprintf
#include <assert.h>   // for assert

// 定义 container_of 宏
#define container_of(ptr, type, member) \
    ((type *)((char *)(ptr) - offsetof(type, member)))

// 定义 le2slab 宏
#define le2slab(le, member) \
    container_of(le, Slab, member)

//核心数据结构定义
typedef struct Slab {
    list_entry_t list;
    struct Cache *cache;
    size_t free_count;
    void *objs_start;
    unsigned char *bitmap;
} Slab;

typedef struct Cache {
    list_entry_t slabs;
    size_t obj_size;
    size_t objs_per_slab;
} Cache;

// 静态全局变量
#define MAX_CACHE_ORDER 11 // 最大支持 2^11 = 2048 字节的对象
static Cache *cache_map[MAX_CACHE_ORDER + 1];
static Cache *kmem_cache_cache;

// 前向声明
static Cache *kmem_cache_create(size_t size); // 需要前向声明，因为 slub_init 可能调用它
static struct Slab *create_new_slab(Cache *cache);

// 地址转换辅助函数
static inline void *page2kva(struct Page *page) {
    return (void *)(page2pa(page) + va_pa_offset);
}

static inline struct Page *kva2page(void *kva) {
    return pa2page(PADDR(kva));
}

// 核心辅助函数
static size_t roundup_pow_of_2(size_t size) {
    if (size == 0) return 0;
    size_t rounded = 1;
    while (rounded < size) {
        rounded <<= 1;
    }
    return rounded;
}

static size_t get_order(size_t size) {
    size_t order = 0;
    size_t temp = 1;
    while (temp < size) {
        temp <<= 1;
        order++;
    }
    return order;
}

// 内部辅助函数
static struct Slab *create_new_slab(Cache *cache) {
    struct Page *page = alloc_page();
    if (page == NULL) {
        return NULL;
    }
    Slab *slab = (Slab *)page2kva(page);
    list_init(&(slab->list));
    slab->cache = cache;
    slab->free_count = cache->objs_per_slab;
    size_t bitmap_size = (cache->objs_per_slab + 7) / 8;
    slab->bitmap = (unsigned char *)(slab + 1);
    slab->objs_start = (void *)((uintptr_t)slab->bitmap + bitmap_size);
    memset(slab->bitmap, 0, bitmap_size);
    page->page_link.next = (list_entry_t *)slab;
    list_add(&(cache->slabs), &(slab->list));
    return slab;
}

static void *slab_alloc_object(Slab *slab) {
    if (slab->free_count == 0) return NULL;
    Cache *cache = slab->cache;
    for (size_t i = 0; i < cache->objs_per_slab; ++i) {
        if (!(slab->bitmap[i / 8] & (1 << (i % 8)))) {
            slab->bitmap[i / 8] |= (1 << (i % 8));
            slab->free_count--;
            return (void *)((uintptr_t)slab->objs_start + i * cache->obj_size);
        }
    }
    return NULL;
}

static void slab_free_object(Slab *slab, void *obj) {
    Cache *cache = slab->cache;
    size_t obj_index = ((uintptr_t)obj - (uintptr_t)slab->objs_start) / cache->obj_size;
    if (obj_index >= cache->objs_per_slab) panic("kfree: object pointer out of slab range!");
    slab->bitmap[obj_index / 8] &= ~(1 << (obj_index % 8));
    slab->free_count++;
}


void slub_init(void) {
    cprintf("slub_init: bootstrapping slub allocator\n");
    memset(cache_map, 0, sizeof(cache_map));

    // 1. 为第一个 Slab 申请一页内存
    struct Page *page = alloc_page();
    if (page == NULL) {
        panic("slub_init: failed to allocate page for bootstrapping");
    }
    void *page_kva = page2kva(page);

    // 2. 建立一个临时的、位于栈上的 temp_cache 来引导
    Cache temp_cache;
    temp_cache.obj_size = sizeof(Cache);
    list_init(&(temp_cache.slabs)); // 把它自己初始化一下
    size_t slab_header_size = sizeof(Slab);
    size_t available_space = PGSIZE - slab_header_size;
    temp_cache.objs_per_slab = (available_space * 8) / (temp_cache.obj_size * 8 + 1);

    // 3. 在页内存开头建立 Slab 结构
    Slab *initial_slab = (Slab *)page_kva;
    list_init(&(initial_slab->list));
    initial_slab->free_count = temp_cache.objs_per_slab;
    size_t bitmap_size = (temp_cache.objs_per_slab + 7) / 8;
    initial_slab->bitmap = (unsigned char *)(initial_slab + 1);
    initial_slab->objs_start = (void *)((uintptr_t)initial_slab->bitmap + bitmap_size);
    memset(initial_slab->bitmap, 0, bitmap_size);

    // 4.在调用前，让 initial_slab->cache 指向这个临时的 temp_cache
    initial_slab->cache = &temp_cache;
    
    // 5. 现在，从这个 Slab 中安全地分配出第一个对象
    kmem_cache_cache = (Cache *)slab_alloc_object(initial_slab);
    if (kmem_cache_cache == NULL) {
        panic("slub_init: failed to allocate kmem_cache_cache from initial slab");
    }

    // 6. 用正确的值初始化真正的 kmem_cache_cache
    kmem_cache_cache->obj_size = sizeof(Cache);
    kmem_cache_cache->objs_per_slab = temp_cache.objs_per_slab;
    list_init(&(kmem_cache_cache->slabs));
    
    // 7. 把 initial_slab 完整地加入到 kmem_cache_cache 中
    initial_slab->cache = kmem_cache_cache; // 把指针修正回指向真正的 cache
    page->page_link.next = (list_entry_t *)initial_slab;
    list_add(&(kmem_cache_cache->slabs), &(initial_slab->list));
}



// kmalloc 的一个辅助函数，用于创建新的 Cache
static Cache *kmem_cache_create(size_t size) {
    // 1. 从 kmem_cache_cache 中为新的 Cache 结构体分配内存
    void *obj = NULL;
    list_entry_t *head = &(kmem_cache_cache->slabs);
    list_entry_t *le;
    for (le = list_next(head); le != head; le = list_next(le)) {
        Slab *slab = le2slab(le, list);
        if (slab->free_count > 0) {
            obj = slab_alloc_object(slab);
            break;
        }
    }
    // 如果 kmem_cache_cache 自己也满了，为它创建新 slab
    if (obj == NULL) {
        Slab *new_slab = create_new_slab(kmem_cache_cache);
        if (new_slab == NULL) {
            return NULL;
        }
        obj = slab_alloc_object(new_slab);
    }
    if (obj == NULL) return NULL;

    Cache *cache = (Cache *)obj;
    
    // 2. 初始化这个新的 Cache
    cache->obj_size = size;
    list_init(&(cache->slabs));
    
    size_t slab_header_size = sizeof(Slab);
    size_t available_space = PGSIZE - slab_header_size;
    cache->objs_per_slab = (available_space * 8) / (cache->obj_size * 8 + 1);
    
    // 3. 将其注册到 cache_map 中以便快速查找
    size_t order = get_order(size);
    if (order <= MAX_CACHE_ORDER) {
        cache_map[order] = cache;
    }

    return cache;
}

void *kmalloc(size_t size) {
    if (size == 0) return NULL;
    if (size > (1 << MAX_CACHE_ORDER)) {
        // 大内存直接走页分配器
        return NULL; 
    }

    // 1. 计算所需对象的最小 2^N 大小
    size_t rounded_size = roundup_pow_of_2(size);
    size_t order = get_order(rounded_size);

    // 2. 从 cache_map 中查找 Cache
    Cache *cache = cache_map[order];

    // 3. 如果 Cache 不存在，就动态创建一个
    if (cache == NULL) {
        cache = kmem_cache_create(rounded_size);
        if (cache == NULL) {
            return NULL; // 创建失败
        }
    }

    list_entry_t *head = &(cache->slabs);
    list_entry_t *le;
    for (le = list_next(head); le != head; le = list_next(le)) {
        Slab *slab = le2slab(le, list);
        if (slab->free_count > 0) {
            return slab_alloc_object(slab);
        }
    }

    Slab *new_slab = create_new_slab(cache);
    if (new_slab == NULL) {
        return NULL;
    }

    return slab_alloc_object(new_slab);
}

void kfree(void *p) {
    if (p == NULL) {
        return;
    }

    struct Page *page = kva2page(p);
    Slab *slab = (Slab *)(page->page_link.next);
    Cache *cache = slab->cache;

    slab_free_object(slab, p);

    if (slab->free_count == cache->objs_per_slab) {
        list_del(&(slab->list));
        free_page(page);
    }
}

void slub_check(void) {
    cprintf("slub_check: starting correctness check...\n");

    // --- Test 1: Basic allocation and free ---
    cprintf("  - Test 1: Basic allocation and free...\n");
    void *p1 = kmalloc(30);
    assert(p1 != NULL);
    kfree(p1);
    cprintf("    - Basic alloc/free: OK\n");

    // --- Test 2: Free and re-allocation ---
    cprintf("  - Test 2: Free and re-allocation...\n");
    void *p2 = kmalloc(30);
    assert(p2 == p1);
    kfree(p2);
    cprintf("    - Re-allocation: OK\n");

    // --- Test 3: Cross-slab allocation ---
    cprintf("  - Test 3: Cross-slab allocation...\n");

    // 1. 手动找到或创建 32 字节的 Cache
    size_t test_size = 32;
    size_t rounded_size = roundup_pow_of_2(test_size); // 结果还是 32
    size_t order = get_order(rounded_size);          // 结果是 5 (2^5=32)

    Cache *cache32 = cache_map[order];
    if (cache32 == NULL) {
      // 如果 slub_init 没有预创建，我们就在这里创建它
         cache32 = kmem_cache_create(rounded_size);
         assert(cache32 != NULL);
    }

    // 2. 从 Cache 结构体中获取正确的 objs_per_slab 值
    size_t num_objs = cache32->objs_per_slab;
    assert(num_objs > 0);

    // 3. 后续的分配/释放循环和原来一样，但数组大小要安全
    #define MAX_TEST_OBJS 256 // 假设 objs_per_slab 不会超过这个数
    static void *pointers[MAX_TEST_OBJS];
    assert(num_objs < MAX_TEST_OBJS);

    // 分配，直到填满一个 slab
    for (int i = 0; i < num_objs; i++) {
         pointers[i] = kmalloc(test_size);
         assert(pointers[i] != NULL);
    }

    // 再分配一个，触发新 Slab
    pointers[num_objs] = kmalloc(test_size);
    assert(pointers[num_objs] != NULL);

    // ... 后续的地址唯一性检查和释放循环 ...
    for (int i = 0; i <= num_objs; i++) {
       kfree(pointers[i]);
    }
    cprintf("    - Cross-slab alloc/free for size %d: OK\n", test_size);
    
    // --- Test 4: Mixed size allocation ---
    cprintf("  - Test 4: Mixed size allocation...\n");
    void *p_32 = kmalloc(32);
    void *p_64 = kmalloc(64);
    void *p_128 = kmalloc(128);
    assert(p_32 != NULL && p_64 != NULL && p_128 != NULL);
    kfree(p_32);
    kfree(p_128);
    void *p_32_new = kmalloc(32);
    assert(p_32_new == p_32);
    void *p_512 = kmalloc(512);
    assert(p_512 != NULL);
    kfree(p_64);
    kfree(p_512);
    kfree(p_32_new);
    cprintf("    - Mixed size alloc/free: OK\n");

    // --- Test 5: Data integrity ---
    cprintf("  - Test 5: Data integrity...\n");
    char *char_p = kmalloc(40);
    strcpy(char_p, "hello world");
    assert(strcmp(char_p, "hello world") == 0);
    kfree(char_p);
    int *int_p = kmalloc(40);
    *int_p = 0xDEADBEEF;
    assert(*int_p == 0xDEADBEEF);
    kfree(int_p);
    cprintf("    - Data integrity: OK\n");

    cprintf("slub_check: all tests passed!\n");

    // --- Test 6: Non-power-of-2 size allocation ---
    cprintf("  - Test 6: Non-power-of-2 size allocation...\n");
    // 请求一个“尴尬”的大小，比如 33 字节
    void *p33 = kmalloc(33);
    assert(p33 != NULL);

    // 它应该从 64 字节的 Cache 中分配出来
    // 我们可以通过 kfree 的逻辑来间接验证
    // (因为 kfree 能找到正确的 Slab，就说明分配时路由到了正确的 Cache)
    kfree(p33);

    // 再次分配，应该得到相同的地址
    void *p33_new = kmalloc(33);
    assert(p33_new == p33);
    kfree(p33_new);

    // --- Test 7: Dynamic Cache creation ---
    cprintf("  - Test 7: Dynamic Cache creation...\n");
    // 选择一个可能还没有被创建过的 Cache，比如 400 字节 (会被规整到 512)
    size_t test_size_large = 200;
    size_t rounded_size_large = roundup_pow_of_2(test_size_large); // 512
    size_t order_large = get_order(rounded_size_large);           // 9

    // 检查 Cache 是否还不存在
    assert(cache_map[order_large] == NULL);

    // 第一次为这个大小分配内存，应该会触发 Cache 的创建
    void *p400 = kmalloc(test_size_large);
    assert(p400 != NULL);

    // 再次检查，现在 Cache 应该存在了
    assert(cache_map[order_large] != NULL);
    assert(cache_map[order_large]->obj_size == 256);

    kfree(p400);
    cprintf("    - Dynamic Cache creation for size %d: OK\n", test_size_large);
}