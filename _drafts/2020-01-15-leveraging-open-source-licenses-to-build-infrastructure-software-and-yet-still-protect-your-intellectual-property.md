---
layout: post
title: Leveraging Open Source Licenses to Build Infrastructure Software And Yet Still Protect Your Intellectual Property
category: open_source
tags: ["open_source"]
---
I'm faced with an interesting challenge in my day job (I'm a consultant for the [ADL](https://www.adl.org/)) where my goal is to produce a new class of infrastructure software in the **redacted** space but let's think of it as spam fighting.  I'd love to say more about this but we're a speculative group and confidentiality and all.  

It should be noted that central to the work that we are doing is Machine Learning technology and the production of domain specific models along with a corpus of labeled training data.  This is an important and relevant point and one which we will be returning to.

One of the discussion points within my group is are we producing open source software or are we producing proprietary, licensed software.  My position is simple:

* Always, always write new code, particularly server side, infrastructure software as open source
* If you have to deal with issues of intellectual property then you handle it at the **license** of the software, specifically by **dual licensing** it.  This is the strategy that built, among other things, MySQL to a billion dollar plus valuation so, it seems to me, that it is a viable strategy.

Each of these is discussed above including why open source is important as a key part of the engineering process.

## Why Is Open Source Important?

I'm a bona fide open source freak (ok - advocate) and I have no problems admitting that.  My reasons for being an open source advocate is really simple:

> "Given enough eyeballs, all bugs are shallow" aka [Linus's Law](https://en.wikipedia.org/wiki/Linus%27s_law)

and

> "No matter who you are, most of the smartest people work for someone else." [Joy's Law](https://en.wikipedia.org/wiki/Joy%27s_law_(management))

If you accept the truth of either of these points then it is hard as hell to NOT be an open source advocate.  Not using open source, as a development approach,  is literally foolish if not wrong headed.

## Why Don't We Want to Make this Open Source?

## Why Should Infrastructure Code Be Open Source?

Infrastructure code is software that plugs into the internal workings of something else, in our case the data back plane of the third tier, second tier and first tier social platforms (the customer).  There are a number of reasons why code being open source is important:

* The customer doesn't want to bother with tracking proprietary licenses and worry about licensing terms.  Even if the software is free, this is a management hassle.
