---
layout: post
title: AWS Tutorial 22 - Making Your Boxes Pingable
category: aws
tags: ["aws", "security_group", "ping", "security"]
---
The security default for AWS is brilliantly simple: **Everything, absolutely everything, is locked down by default**.  Once you understand that then developing on the AWS platform becomes a lot simpler.  Let's take, for example, a simple EC2 instance: 

1.  You create it and you would generally assume that a server is pingable.  
2.  So you try pinging the DNS name and it fails.  Hm... 
3.  So you try pinging the public IP and that fails.  

The answer here is simple -- everything is locked down by default.  Even something as innocuous as ping.  Every AWS box comes with what's called a Security Group and Amazon describes this a *[virtual firewall that controls the traffic for one or more instances](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)*.  Every box you create on AWS will automatically get a Security Group, confusingly named, Launch Wizard N where N is just an incrementing integer.  And since most of us generally accept defaults, you may end up with security groups named: 

* Launch Wizard 1
* Launch Wizard 2
* Launch Wizard ..
* Launch Wizard 11

At least that's what my many attempts at AWS experimentation have left me with.  I'd strongly suggest you name these well.  For the bulk of us, networking is confusing enough without cruft like "Launch Wizard N".  Honestly!

Stack Overflow, as always, has a useful [piece](http://stackoverflow.com/questions/21981796/cannot-ping-aws-ec2-instance) on this.  Here's what to do:

1.  You have to edit the Security Group to which your EC2 instance belongs.  If you don't yet have a security group then add a new one.
2.  Add a new rule and select the All ICMP option from the drop downs.
3.  If you want to restrict people probing for your instance then lock it down to your own IP address but there are pros and cons.

**Note:** AWS strongly wants you to lock down all non http / https traffic to your own ip address and it will actually natter at you about this even for ping.  If you are using a remote monitoring service, however, like the absolutely wonderful [wormly](http://www.wormly.com), then locking this down to your ip address will prevent that remote service from monitoring via ping.  Given that ping is far less overhead than http monitoring, you might want this so make a real decision here.
