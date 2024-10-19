---
layout: post
title: "Why is it always just a single SQL statement causing a major performance regression?"
date: 2024-10-19 11:11:13 +0400
comments: true
categories: DevOps Performance
---

A few weeks ago, I had to investigate a batch job that was taking more than 3
hours to run every night.  The DB was the obvious bottleneck, as the job was
hitting it so hard that I noticed excessive load even before the business
started complaining. Before looking into the details, I assumed that the
application code was doing some loops internally, retrieving mostly the same
data again and again. I started preparing myself to dive into the code for a
week to untangle data flows, imagining the horrors of multi-page SQL
statements.

But “Premature optimisation is the root of all evil”, so first things first:
enable detailed monitoring and collect query statistics for a day. The next
morning, there is some data:  the code is hitting mostly a single table with a
simple query but with WHERE on a column without an index. Add an index, maybe
it will help improve the performance before I have to dive into the code.

The next morning, I check the DB graphs, and there is no load at all.  Did the
job run? Did someone disable it? Did I change something, causing the job to
crash?

Checking the application logs. The job did run. And completed successfully. In
10 minutes.  One single index reduced run time from more than 3 hours to 10
minutes. The classic “one hit with the hammer but you need to know where to
hit”.

On the other hand, I’m trying to imagine what someone who “doesn’t know where
to hit” and has no visibility into the database and application performance
would do to solve this issue. Just crank up the instance size? I suspect they
would end up paying ten times more.
