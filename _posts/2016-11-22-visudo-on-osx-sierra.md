---
layout: post
title: visudo On OSX Sierra
category: osx
tags: ["osx", "visudo", "mac"]
---
Having just gotten OSX Sierra on my new Macbook Pro, I added myself to the sudoers file and key getting sudo issues.  I found the answer on [Stack Overflow](http://stackoverflow.com/questions/39474074).  Essentially there is an undocumented change where you need to add:

    Defaults !tty_tickets
    
to the sudoers file when you run:

    sudo visudo
    
Joy oh undocumented joy.  