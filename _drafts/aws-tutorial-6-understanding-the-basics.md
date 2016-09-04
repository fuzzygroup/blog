---
layout: post
title: AWS Tutorial 6 - Understanding the Basics
category: aws
tags: ["aws"]
---
Travel, work and a focus on ElixirCon took me away from my ongoing obsession with AWS but I do now have a cluster of working boxes on AWS and I thought it was time to back up and review what I've learned.  I tend to learn new technologies by trial and error rather than a detailed reading of the documentation.  Docs are so often either incomplete, incorrect or flat out wrong that I've become accustomed to learning stuff the hard way.

This tutorial focuses on what I'd call "small scale AWS".  If you're concerned about multiple availability zones, giant scaling and such, well, you should not be here.  The case that I'm talking about is moving things from classical hosting on say between 2 and 25 boxes to a similar number of boxes on AWS.  I'm not going to focus on application re-architecture in terms of containers and such but I am going to emphasize some of the things that I've learned so far.

# Step 1: Your Initial Decisions Matter

The hardest thing I've found is that the decisions you make initially, when you don't really understand much of, well, anything, have big implications down the road.  What I've found is that you need to make a handful of basic decisions / settings that you **must** use consistently from that point forward.  These decisions are:

* Data Center.  Ultimately your boxes need to reside somewhere.  Each data center is subtly different.  For example in some data centers you can use _ characters in S3 bucket names whereas in others you have to us - characters.  There are also pricing and availability differences.  You'll also find that some services aren't available in some data centers.  And, no, I can't explain or even understand that.
* Keys.  You'll generate an set of keys early on in the process.  You'll use these again and again as you work with the AWS cli tool when you have to configure it on every box you have.
* Data

Every one of these decisions needs to be accurately documented and checked into version control because this stuff really does matter.  

# Step 2: Don't Just Replicate the Past

I've done a lot of reading on AWS at this point and the best point that I've taken away from it so far is this: **immutable infrastructure**.  Everyone of us has spent far too much time trying to fix a broken server.  Don't.  Treat your infrastructure as immutable and just spin up new boxes when you need them.  You can use Puppet / Chef / Ansible or even Bash to do this or you can just get a box to good state and make an AMI that you use consistently.  Now the one key to this is that if you're going for immutable infrastructure then you need to NOT have any persistent data on any box.  Because when that box goes away you're going to **lose** that data.  This means that you need centralized logging and a strategy for how to store any locally generated data.  I suspect that strategy is likely S3 buckets but your needs may differ.

# Step 3: Trust but Verify

If you're bringing a new system up to replace an existing one, I'd strongly encourage you to be absolutely certain that what you started with, your source system, actually makes it to the target system.  What I do is highly data centric and what I found was the [Amazon RDS](https://fuzzygroup.github.io/blog/aws/2016/08/29/aws-tutorial-5-aurora-rds-issues.html) silently lost data on table imports.  So if you're migrating data you need to trust but verify.  Of course this is always a good practice but its easy to say "oh wow AWS is so fast and get impressed and lose track of things".  Excitement affects all of us.  And, then there's the issue that knowing that a terabyte plus size data store loaded correctly is **hard**.  At this point I know how to verify it but I haven't yet done it.

# Shout Outs

I learned a lot of this from Udemy course 
