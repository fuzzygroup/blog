---
layout: post
title: A Public Letter to Kagi Search
date: 2022-07-17 13:41 -0400
category: search
tags: ["search", "kagi"]
---
Dear Kagi Search, 

This is unsolicited advice from a random technical dude on the Internet and, so, do with it what you will.  /dev/null is one viable possibility.  I do think, however, that my history building search stuff might merit a listen:

* Shipped search back in the days of DOS on CD-ROM platforms when 500+ megs was a lot
* Ran enterprise knowledge management software for Dataware using a customized version of the BRS engine
* Built Feedster and scaled it to over 20,000,000 blogs using a custom 64 bit in memory search engine tuned for AMD-64
* Still doing search related stuff to this day; lately I'm loving [MeiliSearch](https://fuzzyblog.io/blog/rails/2022/05/31/using-meilisearch-in-a-production-rails-environment.html) and, honestly, hating Elastic Search

I want to start by thinking you for your work and I think well enough of you that I actually [donated](https://twitter.com/fuzzygroup/status/1547834415174131712) (and I'm cheap so that says something).

You guys have a business model and a plan and you must be funded well to take on Google.  That's audacious and I'm impressed.  

I am concerned, however, that you are doing the same things as Google and those things are what makes Google suck at least for developers, specifically:

1. You aren't defaulting to all search words in an expression with AND as the default conjunctive operator.  I'm sorry but user input is important.  If I put multiple search words in then, by golly, please use them!  This is particularly true on Mobile when typing is hard.  Right now you are doing what Google does which is try to always return something (an OR as the default operator guarantees more results but not the right results).  Google does this because it increases the probability of someone click on on an ad -- you don't have ads yet so WHY?
2. You don't seem to be explicitly targeting developers.  This feels like a mistake to me because people ask developers what they use / just observe what we do.  When I shifted to Google, my wife shifted to Google just by watching what I do.  And when I shifted to Brave, she also did.  Now she's asking me if she should move to Orion.  Right now from what I can tell you are simply trying to be google.  That's an impossible target -- try and be something smaller and more targeted.  
3. Google used to be great for developers and has been steadily decreasing in quality with a pretty dramatic drop in quality over the past 12 months.  
4. Regarding #1 -- if you don't want to make AND your default, could it at least be configurable?
5. Please, please bring back + and - search operators.  Google dropped + with their abortive attempt to do a social network and I've missed it ever since.  And, no, quoted phrases aren't exactly the same.

And in closing, please note that if I got anything wrong, I apologize. I'm really impressed by what you are doing and I wish you all the best.

Scott