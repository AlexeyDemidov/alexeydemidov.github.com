---
layout: single
title: "Linux Inactive Memory"
date: 2025-05-13 17:16:42 +0400
comments: true
categories: Linux
---

Since the introduction of [the split-LRU design](https://linux-mm.org/PageReplacementDesign) in version 2.6.28, the
kernel maintains 4 (actually 5) LRU (least recently used) lists for memory
pages:

- Active anon pages
- Active file pages
- Inactive anon pages
- Inactive file pages
- (unevictabled pages)

The total sizes of these pages are reported in `vmstat` and `/proc/meminfo`
```
$ vmstat -s | head -5
    131669088 K total memory
     69020576 K used memory
     56007124 K active memory
     29691936 K inactive memory
      6140772 K free memory

$ cat /proc/meminfo | grep -i active
Active:         56007676 kB
Inactive:       29691936 kB
Active(anon):   34381776 kB
Inactive(anon): 16134108 kB
Active(file):   21625900 kB
Inactive(file): 13557828 kB
```

These lists are maintained for the purpose of the page reclaim. When the kernel needs to allocate some memory pages and there are not enough free pages, the kernel goes through the LRU lists, trying to find pages that can be reclaimed. The pages are organised in LRU lists so the kernel can reclaim these pages that weren't used recently and are supposedly least likely to be used soon.

The kernel goes through both inactive anon and inactive file LRU lists, starting from their tails while maintaining the proportion specified by `vm.swappiness` between the reclaimed anon and file pages. With the default value `vm.swappiness=60`, when the kernel needs `200` pages, it is going to reclaim `60` pages from inactive anon LRU and `140` pages from inactive file LRU, but if there are not enough pages available, it won't keep the balance and is going to reclaim whatever it finds.

When a file-backed page is reclaimed, it can be discarded right away if it isn't modified, or it needs to be written back into the file. An anon page always needs to be written into a swap when reclaimed, so it is more expensive to reclaim anon pages.

So far, so good - we established the purpose of the separation of the memory into active/inactive, so the kernel knows which pages to reclaim.

Now the main question: how exactly does the kernel decide which page is active and which is not?

The problem is that the kernel can't really track all memory access, and the hardware provides only one single bit of information - if the page was ever accessed. It doesn't know when it was accessed and how many times. The kernel works around this by periodically scanning the pages and clearing the 'Accessed' bit and looking at this bit again on the next scan. But it doesn't scan all the pages all the time. Only when the kernel needs some memory pages, it scans the tail of the inactive LRU, and it stops the scan when it finds enough pages. So, most of the pages don't get activity information updated.

To illustrate this: a newly allocated page starts its life on the head of the inactive LRU with the 'Accessed' bit reset to 0. As the other new pages are allocated, our page is getting pushed back to the tail of the inactive LRU. If the page gets accessed by the user space program, the CPU sets the 'Accessed' bit to 1. The page can be accessed many times, but it is still considered inactive until the reclaim scan reaches this page position in the inactive LRU from the tail. Pages get promoted to the active LRU on the second (some are on the first) scan if they have the 'Accessed' bit set. If a page doesn't get promoted to the active LRU, it gets reclaimed if it is at the tail end of the inactive LRU and the kernel needs some free pages. Once a page gets to the active LRU, it is considered active even if it isn't accessed there at all. Until the active list grows too large or the inactive list gets too small by the reclaim, there is no change to the active list and pages in the active list are not scanned at all and more active pages are never moved to the head within the active LRU.

The kernel maintains a specific ratio between the active and inactive LRU, depending on the memory size (since v4.10):
```
 * total     target    max
 * memory    ratio     inactive
 * -------------------------------------
 *   10MB       1         5MB
 *  100MB       1        50MB
 *    1GB       3       250MB
 *   10GB      10       0.9GB
 *  100GB      31         3GB
 *    1TB     101        10GB
 *   10TB     320        32GB

```
When the kernel needs to grow the inactive LRU, it moves pages from the tail of the active LRU regardless of their activity status, except for file-backed executable pages, which get promoted back to the head of the active LRU.

Even though the design of active/inactive LRUs is to reference active and inactive pages, the kernel intentionally spends minimal effort to maintain these lists (for performance reasons), so the information about the pages in these lists is outdated most of the time for most of the pages.

What can we actually tell about the pages in the LRUs?

-  The page at the head of the active list was accessed just recently. It was accessed once or twice, or a million times.
- The page at the tail of the active list was accessed some time ago when it was added to the head of the list. It could have been accessed a million times or zero times while being in the active list.
- The page at the head of the inactive list was just allocated or it was just pushed out of the active list where it spent unknown time and has been accessed zero or million times.
- The page in the middle of the inactive list was allocated some time ago, and we don't know if it has been accessed yet. Until it is scanned, it can be accessed zero times or a million times.
- The pages at the tail of the inactive list are only pages that have accurate information, but only when they are scanned.  We also still don't know if they were accessed more than once. We also don't know if they are going to be accessed again, but at least this is expected.

So the more appropriate name for the 'Inactive' LRU would be 'candidates for the reclaim', and for 'active' - 'not considered for the reclaim yet'. The numbers derived from the lengths of these LRUs and reported as Active/Inactive memory in `/proc/meminfo` have little relation to the actual working set size.
