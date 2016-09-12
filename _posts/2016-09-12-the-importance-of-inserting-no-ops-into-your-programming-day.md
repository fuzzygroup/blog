---
layout: post
title: The Importance of Inserting NO-OPs Into Your Programming Day
category: software_engineering
tags: ["software_engineering", "programming"]
---
One of the better development techniques that I've ever found has nothing to do with:

* programming language
* editor / tools
* methodology
* anything internet

It is what I refer to as a **personal no op**.  A [no op is an assembly language instruction](https://en.wikipedia.org/wiki/NOP) that does nothing and since I Z-80 assembly was my second language, I feel comfortable using term.  A personal no op is when you know that you're about to go dangerously down the wrong path and you decide "All righty then -- time to leave the keyboard before I screw something up."  This is one of those lessons that you only get by experience and, yes, it is a bit of a gray beard thing.

Let me illustrate with an example.  I've been wrestling with a data indexing issue with respect to [Sphinx Search](http://www.sphinxsearch.com) and a very large data set.  The time cost of an end to end index is about 20+ hours and, in the process, it trashes the previous index making previous to current comparisons hard if not impossible.  So what did I do?  I went upstairs and I made a sandwich.  And since I wanted a sandwich based on last night's meatballs and we were all out of tomato sauce, I thought nothing of grabbing a can of tomatoes and cooking them down with spices and a bit of sugar.  And, all the while, I was thinking these issues thru, partially in the foreground and partially in the background.  And, sure enough, as the sauce neared completion, the answer came to me.  I won't bore you with the details but the answer lies in an arcane aspect of how we do database sharding.  With a handful of new models and some code injected dynamically I should be able to preserve old and new indices concurrently.  And now I'm back at my desk writing this up and getting read to code it together.

One of the harder truths to recognize as a software engineer is that you're not actually a typist.  You're not even actually a programmer.  If you really are an engineer then all your real work happens in your own head and typing it out is just a side effect.  Being a software engineer isn't all that different I would argue from being an attorney.  Just as an attorney's real work happens not with Lexis / Nexis / Microsoft Word but in his or her head, so too does your work.  

So the next time you're struggling with something, get away from the keyboard and take a personal no op.  It really does help.
