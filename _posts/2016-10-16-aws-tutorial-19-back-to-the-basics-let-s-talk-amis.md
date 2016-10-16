---
layout: post
title: AWS Tutorial 19 - Back to the Basics, Let's Talk AMIs and EC2 basics
category: aws
tags: ["aws", "ami", "linux", "ec2"]
---
I just used Hyde to examine my blog and I realized that I have written almost 20,000 words on AWS since 8/23/16 (note some of that is still unfinished and in draft form).  Using my standard writer metric of 250 words per page, that's 78 printed pages.  Wow.  And, alas, I realize that there are still things I haven't written about.  And some of them are the sort of basic things that you either just ignore or that you accept by rote - "I know, we'll use Ubuntu, we love Ubuntu!".  And, yes, that would be me.  So let's take a deeper dive here at some of the basic options when you build an EC2 instance.

# What is an EC2 Instance?

An EC2 instance is just a server in Amazon's cloud.  And, from what I can tell, pretty much everything AWS offers comes down to a server somehow.  When you build an EC2 instance you have to base it on an operating system which is called an AMI and there are a bunch of options that define what AMI you want to pick:

* Quick Start - the most popular options
* My AMIs - these are amis that you have saved from a machine you already built
* AWS Marketplace - these are commercial offerings from vendors 
* Community AMIs - these are generally open source AMIs and the number is enormous -- more than 50,000 when I checked

Here's a picture of the initial EC2 instance selection web page:

![aws_ami_ec2.png.png](/blog/assets/aws/aws_ami_ec2.png)

There are a few basic options that you really want to keep in mind:

* **Linux Distro**.  This is important but can't be written in a bullet point so it is discussed below.
* **32 / 64 bit**.  There's no real reason to not go 64 bit.  And if you have a reason then you should be writing this not reading it.
* **Virtualization Type**.  This should always be HVM as PVM is being phased out.
* **Root Device Type**.  This should pretty much always be set to EBS.  EBS allows you to turn off the volume without losing the data on the instance and thus allows you to resize your instance.

# The Linux Distro Question

Asking anyone in the Open Source world what is the best Linux flavor or "distro" (that's short for distribution) is a bit like asking someone their favorite color -- the answer is always different and always subjective.  And while there are differences, in the end, it is all Linux and if you can use one Linux then you can use a different Linux.  I know there are serious Linux folk that read this line and are gnashing their teeth and I apologize.

Personally I've used at different times:

* Red Hat
* Gentoo (I even had a whole data center of more than 100 Gentoo boxes)
* Ubuntu 12
* Ubuntu 14
* Mandriva
* Suse
* Debian

And I'm pretty sure there were some others; that's just want I can remember using.  The short answer is you want to pick a Linux distribution that:

* matches what you want to do
* is well supported
* is something you understand 
* has a package manager that you can deal with 

# The Amazon Linux Distribution

Interestingly Amazon has their own Linux distribution.  I don't have a ton of experience with it yet but I'm keenly interested in it and I really like their focus on performance.

Pros:

* Good support for Docker
* Good support for at least somewhat modern development tools; Ruby, PHP and Python all installed right from the start
* Good package support for the basics - mysql, postgres, etc
* AWS command line tools installed standard
* Good support for the AWS ECS 
* Cool text mode EC2 login logo that makes me smile whenever I see it
* They seem to really care about performance.  The 2016.09 release notes specifically call out the [7 seconds of boot time](https://aws.amazon.com/amazon-linux-ami/2016.09-release-notes/) that they cut out.  Sounds silly but its a big deal when you have a lot of machines.  And given that they write the billing rules, they could easily use that 7 seconds in their favor.  The fact that they don't gives me an incredible amount of confidence in AWS's billing practices.  Go AWS!
  
Cons:

* It can't run anywhere but Amazon.
* It can't run on Vagrant for local development
* Yum / RPM as package managers; this is a personal choice but I vastly prefer apt-get

# How Important Is this With Automated Provisioning?

In the days where you configured Linux manually, picking the right distribution was actually quite important.  Thanks to automated provisioning tools like Ansible, I'm not so sure now.  I've already used Ansible to move from one version of Linux to another and its just not that hard.  If you write your Ansible playbook properly and abstract things like the username into variables, you can modify it pretty easily to go between distros.

# Summary

In the end you likely want to pick:

* A well supported Linux distro.  I'd recommend either Ubuntu, RedHat or the Amazon Linux AMI
* 64 Bit 
* HVM Virtualization
* EBS Root Device


