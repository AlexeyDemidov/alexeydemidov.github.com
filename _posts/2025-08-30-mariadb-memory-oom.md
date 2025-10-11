---
layout: single
title: MariaDB gets unexpected OOM
date: 2025-08-30 11:40:30 +0400
comments: true
categories: DevOps
---

MariaDB has recently surprised me by getting itself OOM-killed, even though the VM had a couple of GB of spare memory (as I thought). At first, I suspected it was some kind of memory spike, but the VM memory graph showed that it had been sitting just a few MB from the memory limit for some time before the OOM. That was unexpected, too.  Started digging around and found that `pmm-agent` ate 1GB of RAM, but it is still not enough. Finally, checked the OOM task dump in the logs, and, indeed, MariaDB was using about 25% more memory than my calculations estimated. The 11 GB InnoDB with the default other settings gave me an expected 12 GB, and even the `memory_used` system variable reported the same 12 GB, but the actual process RSS was 15 GB.

Digging through the web, mailing lists and documentation, I discovered that it is a [known][2] and [documented][1] problem with the default system malloc. The solution is to replace it with `jemalloc` or `tcmalloc`, which is also [documented][3]. In my case, memory consumption dropped by 40%.

Curiously, it survived without OOMs for months after the last InnoDB size change. As I discovered, MariaDB can monitor for memory pressure events through `/proc/pressure/memory` and, on detecting memory pressure, it drops all non-dirty pages from the InnoDB buffer pool and marks them with `MADV_FREE`. That hovering just a few MB from the memory limit was the result of this behaviour, as the kernel reclaimed only the small amount of pages. After the OOM, I added the `MemoryHigh` limit to the MariaDB systemd unit to give MariaDB a bit of early memory pressure, and was surprised that it wasn't able to fill its InnoDB buffer. The logs indicated that the InnoDB buffer was reset multiple times per hour. That behaviour to drop almost the entire InnoDB buffer is a bit of an overreaction, and it was [disabled][4] by default in MariaDB 10.11.12 (not yet in the Bookworm).


[1]:https://mariadb.com/docs/general-resources/community/community/bug-tracking/profiling-memory-usage#system-malloc-is-not-good-if-there-are-a-lot-of-allocations-of-different-size
[2]:https://jira.mariadb.org/browse/MDEV-30889
[3]:https://mariadb.com/docs/server/server-management/install-and-upgrade-mariadb/installing-mariadb/compiling-mariadb-from-source/compiling-mariadb-with-extra-modulesoptions/using-mariadb-with-tcmalloc-or-jemalloc
[4]:https://jira.mariadb.org/browse/MDEV-34863
