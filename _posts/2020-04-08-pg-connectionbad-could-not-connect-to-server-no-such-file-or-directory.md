---
layout: post
title: PG ConnectionBad (could not connect to server No such file or directory)
category: postgres
tags: ["postgres"]
---
{:.center}
![IMG_2993.jpeg](/blog/assets/IMG_2993.jpeg)

I've recently had the situation where my personal development box (OSX Mojave, Rails, Postgres) has become unstable with, at times, multiple crashes per day.  I logged in this morning and found myself getting errors like this:

    PG::ConnectionBad (could not connect to server: No such file or directory)

I did some digging and even though Postgres appeared to be running to brew, it was a false positive due to a leftover postmaster.pd file.  Here was the fix:

1. First make sure that postgres isn't running use ps i.e. **ps auwwx | grep post**.
2. Delete the file: /usr/local/var/postgres/postmaster.pid i.e. **rm /usr/local/var/postgres/postmaster.pid**
3. At this point brew will, foolishly and oddly, still think Postgres is running so do do a **brew restart postgres**

Here's a handy [Stack Overflow reference](https://stackoverflow.com/questions/13573204/psql-could-not-connect-to-server-no-such-file-or-directory-mac-os-x).

**Note**: Make absolutely sure that postgres is NOT running before you delete postmaster.pid or you risk serious database corruption / data loss.