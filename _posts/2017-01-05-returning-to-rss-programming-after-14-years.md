---
layout: post
title: Returning to RSS Programming After 14 Years
category: startup
tags: ["hyde", "rss", "rails", "startup", "software_engineering"]
---
There is a very odd, very good feeling when you as a programmer return to some technical task that you used to do -- and you find that you do it **better**. For myself I am once again dabbling in RSS programming and it feels **great**.  It was almost 14 years ago to the day that I started Feedster based on an idea that [Dave](http://scripting.com/2003/03/09.html) put out there by linking to an idea that Dave Aiello  had.  

That one tiny mention on [Scripting.com](http://www.scripting.com/) inspired me to hack together a truly awful RSS search engine that in turn survived a slashdotting and then picked up a co-founder, a CEO, angel investment, a move to San Francisco, real venture funding and actual staff.  

It was, I believe, March of 2003 on a snowy night and now in January 2017 on another snowy night I am again writing feed processing code.  

The technically interesting part here is that the operations I did poorly back in 2003 are now flowing and gracefully from my fingers as I work.  Specifically I used to monitor feeds by doing a full fetch and then hashing the body with MD5 and comparing it to a stored value from the last time.  This time I *knew* "Ok.  Do an HTTP head and look at just the header values".  Additionally I am using a far better toolset in 2017 (ruby / rails / elixir / phoenix) than I ever did back in 2003 (php).

If as an engineer you've never returned to a problem space after a long interval, I'd recommend it.  Just seeing how you tackle the same problem after a long break certainly makes you think.