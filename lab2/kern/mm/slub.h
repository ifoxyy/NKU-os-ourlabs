#ifndef __KERN_MM_SLUB_H__
#define __KERN_MM_SLUB_H__

#include <defs.h> // 包含 size_t 等基本类型定义

// slub 分配器的初始化函数
void slub_init(void);

// 分配 size 大小的内存，这是你最终要对外提供的核心功能函数
// kmalloc 是 "kernel malloc" 的缩写，是标准的内核内存分配函数名
void *kmalloc(size_t size);

// 释放 p 指向的内存
void kfree(void *p);

#endif /* __KERN_MM_SLUB_H__ */