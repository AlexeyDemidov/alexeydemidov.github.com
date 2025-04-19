---
layout: single
title: "Octopress revival"
date: 2014-06-15 13:46:37 +0400
comments: true
categories:
---

Resurrected my standalone blog for the third time, this time again on
[Octopress](http://octopress.org/) and still on 2.0 version. I didn't intend to
do this but there is still no good blogging platform with code highlighting
support. 

I set it up pretty quickly but the first problem was that I wanted to keep old
content but I didn't have source code for it anymore. Converting by hand seemed
tedious so I thought about hiring someone on oDesk but then, after a few Google
searches I found a tool to convert HTML back to markdown -- [reverse_markdown ruby gem](https://github.com/xijo/reverse_markdown). 
At first attempt it did no
conversion but after stripping all HTML code around actual post content (the
most important is to remove `article` tags around) it produced nice markdown
which I put back into Octopress.

After initial import I did some cleanup -- removed unnecessary `/blog` prefix
from post permalinks, fixed links in old content pointing to my old-old
MovableType blog and imported static files into Octopress. To check all links I
installed [link-checker ruby gem](http://www.ryanalynporter.com/2012/10/06/introducing-the-link-checker-ruby-gem/)
-- it works pretty fine but seems to be having problems with some `https://`
links.

Once all content was in good shape I tweaked CSS colors back to my old palette,
added [Stack Exchange badge](https://gist.github.com/AlexeyDemidov/b045b6f5b6a8d0a19e67), 
enabled [Disqus](https://disqus.com/) comments, updated Google Analytics
JavaScript to latest universal code.

After comparing generated HTML with old blog using `diff` I have found a bug in
Octopress: canonical link for categories pages is broken by default -- has
missing `/`, see [Octopress issue #949](https://github.com/imathis/octopress/issues/949) 
for fix. Once I was satisfied with content I deployed it to server using
`rsync`.

There is currently [Octopress version 3.0](https://github.com/octopress/octopress)
in development and it is close to final release but it seems to be quite
different from version 2.0 in its concept and as its author
[says](https://github.com/octopress/octopress/issues/30): 

> For those currently using Octopress, it will be a while before the new
releases can compete with the features of the old version.
