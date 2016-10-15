---
layout: post
title: AWS Tutorial 17 - Wrapping Up Our SSH Issues By Using Monit For Process Monitoring
category: aws
tags: ["aws", "ssh", "monit", "ansible"]
---
So the solution to our SSH issues is actually fairly simple:

* Ruby code is using too much memory / cpu; memory leak?  bad code?  who knows.
* A watchdog process needs to look out for processes using too many resources and shut them down so that the underlying init / service system can restart them

[Mike Perham](https://fuzzygroup.github.io/blog/ruby/2016/10/10/a-conversation-with-mike-perham.html) helpfully pointed out the right approach to solving this - use a systems monitoring tool like [Inspeqtor](https://github.com/mperham/inspeqtor) or [Monit](https://mmonit.com/monit/).  I don't normally do devops to the level that I am now so getting this perspective was key.  Given that its a 50 / 50 choice, I flipped a coin and chose Monit.

In the rest of this post, I'll go over how I used Ansible to configure Monit.