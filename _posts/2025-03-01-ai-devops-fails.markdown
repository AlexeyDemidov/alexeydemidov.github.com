---
layout: single
title: "AI fails with DevOps tasks"
date: 2025-03-01 15:54:43 +0400
comments: true
categories: DevOps
---

Did a quick evaluation and comparison between ChatGPT and Claude on my typical
task to decide if the Claude subscription discount offer is worth it. All
models failed miserably on a simple and straightforward task of creating a
single Terraform resource. The caveat is that this resource was implemented
relatively recently by AWS (in 2021) and in the Terraform AWS provider (10
months ago).

The initial question is simple: “How to add rDNS for AWS EIP with Terraform”.
All models answered that Terraform doesn’t support it natively and offered a
workaround with “local-exec” and call to “aws ec2 modify-address-attribute”.
Claude gave the correct parameter “—domain-name”, both 4o and o3-mini-high
hallucinated parameter names  “—reverse-dns-name” and “—reverse-dns”.

Given a correction that Terraform does support this natively, the models
started hallucinating by inventing or repurposing “aws_eip” resource
attributes. 4o suggested using the “domain” attribute, which is not related to
DNS. o3-mini-high invented “reverse_dns” block for “aws_eip” resource. Claude
suggested assigning the “reverse_dns” attribute, which doesn’t exist.
Interestingly, with web search enabled, 4o was able to find the correct
“aws_eip_domain_name” resource. Both Claude and o3 went back to suggesting
using “local-exec” and inventing random resource names like “aws_ec2_address”,
“aws_ec2_address_attribute”, “aws_eip_reverse_dns”. 

I have noticed that o3 is much more stubborn, and if it goes a wrong way, it is
almost impossible to correct - a few weeks ago, it tried to correct me that
MySQL 9 doesn’t exist.  Not sure if the new Claude works the same way, but at
least it is much more cheerful. Sill gave that subscription option a pass as
there is no improvement, and these tasks are still too challenging for AIs.
