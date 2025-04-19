---
title: "One infrastructure migration equals two disaster recoveries"
layout: single
date: 2025-02-08 14:49:14 +0400
comments: true
categories: DevOps
---

To paraphrase a proverb, "One infrastructure migration equals two disaster
recoveries" [^1]. Well, I had to move not two but 25 services. Some are
dockerised, some are running in legacy VMs managed with Chef, and one very old
VM that used to be a dedicated server more than a decade ago, with a jumble of
legacy half-abandoned websites and mail services.

While all the services are internal and not customer-facing, there are some
critical for the team and infrastructure. To avoid much service disruption and
downtime, I decided to move services one at a time so I could deploy and test
the service on the new infrastructure, shut down the old one, re-sync the data
and switch the DNS (almost forgot to lower DNS TTL before the move) with the
option to roll-back to the old service if anything goes wrong. Beforehand, I
created a table in Notion with all service resource requirements, SLAs,
inter-dependencies, priorities and nice color labels. Had this table open in
front of me for almost two months.

The initial infrastructure preparation was a clean greenfield - made it all
modern, fresh and shiny. While I had time, I started with the most complex and
important services, refreshed them, threw away a lot of organic-growth stuff,
and re-wrote some Chef cookbooks to Ansible. When the deadline started
approaching, it became a kind of a slog - move the service, search all the
configuration spread for IPs to update[^2], get the service working, repeat,
preferably early in the morning. The team also dropped on me two other
projects(including a major OS upgrade) with the same deadline to keep the
pressure. Had a lot of overtime and even broke my anti-burnout rule of not
working full-time on weekends once. Ironically, I managed to follow Parkinson’s
law and finished by retiring the old infrastructure exactly at the deadline,
the last day of the month.

But there are still a lot of small broken parts to fix and old dust and junk to
clear. Still sorting out and prioritising my ToDo list as it added more than a
hundred items during the migration. Two major things to re-work - remove as
much as possible from the Chef attributes and re-organize packet filter rules
management.

Also, had some interesting and surprising moments:

The first one was when the hosting provider moved an IP from one server to
another, and I started seeing incoming traffic for the IP on both the old and
the new servers simultaneously.
I was monitoring the traffic with tcpdump on both servers to catch the moment
when the IP switch was about to happen.  At first, I suspected their network
engineer somehow managed to mirror the traffic and even sent them a message, as
I was clearly getting ‘host unreachable’ from the old server public IP, but I
didn’t stop investigating. The IP wasn’t responding even locally, though I
double-checked that it was assigned to a VM and that a route was configured
properly. When I got a ‘host unreachable’ message from an internal IP from the
old server, it all became clear. There was an IPSec tunnel between the old and
the new servers, and the IP was still routed to the old server through the
tunnel.  The confusing part was that the packets coming in through the IPSec
tunnel on the old server were seen as coming through normal ethernet. The irony
is that I had already prepared IPSec reconfiguration, and it was the next step
in my checklist.

The second was a chicken-and-egg problem. To move the Chef server, I needed to
reconfigure load balancers, but the load balancers’ configuration was managed
with Chef. Ended up changing the configuration manually.

The third was a little adventure with a new secondary server at the old hosting
provider. They delayed its delivery for a month. When I got access to its
console, it wasn’t even re-imaged with a fresh Debian; it was a used node from
the provider’s cloud solution. Their netboot image was running Alpine version
from 2019, and their netboot installer didn’t have anything newer than Debian
Buster. Their netboot didn’t support UEFI boot with GPT, and I found it the
hard way. It also explained why they failed to re-image the server.
Re-partitioned the disks with MBR, installed Debian 10, and followed with two
immediate upgrades to Bullseye and Bookworm. Almost entire day wasted doing
someone else work. And then I had to wait 24h for them to re-route an IP to
this server. Oh, and the disks had 50K power-on hours on a supposedly new
server. My expectations were adjusted lower with every interaction with these
guys. But in the end, most services were moved from this provider and we got
twice the capacity for a lower price.


Notes:

[^1]: I discovered that in the English proverb, two or three moves equal one house fire, but in the Russian version, the proportion is opposite - one move equals two house fires.

[^2]: There is an anti-pattern with Chef in that it accumulates a lot of information in attributes, which are spread along different places - node/role/environments, and they are not versioned and hard to search globally. Luckily, I have a daily dump of all roles/nodes/environments/data bags as JSON files, so I have an option to grep through them.
