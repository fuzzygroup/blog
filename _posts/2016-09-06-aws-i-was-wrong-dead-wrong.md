---
layout: post
title: AWS - I was Wrong; Dead Wrong
category: aws
tags: ["aws"]
---
It isn't easy for me to write this but I have to admit that **I was flat out wrong about aws** -- and I have been for years.  I started use AWS in 2008 using its crack cocaine feature -- S3.  S3 makes anything related to cross machine storage so damn easy that it really is the **crack cocaine of AWS**.  You start with just a little and then you look up and its everywhere.  And, unfortunately, that was pretty much where my usage stopped.  Sure, as a consultant, if a client was already committed to AWS, I used it but I never sat down and really **grokked it**.  I didn't internalize the AWS model of thinking.  Well that is at an end -- I'm deep in to AWS now and let me repeat myself:

{:.center}
**I was wrong**

I started in high tech in 1987 building hypertext linking tools (authoring and browsing) and, yes, that's 4+ years prior to the web so I've been pretty good at anticipating change.  Similarly I made the leap to solely open source development technologies in 1999.  And I was building blogging technology at the start of the Web 2.0 boom.  Unfortunately I completely missed the significance of AWS.  While I looked at it and saw "supporting technologies like S3", what I missed were these key points:

{:.center}
**AWS is your data center** 

{:.center}
**And any software engineer can now build a data center.**

And its really that simple - AWS is now an entire data center.  Everything from:

* storage (s3)
* db (rds)
* queuing (sqs)
* servers (ec2)
* load balancing
* etc

And all of this is wrapped up in an easy to use, albeit mildly ugly, web user interface that almost any software engineer can use.  Just as an example I've always shied away from the low level networking aspect of the stack like firewalls, etc.  However, earlier today, I found myself easily says "Ok here's my VPC of boxes and here is a firewall which will limit access to all my internal servers - mysql / redis / memcache - to only my box on this subnet".  And it all worked the very first time.  When is the last time that a firewall rule worked on all the boxes you had the very first time -- when you weren't a network specialist?  And if that doesn't convince you then look at this example of how [fast you can manipulate servers using AWS](https://fuzzygroup.github.io/blog/aws/2016/09/07/aws-an-example-of-development-speed.html).

In closing I completely missed the significance of how AWS will fundamentally change the economics of building Internet applications.  If you've been stuck, as I have, with a hosting company where you:

* can't get what you want
* get overcharged for crappy performance on old hardware
* get crappy support
* can't easily create a new server w/o killing yourself on configuration

Then you should find AWS a refreshing alternative.  Yes, it is a completely different way of thinking about infrastructure and there is a metric ton of things to learn but the end result is **just outstanding**.  In less than a week's worth of part time effort, I've replaced equivalent infrastructure that took multiple weeks to configure and was lower performance than my AWS equivalent.  Additionally I can easily clone an individual server to setup a duplicate.  
