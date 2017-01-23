---
layout: post
title: Quick Reference Low Level Unix Disk Commands You Often Use for AWS Volumes
---
I recently had a bizarre failing disk problem and these were all the commands I used:

* fsck -M -fy /dev/sdb1 -- check a file system; change /dev/sdb1 to your device [Stack Overflow](http://askubuntu.com/q/552039/621300)
* dmesg -- lets you see low level hardware errors
* df -T

Common Error Messages

When you get *“Input/output error” when accessing a directory* then:

> Input/Output errors during filesystem access attempts generally mean hardware issues. 
> Type dmesg and check the last few lines of output. If the disc or the connection to it is failing, it'll be noted there. [Stack Overflow](http://unix.stackexchange.com/a/39908)