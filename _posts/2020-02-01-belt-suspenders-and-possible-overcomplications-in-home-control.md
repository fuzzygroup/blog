---
layout: post
title: Belt, Suspenders and Possible Overcomplications in Home Control
category: hardware
tags: ["hardware", "home_control"]
---
{:.center}
![IMG_1623.jpeg](/blog/assets/IMG_1623.jpeg)

I mildly shudder to write this post and I strongly hope that it  received with all the **good intentions** that I have.  I saw that my friend Greg Stein wrote a [damn interesting post about home control and water sensors](http://prng.blogspot.com/2020/02/howto-environment-sensors-in-home.html).  Greg is one of those scarily smart folks that makes me feel a bit like a knuckle dragging monkey, who, at times, is picking things out of his fur and debating "should I eat this or not?".  

In this post, Greg builds a wonderful home control system that will notify him anywhere that he is in the world if a leak occurs (he had a fish tank leak that led to him say "hm... I can fix this").  This is utterly classic "Nerd Itch Scratching" and I actually love the solution that he came up with but it made me think a lot about the number of *moving parts* in his solution.  I had a similar issue back in 2017 and I [wrote up my solution at that time](https://fuzzyblog.io/blog/house/2017/01/07/protecting-your-home-from-water-damage.html).

This is one of those things where I suspect the actual answer is both things:

* The sophisticated approach that let's you monitor from anywhere and play with a time series database ([InfluxDB](https://www.influxdata.com/); I'm jealous, TSDBs are cool)
* The brutally simply solution that I came up with because even if what I did isn't remotely monitorable, my solution is so simple (and cheap) that it qualifies as backup to the complex solution
* You spend more time at home than you do away which means that statistically the leak is more likely to happen when you are home.  And  because systems with lots of moving parts are inherently something that can break, having backup, even if imperfect might not be a bad idea.
