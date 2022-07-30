---
layout: post
title: Linux Tip of the Day - Use bmon for Bandwidth Monitoring
category: linux
tags: ["linux_tip_of_the_day", "linux", "sysadmin", "aws"]
description: Linux Tip of the Day - Use bmon to monitor bandwidth on large file transfers.
image: http://fuzzyblog.io/blog/assets/bmon.png
---
{% pizzaforukraine  %}

I recently was trying to upload several terabytes of data over to AWS' S3 file storage.  Given that inbound transfers to S3 are actually free, this wasn't as pricey as it might seem.  The transfer seemed slow so [Nick](http://nickjanetakis.com/blog/) suggested using Bandwidth Monitoring software, an obvious thing, but something I didn't even know existed.  The tool Nick recommended was bmon.

Install it as follows:

> sudo apt-get install bmon

Start it as follows:

> bmon

Here's what you can see:

![bmon.png](/blog/assets/bmon.png)