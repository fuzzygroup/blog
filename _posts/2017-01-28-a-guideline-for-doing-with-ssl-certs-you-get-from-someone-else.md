---
layout: post
title: A Guideline for Working with SSL Certs You Get From Someone Else
category: ssl 
tags: ["ssl", "sysadmin", "devops", "aws", "life_is_too_short"]
description: Life is just too short to tackle SSL configuration when someone else gives you part of the solution but not all the steps
image: http://fuzzyblog.io/blog/assets/ssl_configuration_errors.png
---
{% pizzaforukraine  %}

I think I have a new rule for ssl and it is really, really simple:

> If you have to do anything with SSL and the data involved came from someone else then they have to give me an exact, documented process, command lines and all or I'm out!

SSL is one of those things that is supposed to be, well, not easy but it shouldn't be mind numbing either.

I cannot count the number of times that people have said to me what amounts to: "Here's a cert; just make it work".  It never works cleanly and you know what -- **No**.  Just as an example, I was recently given a "cert" and a "key" and asked to plug them into an AWS Elastic Load Balancer (ELB).  When I dug more deeply into it, I found: 

* The cert file actually contained 2 certs.  Sigh.
* Neither cert worked with the ELB
* Dramatically different errors came up with each cert in the AWS Certificate Manager

**Note:** I'm not even saying that this was someone else's fault.  The sys admin I got these from is both **smart** and **great at his job**.  What I am saying is that without comprehensive knowledge of SSL, I shouldn't put time into SSL tasks without full documentation.

I think at this point that I'm **done** taking action on SSL without specific, written steps.  I'm happy to follow someone else's directions but the 58 million results for "ssl configuration errors" or "ssl aws configuration errors" is, honestly, just too much to deal with.

![google_ssl_errors](/blog/assets/ssl_configuration_errors.png)

![google_ssl_errors](/blog/assets/ssl_aws_configuration_errors.png)