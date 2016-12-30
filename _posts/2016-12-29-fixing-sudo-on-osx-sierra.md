---
layout: post
title: Fixing Sudo on OSX Sierra
tags: ["osx", "sierra", "sudo"]
category: osx
---
OSX Sierra makes a number of low level changes in how things operate.  Earlier I wrote about OSX and SSH errors.  If you're having issues with sudo then you may want to add this to the sudoers file:

    sudo visudo (this command gets)
    
    Defaults !tty_tickets
    
[Stack Overflow Reference](http://stackoverflow.com/questions/39474047/sudo-command-on-macos-sierra-does-not-respect-timestamp-timeout)