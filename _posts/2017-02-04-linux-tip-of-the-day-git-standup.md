---
layout: post
title: Linux Tip of the Day - git-standup
category: linux
tags: ["linux_tip_of_the_day", "linux", "git"]
description: Linux Tip of the Day - Use git-standup to understand what's going on with a codebase and explore it by author, day range, depth and more.
image: http://fuzzyblog.io/blog/assets/git-standup.png
---
{% pizzaforukraine  %}

Over on Twitter, [@kamranahmedse](https://twitter.com/kamranahmedse) pointed out to me that git-standup does similar things to [git-recall](http://fuzzyblog.io/blog/linux/2017/01/30/linux-tip-of-the-day-git-recall.html) which I recently talked about -- and more.  First off -- thank you!  Based on his [github account](https://github.com/kamranahmedse/git-standup), I'd assume that git-standup is his project and he's done really nice work here.

In case you missed the previous post on git-recall, git-standup helps you to understand what's been going on with a codebase by looking at commits either during the same day or a given range of days.  

Install on Linux as follows:

> curl -L https://raw.githubusercontent.com/kamranahmedse/git-standup/master/installer.sh | sudo sh

or you can use npm:

> npm install -g git-standup

or if you are on OSX then you can use brew:

> brew install git-standup

Here are the **very useful** options that git-standup supports:

```bash
$ git standup [-a <author name>] 
              [-w <weekstart-weekend>] 
              [-m <max-dir-depth>]
              [-f]
              [-L]
              [-d <days-ago>]
              [-D <date-format>] 
              [-g] 
              [-h]
```

After you change into a directory where you're working on something git, do this:

> git-standup

and you'll get a view of what happened over the past day.  Where git-standup shines over git recall is in its use of command line options to expand beyond the previous day.  And here's an example of looking back over the past 5 days:

![git-standup.png](/blog/assets/git-standup.png)

