---
layout: post
title: The Engineer's Design Notebook or What's in the Notebook Scott?
category: software_engineering
tags: ["software_engineering", "aws"]
---
For the past three months or so, one of my neighbors, also probably my wife's best friend, H, has seen me walk to and fro around the neighborhood carrying with me a small notebook.  Here it is:

![spidey_rules!](/blog/assets/spidey_notebook.jpg)

She's seen me carry this:

* to drinks at her house
* to different kids birthday parties
* to dinner
* to my youngest son's Veteran's Day speech in his 4th grade choir where I wrote in it furiously
* etc

Essentially it hasn't left my side since say August 1.  Last night she finally broke down and said "So what's in the notebook".  Apparently she had seen me writing in it on Veteran's day and it literally made no sense to her.  Ah and there's the story.  

I've done this most of my career starting back at NTERGAID, my first startup.  The notebook is a bound, non-removable page design notebook and the idea here is that whatever problem you're solving, you write down whatever comes into your head.  And, here's the smart thing, when you stop writing down the problem, that's when you're **done** with the design phase.

Every technical person has their own creative process, their flow if you will.  Me?  I like to nap and cook.  I know that sounds like a bit of an excuse for, well, slacking, but when I can't solve something digital then I go entirely analog.  By getting out of own head so to speak I find that whatever the issue is, I'm better able to solve it.  Either I take a nap and wake up with the solution crystalized in my brain or I go cook something and then I'll have it fully baked (you see what I did there ;-)).

What happened back in August is we made the decision to go full in on AWS for our underlying server side platform. Although I've used AWS for years, it had always been in a supporting capacity.  This time it was damn the torpedos and learn it down to the metal / api.  This freed me from all the hardware woes that I've been chafing under since either 2010 or 2014 depending on how you measure my frustration level.  But it also unleashed a metric crap ton of "oh noes - how do I do X?" where X might have been:

* monitoring
* machine configuration
* job management
* OS distro choice
* choice of AWS load balancer
* what the heck really is a vpc
* [Aurora - what the heck happened with our data loss](https://fuzzygroup.github.io/blog/aws/2016/08/28/aws-tutorial-4-rds-data-loading-into-aurora-run-in-circles-scream-and-shout-the-oh-shite-moment.html)
* etc

All of those choices, and a whole heck of a lot more, got researched, documented and written down.  Once I stopped writing -- on that topic -- then I knew it was time to apply fingers to keyboard and get started.  And keep in mind that it isn't like I wasn't doing stuff with the code and infrastructure.  But what I did was make a very conscious choice to sit on the things that I didn't feel I understood well enough to do competently.  Those I kept writing stuff down until I did understand them.

If you're not a proponent of an engineer's design notebook then I'd recommend it the next time you have a hard problem to solve.  It goes everywhere with you - mine goes into the bathroom with me at times - and it is always next to my bed.  I've been known to wake up, write stuff down and then go back to sleep.  What you might find is that it really does help you crystalize your thinking.