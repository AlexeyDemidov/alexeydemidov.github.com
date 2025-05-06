---
layout: single
title: "Falsehoods people (and LLMs) believe about Linux swap and OOM."
date: 2025-05-05 12:00:00 +0400
comments: true
categories: DevOps
---


- ###### Swap is useless
False, even if a system has a lot of memory, swap allows for better memory
utilisation by swapping out allocated but rarely used anonymous memory pages.

- ###### Swap is going to slow down your system by its mere presence
False, as long as the system has enough memory, there would be very little or
no swap-related I/O, so there is no slowdown.

- ###### It is really bad if you have some memory swapped out [^1]
False, the kernel swapped out some unused pages, and the memory can be
allocated for something more useful, like file cache.

- ###### swap is going to wear out your SSD [^2]
False, as long as there is no swap-related I/O, there is no wearing out of the
SSD. And modern SSDs have enough resources to handle swap-related I/O anyway.

- ###### Swap is an emergency solution for out-of-memory conditions
False, once your working set exceeds actual physical memory, swap makes things
worse, causing swap thrashing and a slower OOM trigger.

- ###### Swap allows running workloads that exceed the system's physical memory
False, once your active working set exceeds actual physical memory, you are for some swap thrashing.

- ###### Swap size should be double the amount of the physical memory.
False. Unless the system has megabytes of memory instead of gigabytes. If you
allocate more than a few GB of swap size, you are going for a long swap
thrashing session when you run out of memory and before OOM gets triggered.[^6]

- ###### Swap use begins based on the vm.swappiness threshold (e.g. when 40% of RAM remains for vm.swappiness=40). [^3]
False. Before the introduction of [the split-LRU design](https://linux-mm.org/PageReplacementDesign) in kernel version 2.6.28
in 2008, there used to be [a different algorithm](https://lwn.net/Articles/83588/) 
that used the percentage of allocated memory, but it was more complicated and
with the `vm.swappiness=40`, it wouldn't start swapping even if all memory was
allocated from processes and with the default `vm.swappiness=60` it would start
swapping and 80% memory allocation. This algorithm is no longer in use.

- ###### Swap aggressiveness is configured using vm.swappiness and it is linear between 0 and 100 [^4]
  - with vm.swappiness=0 kernel won't swap
  - with vm.swappiness=100 kernel is going to swap out everything from memory right away
  - vm.swappiness=60 is too agressive
  - vm.swappiness=10 is just right setting


[^1]: [a ServerFault post](https://serverfault.com/questions/1179908/will-full-swap-slow-down-the-server-even-though-ram-is-free)
[^2]: [a ServerFault post](https://serverfault.com/a/1180029/23022)
[^3]: [an Ask Ubuntu post](https://askubuntu.com/questions/969065/why-is-swap-being-used-when-vm-swappiness-is-0/969072)
[^4]: [Another Ask Ubuntu post](https://askubuntu.com/questions/103915/how-do-i-configure-swappiness)

