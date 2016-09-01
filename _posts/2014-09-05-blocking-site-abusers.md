---
layout: post
title: Blocking Site Abusers
category: sysadmin
tags: ["sysadmin", "ufw", "linux"]

---

When you run a production web site, and we run many of them then someone is going to run a bot against you and decide to treat your infrastructure poorly.  Normally I have features at the app level (i.e. inside our own codebase) which deals with that but that incurs the cost of:

* processing the http request
* using a worker thread at the apache level
* running up a rails instance

That's a lot of overhead just to deny something.  Now that our infrastructure is vastly more modern, we can do this instead with ufw, the standard Linux firewall.  Here's how:

1. Your first step is to recognize that on a box that runs an http service on ports 80 or 443, that if you want to block an abuser, you need to make sure that your new firewall rule is executed BEFORE the rules that allow port 80 and 443 access.  Ufw rules are executed top to bottom, first to last.  That's key.
2. sudo ufw insert 1 deny from 88.249.65.0/24
 
That would block anyone on the ip address range 88.249.65.*

Hat tip to Jared for figuring this out.  Double hat tip to him for mandating that we run ufw on every single box.