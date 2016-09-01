---
layout: post
title: When OSX 10.9 + and MySQL 5.6 Don't Work
category: mysql
tags: ["mysql", "osx"]

---
I recently was traveling and off my trusty home machine and on a new laptop running Mavericks. And I found that when I worked on one of my applications (Hi Jim!), I was getting this error constantly:

Lost connection to MySQL server at 'sending authentication information', system error: 32

That's not a good error. I dug into it and found this Stack Overflow post:

http://stackoverflow.com/questions/17813630/mysql-5-6-headaches-on-mac-osx

And I dug into it and its the classic -- OSX is Unix; except its not kind of crap. Sigh. And since MySQL 5.6 defaults to

innodb_file_per_table = ON

If you have any kind of a large mysql installation (and mine are huge) then you're going to have issues. No way around it.  So here are the steps to fix it:

Create a my.cnf file in /etc.  All it needs is the following:
[mysqld]
innodb_file_per_table = OFF
Then reload mysql.  If you’re using home-brew then you need to do this:
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
And this is the worst part — dump your databases and reload.  I’m sorry.  There’s just no way around it.
 