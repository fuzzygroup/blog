---
layout: post
title: Tmux Mouse Mode Problems Under Linux
category: tmux
tags: ["tmux", "linux", "sys_admin"]
description: If a Tmux session has killed your mouse then turn off mouse mode.
---
{% pizzaforukraine  %}

I am in the process of decommissioning a data center I set up about 2 years ago.  This was done in my pre-ansible days when I used Chef to bootstrap all the servers and it only functioned about 90% of the way leaving the final configuration of each server entirely manual.  This has meant that rather than each server being identical to every other server, each one is a unique "snowflake".  And snowflake servers can really be the bane of your existence at times.  

One box, for example, when you run a [Tmux](https://tmux.github.io/) session it mysteriously trashes the mouse and you can't actually copy some bit of text for pasting it later.  This doesn't sound all that significant until you are trying to remember a mysqldump statement that is, with all options, about 220 characters long, it is 3:07 am and you find yourself saying "Man this is just the #U$I#U$#I balls".  

And that's when you realize that even if you are turning these boxes off in the next 15 minutes it would still be worth fixing immediately.

The problem was in the file ~/.tmux.conf and it was the presence of these lines:

    setw -g mode-mouse on
    set -g mouse-select-pane off
    set -g mouse-resize-pane off
    set -g mouse-select-window off

To be honest this is a problem that I likely introduced myself - I vaguely remember noodling on this configuration file about 18 months ago and then something blew up.  A quick :wq in VIM and I was off to the next disaster.  And since I didn't restart tmux entirely (configuration is loaded only on startup), it wasn't until the box was physically rebooted, long after I had forgotten this particular hell, that the mouse died and I was left scratching my head.  Sigh.

Had I read it at the time, this [blog post](http://tangledhelix.com/blog/2012/07/16/tmux-and-mouse-mode/) might have been useful.