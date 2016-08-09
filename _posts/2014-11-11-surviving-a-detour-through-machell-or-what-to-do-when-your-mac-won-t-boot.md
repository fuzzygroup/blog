---
layout: post
title: Surviving a Detour through MacHell or What to Do When Your Mac Won't Boot
---
Sigh.  Its been one of those days where every box I touch has blown up spectacularly and going through this taught me some interesting things that I didn’t know (or know specifically how to do) so here are some tips when your Mac won’t boot:

Command+R gets you to the low level tools for re-installing the OS.  Hold Command+R down until you see the Apple logo.  This should work but doesn’t always.
Command+V held down until you see the Apple logo gives you a BSD style unix text listing which tells you how the boot process is going.
sudo nvram boot-args="-v” entered into a terminal window (type it and then press enter) makes the text mode boot process the standard and I’ve now done that on all my machines
Command+S held down until you see the Apple logo boots the machine in single user mode.  At that point you can mount the hard drive as read/write to make changes.
If you see the message: BootCacheControl: Unable to open /var/db/BootCache.playlist: 2 No such file or directory then chant “iFixit Rocks!!!” and read this [article](https://www.ifixit.com/Answers/View/192201/Unable+to+open+-var-db-BootCache.playlist:+2) and follow the directions.
