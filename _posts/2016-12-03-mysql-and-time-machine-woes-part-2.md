---
layout: post
title: MySQL and Time Machine Woes Part 2
category: mysql
tags: ["mysql", "time_machine", "backup", "mac", "osx"]
---
So I'm not alone with MySQL Time Machine woes.  My buddy [Dv](http://dasari.me) skyped me last night along the lines of "how do I get my MySQL stuff off Time Machine".  Sheesh -- it is an epidemic.  He is having the same type of virtual environment woes that I am where rvm / rbenv / chruby seem to cause nothing but OSX issues and he is looking to Vagrant for an answer.  This means that he's likely doing the re-install dance.  And since he has been a stellar trooper in assisting me for years with all kinds of random ass crap, it is my turn.

# Where Are My MySQL Databases?

The first step towards getting your databases back from Time Machine is to locate where they are supposed to be.  MySQL itself can tell you this:

    SHOW VARIABLES WHERE Variable_Name LIKE "%dir";
    +---------------------------+------------------------------------------------------+
    | Variable_name             | Value                                                |
    +---------------------------+------------------------------------------------------+
    | basedir                   | /usr/local/Cellar/mysql/5.6.21                       |
    | character_sets_dir        | /usr/local/Cellar/mysql/5.6.21/share/mysql/charsets/ |
    | datadir                   | /usr/local/var/mysql/                                |
    | innodb_data_home_dir      |                                                      |
    | innodb_log_group_home_dir | ./                                                   |
    | lc_messages_dir           | /usr/local/Cellar/mysql/5.6.21/share/mysql/          |
    | plugin_dir                | /usr/local/Cellar/mysql/5.6.21/lib/plugin/           |
    | slave_load_tmpdir         | /var/folders/rf/3tfhwgrj1sl85y6rcs4x_s5c0000gn/T/    |
    | tmpdir                    | /var/folders/rf/3tfhwgrj1sl85y6rcs4x_s5c0000gn/T/    |
    +---------------------------+------------------------------------------------------+

So we now know that our databases are supposed to be stored in /usr/local/var/mysql/.  That's what we need to get them back from Time Machine.

# Important STOP MYSQL First

The very first thing you need to do is stop mysql first:

    mysql.server stop

# Getting Them Back from Time Machine

Open a Terminal window and cd /Volumes and then find your Time Machine latest backup and change into /usr/local/var/mysql underneath it.  You should then theoretically be able to copy the back with a cp -r * /usr/local/var/mysql as per this [Stack Overflow post](http://apple.stackexchange.com/questions/139175/transferring-a-single-folder-from-a-time-machine-to-a-different-mac).  Please note that I have not done this myself yet since for my issues I cannot find the damn backup ever being made.

# Recommendation - DO NOT Restore to Previous Location - Do This Instead

After my personal issues with Time Machine and MySQL I no longer have faith that any data outside of /User/my_username will be correctly restored.  Personally I would make a directory structure like this:

    /Users/sjohnson
    /Users/sjohnson/servers
    /Users/sjohnson/servers/mysql
    /Users/sjohnson/servers/mysql/data
    /Users/sjohnson/servers/postgres
    /Users/sjohnson/servers/postgres/data
    /Users/sjohnson/servers/redis
    /Users/sjohnson/servers/redis/data
    /Users/sjohnson/servers/mongo
    /Users/sjohnson/servers/mongo/data
    
As best I can tell, I have lost every mysql database I've built since 2011 on my main development system and the only reason I'm not raging further is that I just don't have the mental energy given everything else I'm juggling.  I do think that if I do this approach then when Apple gets stupid in the future with Time Machine that this will protect me.

If you're going to this then you need to follow the steps below.  Alas I am getting a bit theoretical here since I haven't had time to do this for myself yet.

## Finding my.cnf

After HomeBrew installs mysql for you it creates a shell routine mysql.server.  Find it with which:

    which mysql.server
    /usr/local/bin/mysql.server
    
This file tells mysql where to store its data and you're going to need to:

* stop mysql 
* edit this shell script
* edit /etc/my.cnf which also seems to store this location

I don't know which is the primary and which is the default so personally I'd edit both.  You would then need to:

* adjust permissions and groups accordingly 
* adjust postgres, redis and mongo / anything else as well 