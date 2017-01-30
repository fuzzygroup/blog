---
layout: post
title: Linux Tip of the Day - Use ncdu for Disc Space Usage
category: linux
tags: ["linux_tip_of_the_day", "linux", "sysadmin"]
description: Linux Tip of the Day - Use ncdu to analyze your disc space usage and find huge directories
image: http://fuzzyblog.io/blog/assets/ncdu3.png
---
If I was to look back over the time I've spent doing sys admin work, I would guess that I've spent more time singing the song:

> Where oh here has my disc space gone, Where oh where could it be?

than anything else.  Managing storage just plain **sucks**.  And ever since we moved from hard discs to first SSDs and now cloud boxes with 8 gig partitions, well, its a bigger issue than ever.  

The Linux and OSX tool ncdu actually makes this pretty easy.

Install on Linux it as follows:

> sudo apt-get install ncdu 

Install on OSX it as follows:

> brew install ncdu 

Start it as follows:

> ncdu

And you will get a character mode interface you can move with the arrow keys to get a better feel for the disc space.  Here are some screen shots:

![ncdu1.png](/blog/assets/ncdu1.png)
![ncdu2.png](/blog/assets/ncdu2.png)
![ncdu3.png](/blog/assets/ncdu3.png)
![ncdu4.png](/blog/assets/ncdu4.png)