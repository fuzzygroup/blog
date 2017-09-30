---
layout: post
title: Creating an HTTPS Site on AWS with a .IO Domain
category: aws
tags: ["aws", "io", "https"]
description: AWS Certificate Manager makes creating a .io domain site tricky.  Here is how to get past site authorization when you don't have an email server of your own on the .io domain.
---
I recently registered my first .io domain using an all AWS stack (Route 53, EC2, Elastic Load Balancer or ELB, Amazon Certificate Manager or ACM) and I found the process mildly odd -- to the degree that I know that it will either bite me again or it will bite someone else.  Either way I thought that it would be best to fully document the process.

The site I'm building has login and as such https is important for this site.  Although I could have used [Let's Encrypt or CloudFlare](https://nickjanetakis.com/blog/lets-encrypt-vs-cloudflare-for-https) for the https, if you're using https on AWS then there's a good chance that you are using an ELB and ACM as they make SSL brilliantly simple.  In all my years of deploying SSL, it has never been as simple as using this AWS stack and I sincerely recommend it.  The oddness occurred when I had to bind the .io domain into the certificate itself.  This process requires an email authentication to the owner of the domain to ensure that no one compromised your AWS credentials.  When you are using a normal .com or .net domain and you do this, Amazon sends the email to the email address on the domain registration itself, easy peasy.  When you are using a .io account, the email is NOT sent to the email address on the domain registration but it is instead sent to all of these:

* administrator@your_domain.io
* hostmaster@your_domain.io
* postmaster@your_domain.io
* webmaster@your_domain.io
* admin@your_domain.io

To Amazon's credit, they do kind of disclose this in the ACM documentation [here](http://docs.aws.amazon.com/acm/latest/userguide/troubleshoot-iodomains.html). Here's the relevant passage:

  ACM does, however, send validation email to the following five common system addresses where your_domain is the domain name you entered when you initially requested a certificate and .io is the top level domain.

  (see above)

  To receive validation mail for an .IO domain, make sure that you have one of the preceding five email accounts enabled. If you do not, you will not receive validation email and you will not be issued an ACM certificate. 

The problem here is that like a lot of us, probably most of us, I don't have a mail server running on my .io domain so there's nothing to receive the email (so I can respond to it).  Now I could have set up a mail server but a much, much easier approach is to use [ImprovMX](http://improvmx.com/) which promises "Free painless email forwarding for your domains" and it really, really delivers.  Within only a few minutes, I had my ACM mailing and I was off to the races.  With any luck, I will even launch my new site later this week.  

ImprovMX is strongly, strongly recommended.

# Thank You

As always, I resolved this with my favorite pairing buddy, [Nick Janetakis](http://www.nickjanetakis.com).  He does Docker stuff and is very, very talented.  He is also a Let's Encrypt expert.  Recommended.
