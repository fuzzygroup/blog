---
layout: post
title: AWS Tutorial 6 - Understanding the Basics
category: aws
tags: ["aws"]
---
Travel, work and a focus on ElixirCon took me away from my ongoing obsession with AWS but I do now have a cluster of working boxes on AWS and I thought it was time to back up and review what I've learned.  I tend to learn new technologies by trial and error rather than a detailed reading of the documentation.  Docs are so often either incomplete, incorrect or flat out wrong that I've become accustomed to learning stuff the hard way.

This tutorial focuses on what I'd call "small scale AWS".  If you're concerned about multiple availability zones, giant scaling and such, well, you should not be here.  The case that I'm talking about is moving things from classical hosting on say between 2 and 25 boxes to a similar number of boxes on AWS.  I'm not going to focus on application re-architecture in terms of containers and such but I am going to emphasize some of the things that I've learned so far.

# Step 0: Authentication

If you're like me then you may have seen two distinctly different user interfaces for logging into your AWS "stuff":

{:.center}
![aws_username_password.png](/blog/assets/aws_username_password.png)

{:.center}
![aws_account_username_password.png](/blog/assets/aws_account_username_password.png)

Dv - how do we get between them and what is the difference


# Step 1: Your Initial Decisions Matter

The hardest thing I've found is that the decisions you make initially, when you don't really understand much of, well, anything, have big implications down the road.  What I've found is that you need to make a handful of basic decisions / settings that you **must** use consistently from that point forward.  These decisions are:

