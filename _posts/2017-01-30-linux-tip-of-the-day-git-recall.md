---
layout: post
title: Linux Tip of the Day - git recall
category: linux
tags: ["linux_tip_of_the_day", "linux", "git"]
description: Linux Tip of the Day - Use git recall to see what you did recently
image: http://fuzzyblog.io/blog/assets/git_recall1.png
---
Every so often your boss asks you what you've been working on and if you have been all over a code base it can actually be hard to break it down.  The new git recall command actually makes this pretty easy.  This is a new Linux tool I just learned about - [Docs](https://github.com/Fakerr/git-recall) / [Hacker News Discussion](https://news.ycombinator.com/item?id=13517486).

Install it on Linux as follows:

> npm install --global git-recall

Install it on OSX as follows:

> brew install less

-or- you might need to do:

> brew install homebrew/dupes/less

**Note**: I know you already have less installed on your system.  You need lesskey which git recall relies on but Apple, unhelpfully, [did not include](http://apple.stackexchange.com/questions/27269/is-less1-missing-lesskey-functionality).

Once you have lesskey then you need to install git recall itself:

> npm install --global git-recall

After you change into a directory where you're working on something git, do this:

> git recall

The initial view shows you your commits in a recent time frame:

![git_recall_.png](/blog/assets/git_recall1.png)

You can go up and down the list and select a commit that you're interested in with the arrow keys and enter or j/k and enter.  I had issues with the arrow keys so keep j/k in mind.  Then you'll see the commit details:

![git_recall_.png](/blog/assets/git_recall2.png)
