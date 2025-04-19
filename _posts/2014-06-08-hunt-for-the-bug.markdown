---
layout: single
title: "hunt for the bug"
date: 2014-06-08 14:41:46 +0400
comments: true
categories: [Ruby on Rails]
---

Spent three days last week hunting for mysterious bug which caused
`factory_girl` factories randomly fail with `Trait not registered: class`
message during full test suite run, but when you run all controller or model
tests separately -- everything is fine and all tests which were failing during
full run worked perfectly. 

At first I ignored this issue -- I had just added two new factories, which
coincidentally used `class` parameter in their definition to specify generated
class explicitly, and I needed these factories to test code I was working on
and I though that I'll fix or just remove these factories later. 

But as it usually happens it wasn't simple as I thought. Suddenly I discovered
that tests started failing with the same symptoms on common `develop` branch
and not on only topic branch. And I broke tests already in two other places, so
clean up was really needed.

First two days I spent trying to find out what happening in `factory_girl`
internals using old-school print logging and later pry-debugger but without
much success except that I was able to locate single spec file in
`spec/workers/` which caused failure of all consecutive factory calls. Then I
started looking at git history trying to find commit which introduced this
issue. Luckily, in spite of heavy rebasing and few backported commits, my
`master` branch didn't have this issue and I was able to pinpoint this to
single commit. At first glance this commit looked almost innocent -- it just
extracted code from model and moved it to `app/workers/`. But there were two tests
added to failing spec file and they were the tests which caused cascading
failure of all remaining tests in suite. After reviewing the code under test I
had found that real culprit was memory leak debugging code I quickly slapped in
without running tests:

```ruby
      counts = Hash.new { 0 }
      ObjectSpace.each_object do |o|
        counts[o.class] += 1
      end
      counts.reject! { |_k, v| v < 100 }
```

It seems that `FactoryGirl::DefinitionsProxy` undefines all methods including
`class` and `method_missing` in this class adds any calls as traits to factory
so walking through `ObjectSpace` and calling `class` on every object wreaks
havoc on factories.
