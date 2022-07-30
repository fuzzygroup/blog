---
layout: post
title: 17 Years of Blogging
category: blogging
tags: ["blogging", "linux"]
---
{% pizzaforukraine  %}

So I was looking up information on using the wc or Word Count command in *nix on [Stack Overflow](https://askubuntu.com/questions/351326/how-do-i-list-word-count-in-multiple-files) and it made me wonder how many words I've written in 17 years of on and off blogging.  A quick command:

    wc -w _posts/*

    wc: _posts/_site: read: Is a directory
      543089 total
      
This is one of those numbers which seems staggering but I recently saw that [Russell Beattie](https://www.russellbeattie.com/blog/) claimed over a million words over 15 years.  So it seems possible.  

**Note**: If I look at the number of posts using wc -l _posts/20*.md, I get a number that seems way, way too high so I'm not going to talk about number of posts at all.

A bit of math:

    select 543089 / 17;
    +-------------+
    | 543089 / 17 |
    +-------------+
    |  31946.4118 |
    +-------------+    

So that means 32,000 words per year.  If we assume 250 words per page then:

    select 31946.4118 / 250;
    +------------------+
    | 31946.4118 / 250 |
    +------------------+
    |     127.78564720 |
    +------------------+

Or about [one novella](https://en.wikipedia.org/wiki/Novella) a year.

Now I took a pretty serious hiatus from blogging for about 8 years (2006 to 2014) in my post Feedster seclusion so that makes the years actually 17 - 8 or 9 and this changes the math a bit:

    select 543089 / 9;
    +------------+
    | 543089 / 9 |
    +------------+
    | 60343.2222 |
    +------------+

and

     select 60343.2222 / 250;
     +------------------+
     | 60343.2222 / 250 |
     +------------------+
     |     241.37288880 |
     +------------------+ 
     
If we assume that there are 250 writing days in a year (i.e the weekdays) then we can look at words per day:

    select 543089 / (9*250); 
    +------------------+
    | 543089 / (9*250) |
    +------------------+
    |         241.3729 |
    +------------------+

And that's interesting -- just about a page per day.  I am trying hard to build a writing habit these days and tracking my metrics much, much more closely.  Onward!