---
layout: post
title: Ruby Regex Performance - Scan versus Match
category: ruby
tags: ["ruby", "regex", "performance", "ntergaid", "hyper_awk", "gene_callahan", "pete_jenney"]
description: It is really, really easy to fall into usage patterns once you learn a method of coding and never consider the 10 other ways you might do something.  Here I look at match versus scan in Ruby with a short benchmark.
image: http://fuzzyblog.io/blog/assets/ruby.png
---
{% pizzaforukraine  %}

I got my start with text processing using a custom version of [Awk](https://en.wikipedia.org/wiki/AWK), HyperAwk, that my first company, NTERGAID, built.  What made HyperAwk unique was its ability to read not just ASCII but Word, WordPerfect, Ami and other binary structures and render them into a generic parseable format where you could look for document structures like bold facing, heading tags and the like.  We used it constantly from roughly 90 to 96 for things like "Transform every issue of [Dr. Dobb's Journal](http://www.drdobbs.com/) from source file to hypertext".  I even got a [cover story](http://www.drdobbs.com/web-development/the-ddj-hypertext-project/201800824?queryText=%2522Scott%2BJohnson%2522%2Bhypertext) out of it which was a huge personal win.  The engineer on the project, [Gene Callahan](http://gene-callahan.blogspot.com/2011/06/reference-management-software.html), was a Unix guy surrounded by a bunch of DOS heads and he recognized that as our document recognition tasks got harder, what started as a tool, became a language.

Because I started with text processing from an Awk perspective, I'm a *regex kind of guy*.  Yes I know Nokogiri and, yes, I know xpath but for simple data extraction, my goto is always a regex. And when I'm in Ruby I tend to use .scan.  It is easy, convenient and I know it cold.  But is it fast?  I don't think I've ever even thought about it.  I've always known that there are different things like .match but I never ventured there -- until now.

What I just found out is that .match is dramatically faster.  Here's an example:

```ruby
 tpp.parse
{
              :blaahs_count => 324,
           :blaaaargs_count => 281,
           :followers_count => 139,
             :match_seconds => 0.00841700000455603,
              :scan_seconds => 0.030331000016303733
}
2.3.1 :043 > tpp.parse
{
              :blaahs_count => 253,
           :blaaaargs_count => 66,
             :match_seconds => 0.006857000000309199,
              :scan_seconds => 0.02245499999844469
}
```

Note: All benchmarking tests were down with a Benchmark.realtime do block wrapping the code in question.  Only the core matching operations were benchmarked; not the underlying network io.

If you do the math that's between *3.2* and *3.6* times faster.  On other tests I found about a 3 fold increase in speed.  As my old friend Pete Jenney would have said **Great Googlely Moogley!**  I should point out that he was saying that in 1996 long before Google even existed.

As with any benchmark, your results will definitely vary.  I'm working here with pretty big strings (web pages; this is a simple data extractor).

