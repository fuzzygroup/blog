---
layout: post
title: Running out of iNodes, Coo Coo Cachoo
category: sysadmin
tags: ["sysadmin", "unix", "inode"]

---
When you run out of inodes, here's what to do:

* Read
  * http://stackoverflow.com/questions/653096/howto-free-inode-usage
* Do
  * df -ih
  * sudo find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n

Sigh….