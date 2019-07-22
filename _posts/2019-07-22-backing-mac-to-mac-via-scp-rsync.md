---
layout: post
title: Backing Mac to Mac via scp / rsync
category: osx
tags: ["osx", "backup"]
---
I found myself turning my old Macbook Air over to my wife to use when the cursed butterfly keyboard on her new MacBook died.  And even tho I had theoretically used Dropbox to sync my data with other machines, a quick check on this machine revealed something like 200 top level directories in ~/Dropbox while a check against my "current" machine revealed only 148 top level directories.

**WHAT THE FERENGI Dropbox !!!!**

And that convinced me that I needed to run a backup on this machine before I turned it over to my wife.  Naturally I found that a Time Machine backup failed and, honestly, I found myself with little desire, inclination or will to fix Time Machine.

This led me to attempt to backup this Mac via an scp command to my big desktop Mac which has plenty of free disc space.  So I used this shell command:

    scp -p -r ~/Downloads/* 192.168.1.25:/Users/sjohnson/backups/macbook_air/Downloads/

as a test command to backup the ~/Downloads directory from one machine to another.  And, annoyingly, I found that after only a few gigabytes, my scp would fail with a networking error.  After trying this again (and again and again), I came to the conclusion that I was fighting an untenable battle that felt a lot like a land war in Asia.  And this led me to Google which, rapidly, led me to rsync, a tool I love but which I never seem to think to use.  Here was the command I finally came up with

    rsync -avh -e ssh Downloads/* 192.168.1.25:/Users/sjohnson/backups/macbook_air/Downloads/

In case you aren't aware, the benefit to [rsync](https://linux.die.net/man/1/rsync) is that it will keep track of your progress to date and resume incomplete copies.  