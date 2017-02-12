---
layout: post
title: How to Make a Side Project Interesting
category: side_project
tags: ["side_project", "hyde"]
description: Make a side project technically interesting by figuring out what bothered you about your last project and addressing it but beware of the second system effect.
---
Taking a quick look at the different development directories on the various hard discs that I use for code related stuff shows that I've started over 20 different side projects since 2006.  Generally speaking that averages out to about 2 a year.  My current side project, while not at release stage yet, has now sustained over 45 days of continuous coding -- at least 2+ hours every day.  This morning, after making sure my wife was up, I had an mild epiphany as I walked back to my basement office.  The reason that I've been able to keep working is that I've been **interested**.

Sure building projects is interesting but that's actually not what I mean.  A very big reason that I've been able to keep working on this so consistently is that I've looked at the what bothers the crap out of me about building data intensive SAAS apps (which this is) and I've figured out how to **minimize** those bad things.  I know exactly what was technically wrong with the [last SAAS app](http://www.appdata.com) I built and I don't want that to hit me again.  When I built my last SAAS app, I looked at it after the day I launched it and I thought to myself, "Whelp - I can spend the next decade of my life actually managing it" and here it is 3/4 of a decade later and, until recently, I was tied to it by a ball and chain.  

I don't want to go into exactly what bothered the crap out of me -- it is going to be different for everyone.  Your crap isn't my crap and vice versa.  But if you want to make side projects interesting then figure out what technically bothered you in prior projects and address it.  Now the trick here is to avoid what is referred to as [The Second System Effect](https://en.wikipedia.org/wiki/The_Mythical_Man-Month#The_second-system_effect).  This is the situation where you get so involved in fixing the crap that you over engineer.  And, lest you think that second system effect is just engineering lore, I can absolutely attest to it.  On at least one startup, I spent so much time at the framework layer that I never really got to the product.

In my case, since the crap that bothered me, was at the data layer, that was a serious risk.  What I did though was to tackle it with simple, common sense techniques that I know for a fact [scale and scale brilliantly](http://fuzzyblog.io/blog/startup/2016/09/01/what-matt-mullenweg-taught-me.html).
