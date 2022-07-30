---
layout: post
title: Adding Mosh Support to Your AWS Servers
category: aws
tags: ["aws", "mosh", "devops", "osx", "ansible"]
description: When you find that your SSH connections are unreliable, particularly on mobile, the using mosh instead of ssh can improve the reliability of your server access.
---
{% pizzaforukraine  %}

Mosh is an open source project that I've been tracking for the past several years as an SSH replacement and it appears that it is finally at a point where it is ready for me to put it into production.  In this tutorial I document the process of installing Mosh client side and server side along with the necessary security group configuration.  In case you're not aware of Mosh, [Mosh](https://mosh.org/) is a UDP based addition to SSH which improves the reliability of connecting to your servers, particularly on mobile.  One of the notable benefits of mosh over ssh is that mosh doesn't fill up buffers so a CTRL+C key sequence actually stops things immediately. 

# Step 1: Installing the Mosh Client Software

If you're using OSX and HomeBrew then you can install the mosh client software with a simple:

> brew install mobile-shell

If you use a different platform then you can find installation instructions [here](https://mosh.org/#getting).

# Step 2: Installing the Mosh Server Software

On an Ubuntu box, Mosh is now much easier to install since the package is covered in the standard repositories:

> sudo apt-get install mosh

# Step 3: Opening Your Security Group

The hardest part of all this is actually opening a *hole* in your AWS security group to allow the Mosh communications protocol to pass through.  Since ssh is an internet standard, a hole for ssh's port 22 is always open on an AWS security group.  What you have to do for mosh is:

* Open a UDP type
* Port Range 60000 - 61000
* Accessible to anywhere (or just your ip address; up to you)

Here's what your security group settings should look like:

![mosh_security_group.png](/blog/assets/mosh_security_group2.png)

Here's how to get to your AWS security group:

1.  Log into the AWS console.
2.  Select EC2 instances.
3.  Scroll down on the left hand sidebar until you see Security Groups.
4.  Click the Security Group links and then select the group you want to modify from the list at the top.  
5.  Select the Inbound tab and then click the Edit button. 
6.  Scroll to the bottom and then click Add Rule and define the rule per the screenshot above.

# Step 4: An Ansible Role for Provisioning Your Server

Here is a simple ansible role for adding mosh support to your server using Ansible as provisioning tool:

    - name: install mosh
      apt: pkg=mosh state=present

By adding this role into whatever you use for a bootstrapping task, you can add mosh support to all your boxes with one command.  And, if you used a single security group for all your AWS instances, that may be the only thing to you need to make all boxes accessible by mosh instead of ssh.

# Step 5: An Example of "moshing in" Using an AWS Pem File

I ssh in to my AWS boxes using a command like this:

> ssh -i ~/.ssh/fuzzygroup2.pem ubuntu@xyz.com

Here is the Mosh equivalent:

> mosh --ssh="ssh -i ~/.ssh/fuzzygroup2.pem" ubuntu@xyz.com

My thanks (and an upvote) to [Server Fault](https://serverfault.com/questions/825173) for answering this part of it.
