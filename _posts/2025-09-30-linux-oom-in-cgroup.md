---
layout: single
title: Linux page reclaim and OOM in a cgroup
date: 2025-09-30 15:54:30 +0400
comments: true
categories: Linux
---

Page reclaim is triggered when the kernel tries to allocate a page, but the charge would exceed `memory.current` > `memory.high` or `memory.current` > `memory.max`. 

If the kernel is unable to reclaim enough pages when `memory.current` > `memory.max`, then the OOM killer is invoked, and by default, the largest process in the cgroup is killed. The kernel does [`16`][1] attempts to reclaim the pages before invoking the OOM killer.

If the kernel is unable to reclaim enough pages when `memory.current` > `memory.high`, then the OOM killer is never invoked, but the allocating process (not the entire cgroup) is throttled proportionally to the number of pages above `memory.high` limit.

With the classic split-LRU, the reclaim process checks pages at the tails of the inactive file LRU and, if swap is enabled, of the inactive anon LRU. 

- If a page doesn't have its "accessed" bit set by the CPU, then it is considered inactive and can be reclaimed. 
- If a page in the inactive file LRU isn't dirty and doesn't need to be written back to disk, then it is discarded and reclaimed. If it is dirty, then it is scheduled for writeback but can't be reclaimed yet in this reclaim pass.
- If a page in the inactive anon LRU already has a copy in swap (it was swapped in but wasn't modified by the process), then it is discarded; otherwise, it is scheduled for swap out. 

The kernel scans the inactive file and the inactive anon LRUs proportionally to `vm.swappiness` settings. If the kernel needs to reclaim 200 pages and `vm.swappiness` has the default `60` value, the kernel tries to reclaim 60 pages from the inactive anon LRU and 140 pages from the inactive file LRU. If the OOM is about to be invoked, then this proportion is ignored and the kernel reclaims whatever it can get. 

The swap usage for a cgroup is controlled with `memory.swap.max` and `memory.swap.high` limits. `memory.swap.max` is the hard limit for swap usage and exceeding `memory.swap.high` causes throttling. Default values are `max`, so the limits are disabled. 

When inactive LRUs are reduced by the reclaim process below [a specific proportion between active and inactive LRU size][2], then the kernel shrinks an active LRU by moving pages from its tail almost unconditionally to the corresponding inactive LRU to restore the minimal proportion.

Originally published as an answer on [serverfault.com][3].

[1]:https://github.com/torvalds/linux/blob/5aca7966d2a7255ba92fd5e63268dd767b223aa5/mm/internal.h#L533
[2]:https://github.com/torvalds/linux/blob/5aca7966d2a7255ba92fd5e63268dd767b223aa5/mm/vmscan.c#L2291
[3]:https://serverfault.com/a/1192826/23022
