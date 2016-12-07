---
layout: post
title: The Incredible Smartness of Bezos or A New Revenue Stream for Amazon with Amazon Go
category: startup
tags: ["amazon", "startup", "bezos"]
---
Before I made a full commitment this past summer to AWS, I read [The Everything Store](https://www.amazon.com/Everything-Store-Jeff-Bezos-Amazon/dp/0316219282/ref=sr_1_1?ie=UTF8&qid=1481104973&sr=8-1&keywords=The+Everything+Store) which is a detailed analysis of how Amazon operates and Jeff Bezos personally.  As someone who has been an entrepreneur on many different occasions, I find this type of book particularly compelling and this particular book was no exception.  What I walked away from the book were these observations: 

1.  Jeff Bezos is at the essential core of Amazon's success; yes there are many other talented executives but at its heart it is Jeff's place.
2.  Jeff Bezos is a once in a century type businessman and if I don't think of in the same light as Gates, Rockefeller and Carnegie then I'm making a massive mistake.
3.  It is far, far smarter for me to commit to AWS than it is for me to fight AWS.

And that, dear reader, is why I went full scale with AWS.  Yes there were [technical reasons](https://fuzzygroup.github.io/blog/aws.html) as well but at its heart it was a bet on Bezos.

# What is this Categorized as Startup

Given that Amazon is literally a globe spanning entity with aggregate revenues north of 100 billion, you may find it odd that my primary category for this piece is startup.  Well Amazon, at least to me, just plain acts like a startup.  The level of innovation that the company consistently delivers is breath taking.  I mean what other big company launches new things at the pace that Amazon does?  Honestly Amazon is a startup at least in my mind.

# Amazon Go

And now I come to yesterday's announcement of [Amazon Go](https://www.amazon.com/b?node=16008589011#) - [Hacker News Discussion](https://news.ycombinator.com/item?id=13105689), a complete re-thinking of grocery stores.  Amazon has announced that they will be building 2,000 local grocery stores which are basically a complete rethinking of the grocery store concept implemented along the lines of a convenience store.  Particularly interesting to me since I grew up working retail were these ideas:

* no cashier
* wave your phone when you enter to authenticate yourself
* shop by putting items in your basket; take whatever you want
* amazon figures out what you bought and automatically charges your credit card 

If you think about all the various services that Amazon offers through AWS this is a clear implementation of those services applied to the physical world.  In specific I'd place a good bet that this will be powered by [GPU instances](https://aws.amazon.com/about-aws/whats-new/2016/09/introducing-amazon-ec2-p2-instances-the-largest-gpu-powered-virtual-machine-in-the-cloud/) using some kind of machine vision API that you'll see announced next year at the next Amazon developer conference. And I'd be surprised if we don't see the store proactively reaching out to people's phones using the new [Amazon Lex](https://aws.amazon.com/lex/) ChatBot tool to say something like:

> I see that you picked up and put down three different types of red meat.  In case it helps make your buying decision we have a 10% instant coupon on any type of red meat you want.  

And this would be dynamically coupled with an [Amazon Redshift](https://aws.amazon.com/redshift/) warehouse analysis of inventory trends and if meat is going to spoil or not.  Amazon could entirely automate what a talented meat department manager does for a grocery store only better because the special is dynamically delivered to customers who are much more likely to buy.

# A New Revenue Stream for Amazon

The new revenue stream that I see coming out of this is consumer marketing data.  My strong guess is that Amazon will be able to roll up data from actions like pick up and put down on an individual consumer level and then see that type of analytics back to consumer goods firms.  Now I'm sure that Amazon already licenses some consumer marketing data to companies but I suspect this is going to be fairly unprecedented.  Let's say that you are a consumer goods company that just rolled out a new label.  Here's what I can envision happening:

1.  New label rolls out.
2.  Amazon is able to give you time adjusted comparisons of shopping experiences before and after along with being able to watch the consumers interact with the product.
3.  Think of this as a/b analytics for the real world.

I doubt there's a single person reading this who, whether or not they believe in a/b testing, doesn't understand the power it offers.  Personally I'm not a fan but as a marketer I can see this being truly compelling.

# My Wife's Reaction

My wife isn't part of the high tech world anymore but she had an interesting reaction:

> All restaurants are going to be Taco Bell!

Props to her for an outstanding nerd culture reference, the 1993 [Demolition Man](http://www.imdb.com/title/tt0106697/?ref_=nv_sr_1) movie starring Stallone, Bullock and Snipes of a dystopian future where literally all restaurants are Taco Bell.  Perhaps all commerce will be Amazon...