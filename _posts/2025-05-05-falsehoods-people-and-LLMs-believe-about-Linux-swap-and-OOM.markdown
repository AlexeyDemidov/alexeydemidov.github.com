---
layout: single
title: "Falsehoods people (and LLMs) believe about Linux swap and OOM."
date: 2026-05-05 12:00:00 +0400
comments: true
categories: DevOps
---


###### Swap is useless
False, even if a system has a lot of memory, swap allows for better memory
utilisation by swapping out allocated but rarely used anonymous memory pages.

###### Swap is going to slow down your system by its mere presence
False, as long as the system has enough memory, there would be very little or
no swap-related I/O, so there is no slowdown.

###### It is really bad if you have some memory swapped out [^1]
False, the kernel swapped out some unused pages, and the memory can be
allocated for something more useful, like file cache.

###### swap is going to wear out your SSD [^2]
False, as long as there is no swap-related I/O, there is no wearing out of the
SSD. And modern SSDs have enough resources to handle swap-related I/O anyway.

###### Swap is an emergency solution for out-of-memory conditions
False, once your working set exceeds actual physical memory, swap makes things
worse, causing swap thrashing and a slower OOM trigger.

###### Swap allows running workloads that exceed the system's physical memory
False, once your active working set exceeds actual physical memory, you are for some swap thrashing.

###### Swap size should be double the amount of the physical memory.
False. Unless the system has megabytes of memory instead of gigabytes. If you
allocate more than a few GB of swap size, you are going for a long swap
thrashing session when you run out of memory and before OOM gets triggered.[^6]

###### Swap use begins based on the vm.swappiness threshold, e.g. when 40% of RAM remains for `vm.swappiness=40`. [^3]
False. Before the introduction of [the split-LRU design](https://linux-mm.org/PageReplacementDesign) in kernel version 2.6.28
in [2008](https://github.com/torvalds/linux/commit/4f98a2fee8acdb4ac84545df98cccecfd130f8db), there used to be [a different algorithm](https://lwn.net/Articles/83588/) 
that used the percentage of allocated memory, but it was more complicated and
with the `vm.swappiness=40`, it wouldn't start swapping even if all memory was
allocated from processes and with the default `vm.swappiness=60` it would start
swapping at 80% memory allocation. This algorithm is no longer in use.

###### Swap aggressiveness is configured using vm.swappiness and it is linear between and 100 [^4]
False. `vm.swappiness` was first described in the kernel documentation in
[2009](https://github.com/torvalds/linux/commit/db0fb1848a645b0b1b033765f3a5244e7afd2e3c)
with the following text:
> This control is used to define how aggressive the kernel will swap
memory pages.  Higher values will increase aggressiveness, lower values
decrease the amount of swap.  A value of 0 instructs the kernel not to initiate
swap until the amount of free and file-backed pages is less than the high water
mark in a zone.

It doesn't say that the relation between `vm.swappiness` and aggressiveness is
linear but people made assumptions.

This description is still present in [some texts on
kernel.org](https://www.kernel.org/doc/Documentation/sysctl/vm.txt) (this file
isn't present in the kernel tree anymore, and it wasn't updated since 2019).

The documentation was updated in [2020](https://github.com/torvalds/linux/commit/c843966c556d7370bb32e7319a6d164cb8c70ae2) to [a more appropriate description](https://docs.kernel.org/admin-guide/sysctl/vm.html#swappiness) and the values up to 200 were allowed.

###### With vm.swappiness=0 kernel won't swap
False, if the kernel hits the high water mark in any zone, then it is going to swap anyway.
###### with vm.swappiness=100 kernel is going to swap out everything from memory right away
False, if there is no memory pressure, the kernel isn't going to swap anything.
###### vm.swappiness=60 is too agressive
False, the `vm.swappiness` value 60 means that `anon_prio` is assigned the
value of 60 and `file_prio` the value of `200 - 60 = 140`. The resulting ratio
`140/60` means that the kernel would evict `2.33` times more pages from the
page cache than swap out anonymous pages.

The default value of `60` was chosen with the assumption that the file I/O
operations, which tend to be sequential, are more effective than random swap
I/O, but this applies to rotating media like HDDs only. For SSDs,
`vm.swappiness=100` is more appropriate.

As the documentation states:
> For in-memory swap, like zram or zswap, as well as hybrid setups that have
> swap on faster devices than the filesystem, values beyond 100 can be
> considered

###### vm.swappiness=10 is just the right setting
This value gives a ratio of 19 times preference for discarding page cache over
swapping out. Maybe, if you are swapping to a floppy disk, this setting is just
right.


[^1]: [a ServerFault post](https://serverfault.com/questions/1179908/will-full-swap-slow-down-the-server-even-though-ram-is-free)
[^2]: [a ServerFault post](https://serverfault.com/a/1180029/23022)
[^3]: [an Ask Ubuntu post](https://askubuntu.com/questions/969065/why-is-swap-being-used-when-vm-swappiness-is-0/969072)
[^4]: [Another Ask Ubuntu post](https://askubuntu.com/questions/103915/how-do-i-configure-swappiness)

