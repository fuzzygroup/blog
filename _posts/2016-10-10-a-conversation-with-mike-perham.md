---
layout: post
title: A Conversation with Mike Perham
category: ruby
tags: ["ruby", "rails", "sidekiq", "open_source"]
---
One of the most gratifying aspects of working in the Open Source world is the ability to get to know the people who build the tools you rely on.  I've been in the Open Source world since '99 and I've been to a lot of conferences.  Not to humble brag but here are some of the people who've I've gotten to know:

* Greg Stein / Apache
* Monte / MySQL 
* George and Theo Schlossnagle / PHP
* Matt Mullenweg / WordPress and so much more

This isn't a humble brag because probably only one of these people *might* recognize me on the street -- maybe.  I'm a user of their stuff and I promote it as much as I can.  I've been using Apache and promoting it, honestly, because it is what I know.  But also because I know Greg and once upon a time he was chair of the Apache foundation.  And also because Apache has been good to me; it just works.  And I use MySQL / MariaDB not only because its fast and stable but also because I've seen my wife go shot for shot with Monty (picture a tiny red head drinking shots with a Finn; priceless).  I bailed out of the PHP world years and years ago but I still love the [work](https://www.sparkpost.com) that the Schlossnagle brothers do; I learned more solid computer science from [George's book](https://www.amazon.com/Advanced-PHP-Programming-George-Schlossnagle/dp/0672325616) than I ever learned in college and I still read it from time to time when there's a problem I know he would have a perspective on.  And I'm a fan of [Matt](https://fuzzygroup.github.io/blog/startup/2016/09/01/what-matt-mullenweg-taught-me.html) even though I moved to the dark side and use Jekyll.

Today I got the chance to know [Mike Perham](http://www.mikeperham.com/), the author of [Sidekiq](http://www.sidekiq.org), just a little bit.  I sat in on his weekly [Happy Hour](http://sidekiq.org/support).  This is where he offers a video chat about Sidekiq and answers questions / gives suggestions.  Mike Perham is someone who's intellectual work product is very familiar to me.  And I've long lauded his work as "the best guy in Ruby threading in known space".  When people ask me about Ruby threading, I tend to just point them toward's [Mike's blog](http://www.mikeperham.com/).  

Now, despite my positive opinions about Mike, I've actually used Sidekiq only sporadically.  I had a bad experience with asynchronous job processors years ago and ever since I've been gun shy.  I've always taken the perspective that when you're doing big back end systems, your data processing is core to your application and you should own the IP.  So I wrote my own threaded code, years ago, and I've been using it ever since.  But when my code gave up the ghost with an MTBF of 30 minutes, Sidekiq leapt to my rescue and has given me a 38x improvement.  Machine's still crash but I can now go to bed and sleep thru the night.  Given my recent trials and travails with SSH problems and machines crashing due to out of memory issues, I thought that talking to the literal source might at least give insight.  **And it did**.

Here's what I learned:

* Mike is a very professional, very nice guy
* Shared tenancy on AWS really is an issue; nearest neighbors can actually hurt your performance pretty dramatically
* Redis really wants high performance box; not necessarily a ton of cores
* Memory leaks are always an issue; sometimes its your code; sometimes its a gem that you use or an update to a gem that you use (so it can be fixed and then a gem update causes it to happen again)
* **THE ANSWER TO MY PROBLEM**: The best approach is belt and suspenders.  Memory leaks are as much a state of being in a dynamic, garbage collected language.  Even if it gets fixed, a gem update could break everything once again.  The best approach is to use process monitoring and simply kill the process and restart it if the memory use is too great.  Either use [Monit](https://mmonit.com/monit/) or [Inspeqtor](http://contribsys.com/inspeqtor/).  Mike has a [great video](http://contribsys.com/inspeqtor/) on this page and I'd recommend watching it; having setup monit in the past, Inspeqtor looks awesome.
* Tracking down memory leaks in Ruby is hard and just may not be worth it.
* Process monitoring would also fix my ruby segfault issues
* I need to look into the commercial offerings for Sidekiq and Inspeqtor.  We're already a commercial support customer for Sphinx; we might be able to be a commercial customer for Sidekiq.

Thank you very, very much Mike.  