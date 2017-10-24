---
layout: post
title: pkill Rocks
category: unix
tags: ["linux", "unix", "command_line", "osx", "pkill"]
---
One of the singularly best things about Unix / Linux is that even after using it for literally years, there is always a new thing to learn.  The best way to learn something is to just get frustrated and then **google**.  There is always a different way to do it -- sometimes it is simple i.e. better and sometimes it might be really hard but there is always a different way.  

The problem I had the other day was I kept hitting open file handle limits.  I'm not sure why but when this happens it is generally reboot time and I hate reboot time so anything I can do to keep my box alive long enough to get the job done makes me just a bit less cranky.  In this case I had a strikingly large number of terminal windows open and I needed to get them shut down.

Activity Monitor wasn't helpful and the only thing that was responsive was a sole instance of the Node JS based HyperTerm.  And, oddly enough, that was the one bit of my system which was responsive.  I knew that I could do ps auwwx | grep iTerm but, well, that would just suck:

![pkill_rocks](/blog/assets/pkill_rocks_01.png)

A quick google for *kill process by name* led me [here](http://stackoverflow.com/questions/160924/how-can-i-kill-a-process-by-name-instead-of-pid) and it was a great illustration of the swiss army knife nature of Unix.  Options ranged from *pkill* to *killall* to *shell one liners*.  pkill, while risky, worked great:

![pkill_rocks](/blog/assets/pkill_rocks_02.png)

# Risky

pkill is a pattern matching tool so if you're not careful it will take out anything that matches.  Here's a [pkill man page](https://linux.die.net/man/1/pkill) and use with care but I surely like it.