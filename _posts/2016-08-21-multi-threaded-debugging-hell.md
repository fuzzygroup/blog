---
layout: post
title: Multi Threaded Debugging Hell
category: debugging
tags: ["ruby", "rails", "threading", "hell"]

---
As of late I've been dealing a lot with categorization issues and specifically with respect to failures in a categorization engine that I've written.  What I was confronted with on Friday night was the client saying to me "Well we missed these 400 items" and that's true but we have an input dataset of roughly 2.9 million possible categorization operations.  So according to how this nerd does math:

    > select 400/2900000 * 100;
    
And, yes, that's how I usually do adhoc calculations.  When am I ever not logged into mysql on some box somewhere?  

Anyway I see this and I think well the error rate is actually tiny so that's kind of ok.  The problem is that this is a demanding client and that's **not ok** to them.  So after noodling on this problem for a very long time, end up with a blog post like this.  

This is a large Ruby application with these characteristics: 

* a massive input data set of categorization operations
* about 280 gigs of raw data driving it
* a full text search engine ([Sphinx](http://sphinxsearch.com/))
* highly complex queries
* a 3 tier cascading query architecture where if we don't have success with one method of running a query we fail over to another approach and then another
* running on 8 boxes each with 20 execution threads
* runs over about 20 to 22 hours of time
* has almost all logging turned off due to disc space constraints
* has runtime error handling like airbrake turned off due to cost constraints
* has strict exception handling so the process continues from start to finish without ever stopping
* Rails 4
* Ruby 1.9.3
* Redis for queueing

Yep.  If you're hard core enough you're likely thinking something like "Hm... I wonder [what open jobs there are](https://weworkremotely.com/) and if I should move on."  I hear you brother; I hear you.  But this is a technology stack that I'm heavily invested in having been the sole author for almost all of its life span.  It is an enormous beast but its my damn beast and I love the hell out of it.

So here's the debugging approach that I hope to execute on early next week:

1.  Subset the data.  Find the 400 items that fail to categorize and load a queue just of those.  Then run this on just one box to at least eliminate multiple boxes as the issue.  Note: 0 code changes for this approach.  If that works then get multiple machines working on it and see if that works.  If that works then either throw my hands up or accept that this just became an N pass system or that I need a **blank time check** to debug since its likely cross machine race conditions and perhaps *gargling with broken glass* might be more fun.
2.  MAKE A BRANCH!  The next changes are all highly intrusive.
3.  Using the same data subset strip out all exception handling at the level of the core threadpool loop and see what happens on a single box.
4.  Get a trial airbrake account and instrument everything for failures so that airbrake is called at every single failure.  Bear in mind that this is a large batch process that's failing so it likely means instrumenting the code base.
5.  Turn log files back on but this generates so volume of data that its very very hard.  Move to debug level logging even in production.
6.  Color code the output.  All of my jobs like this always generate a verbose stream of output to the console.  Using the colorize gem you can apply a method call like .red to particular messages.  Then what you do is mildly un focus your eyes and you watch the output stream by and you try and find patterns.  Color helps a lot here.
7.  Test coverage.  It is always helpful but this feels more like an operational issue rather than test coverage.  Still...
8.  Lather, rinse, repeat.  

And that's where I start.  Fixing a .01% error rate in a pool of almost 3,000,000 items is a "find this needle in this huge collection of haystacks" problem.  So that's my monday.  How about yours?

# Sidebar

If you're a software engineer then you know that debugging is at the very heart of what we do.  My best advice I give to younger engineers is always "make it easy to debug; you spend far more time debugging than you do coding".  And, glory, is that true in this situation.



