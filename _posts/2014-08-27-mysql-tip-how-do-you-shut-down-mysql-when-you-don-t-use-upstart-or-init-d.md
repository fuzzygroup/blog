---
layout: post
title: MySQL Tip - How do you shut down mysql when you don't use upstart or init.d
---
When you find yourself uttering statements like:

That mysql tip is from Peter Zaitsev.  I'll follow it because I trust him.  

And you actually know who Peter is -- without having to look him up -- then perhaps you've gone too far down the MySQL rabbit hole.  But anyway…  MySQL is normally started from either an init.d script or an upstart routine like this:

* sudo /etc/init.d/mysql start
* sudo service mysql start

And if you need to shut mysql down then you use the corresponding:

* sudo /etc/init.d/mysql stop
* sudo service mysql start

Now both of these are actually just a front end to mysqld_safe which is a shell script supplied by MySQL which handles running the executable, pid file and such.  Its an old school Linux / Unix approach to life and it works great.  

Now when MySQL is having problems starting up like, for example, you moved a database from Connecticut to Indianapolis via copying a mysql cold backup (directly copying the innodb files) and you got the number of log files wrong in my.cnf or innodb.cnf then you'll find that if you start mysql thru upstart or init.d, you may not get error messages since they get "lost" at the level between the mysqld_safe script and init.d / upstart.  In this case then you can run mysqld_safe directly like this:

* sudo /usr/local/mysql/bin/mysqld_safe

Now the problem that raises is that once you finally get it going, you will NOT have a stop command.  In that case you can use:

* mysqladmin shutdown