* Data Center.  Ultimately your boxes need to reside somewhere.  Each data center is subtly different.  For example in some data centers you can use _ characters in S3 bucket names whereas in others you have to us - characters.  There are also pricing and availability differences.  You'll also find that some services aren't available in some data centers.  And, no, I can't explain or even understand that.
* Keys.  You'll generate an set of keys early on in the process.  You'll use these again and again as you work with the AWS cli tool when you have to configure it on every box you have.
* Data
* VPC.  Here is a good [StackOverflow discussion](http://serverfault.com/questions/449308/aws-vpc-why-have-a-private-subnet-at-all?rq=1) on the whole VPC thing.

Every one of these decisions needs to be accurately documented and checked into version control because this stuff really does matter.  

# Step 2: Don't Just Replicate the Past

I've done a lot of reading on AWS at this point and the best point that I've taken away from it so far is this: **immutable infrastructure**.  Everyone of us has spent far too much time trying to fix a broken server.  Don't.  Treat your infrastructure as immutable and just spin up new boxes when you need them.  You can use Puppet / Chef / Ansible or even Bash to do this or you can just get a box to good state and make an AMI that you use consistently.  

Now the one key to this is that if you're going for immutable infrastructure then you need to **NOT** have any persistent data on any box.  Because when that box goes away you're going to **lose** that data.  This means that you need centralized logging and a strategy for how to store any locally generated data.  I suspect that strategy is likely S3 buckets but your needs may differ.

# Step 3: Trust but Verify

If you're bringing a new system up to replace an existing one, I'd strongly encourage you to be absolutely certain that what you started with, your source system, actually makes it to the target system.  What I do is highly data centric and what I found was the [Amazon RDS](https://fuzzygroup.github.io/blog/aws/2016/08/29/aws-tutorial-5-aurora-rds-issues.html) silently lost data on table imports.  So if you're migrating data you need to trust but verify.  Of course this is always a good practice but its easy to say "oh wow AWS is so fast and get impressed and lose track of things".  Excitement affects all of us.  And, then there's the issue that knowing that a terabyte plus size data store loaded correctly is **hard**.  At this point I know how to verify it but I haven't yet done it.

# Other 

## Scroll Down Your Box Isn't Gone

I know this will make me sound a bit like an idiot but it has happened a few times so I'm going to comment on it.  When you have more than a handful of boxes configured, it is easy for the box you want to appear on the bottom of the list and be essentially "off screen".  And since boxes can come up and come down, you can easily think "oh shite - where'd my ec2 go".  Recent, stupid, trends in user interfaces have made scrollbars not as visible as they used to be so its easy for boxes to hide at the end of the list.

{:.center}
![aws_just_scroll_down.png](/blog/assets/aws_just_scroll_down.png)

## Ping Is Not Configured By Default

I'm old school.  When I can't ping, well, anything, my inclination is to throw my hands up and grunt "argh!  box gone".  Getting ping back requires turning on ICMP support in the security group settings.  I'm not enough of a networking guru to say if this is good or bad but I know that I prefer, greatly, the ability to ping boxes.  You want the All ICMP option:

{:.center}
![all_icmp.png](/blog/assets/all_icmp.png)


## Don't Confuse *Your* Configuration Errors with AWS Network Setup

When I brought up my first AWS cluster I found it very hard to get a server with say Redis on it talking to all the other boxes.  Given the complexity potential of AWS networking, I made the automatic assumption that I had screwed up the network configuration so I focused my research there.  And it was fruitless.  No matter what I looked at I found that I had set it correctly. 

Then I tried using an ElastiCache redis instance and it just worked right away.  This also convinced me that I had a networking issue on my side. So I rebuilt all my security group settings.

Then I realized "Oh wait -- maybe I'm dumb me" and I broadened the search to generic Redis issues and I discovered that I hadn't set the bind option correctly.  Essentially Redis, like most server software, doesn't listen anywhere other than 127.0.0.1 which means that it won't hear requests that come in from a different box.  Here's the [Stack Overflow link](http://serverfault.com/questions/301788/how-do-you-get-redis-connections-working-within-an-amazon-vpc-private-subnet) which got me straightened out.

This is one of those things that intellectually you know but unless you setup infrastructure regularly will aways bite you.  

Here are some common listen directives for different software and where the conf file is:

* MySQL / MariaDB: **bind-address = internal_subnet_address** (/etc/mysql/my.cnf)
* Redis: **bind internal_subnet_address** (/etc/redis/redis.conf)
* SphinxSearch: listen = internal_subnet_address:9306:mysql41 (where ever your conf is)
* MemCached: **-l internal_subnet_address** (/etc/memcached.conf)

Note: internal_subnet_address represents the private IP setting of your EC2 instance.

## It Is Easiest to be Pure AWS

With AWS it is important to understand this simple fundamental:

It is all just about EC2 instances.

Ultimately all of AWS seems to come down to just an EC2 instance of some type.  Remember an EC2 instance is just a server in the cloud.  And because everything comes down to EC2 instances this means that you can do just about anything.  However, and this is important, it doesn't mean that it is easy.  When I was trying to get up my initial MySQL db, this was the process:

* create an ec2 instance - define networking & security & storage
* make sure its setup so that all my instances can reach it (same security group / data center / network)
* log in
* install mysql / maria db 
* configure it
* fix bind settings
* test / repeat until working

Now for a lot of options Amazon offers their own thing like Route 53 for DNS, RDS for relational data and ElastiCache for Redis.  These options are generally more expensive but they are far, far easier to setup.  And, unless you're at the bleeding edge of functionality like [all my RDS issues](https://fuzzygroup.github.io/blog/aws/2016/08/28/aws-tutorial-4-rds-data-loading-into-aurora-run-in-circles-scream-and-shout-the-oh-shite-moment.html), they usually seem to work just fine.

## The AWS Marketplace

When you're new to AWS it is hard to even comprehend just how big AWS actually is.  It is a massive ecosystem by Amazon that's constantly growing:

{:.center}
![aws_all_1.png](/blog/assets/aws_all_1.png)

{:.center}
![aws_all_2.png](/blog/assets/aws_all_2.png)

And, just when you think you comprehend it, you run into something like the [AWS Marketplace](https://aws.amazon.com/marketplace) where third parties can sell you software and services:

{:.center}
![aws_marketplace.png](/blog/assets/aws_marketplace.png)


## Consider SQS Over Redis

Note: Only bother reading this if you use Redis for queues.  Otherwise happily ignore it.

Like a lot of Internet developers, when I think "distributed queue", I automatically think "Redis" and I've used Redis to successfully process, without question, tens of millions of queue entries to date.  And while I still love redis, there is an Amazon equivalent called SQS that has one unique advantage over redis - visibility timeout.  On a redis instance when you pop something off the cache it instantly leaves the cache and goes to you for processing.  If your process then dies, well, the data is lost.  This isn't an error in Redis or an error in your code -- its the nature of how it works.  

SQS operates slightly differently.  When you pop an item off the queue it doesn't actually leave the queue, it just becomes invisible.  When you're done processing it then you tell the queue "Ok I'm really done now" and it goes away permanently.  You can even specify an automatic timeout whereby the item becomes visible again to the queue.  [Chris](http://www.themediafarm.ca/) taught me all about this and while I was initially massively resistant, it has fundamentally, positive implications for how you design queue based systems.  It dramatically lessens or eliminates entirely all kinds of failover / recovery coding.  **Recommended**.

# Shout Outs

I learned a lot of this from [Udemy](http://www.udemy.com/) courses including the [excellent Docker courses](http://nickjanetakis.com/courses/) by [Nick Janetakis](http://nickjanetakis.com).
