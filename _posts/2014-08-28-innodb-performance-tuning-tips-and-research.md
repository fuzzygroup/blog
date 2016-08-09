---
layout: post
title: Innodb Performance Tuning Tips and Research
---
MySQL is an astonishing piece of software but its worth noting that it is complex and requires work to really take advantage of.  No where is this more true than in performance tuning.

##Tuning Options

Here are some very useful tuning options.  See the first entry in Sources below for more details on each.  

* O_DIRECT.  Avoids double buffering but only use if you have hardware RAID controller and battery-backed write cache.
* innodb_file_per_table.  This is now a default but keep in mind that its not performance free.  I've seen performance hits here since there are more open files by definition (this adds at least 1 table per file) so you might need to boost open file limits.
* innodb_buffer_pool_size
* innodb_buffer_pool_instances
* innodb_thread_concurrency

##Sources:

* http://www.mysqlperformanceblog.com/2013/09/20/innodb-performance-optimization-basics-updated/
* http://www.mysqlperformanceblog.com/2008/11/21/how-to-calculate-a-good-innodb-log-file-size/
* https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-compatibility/ Worth reading to better understand what's going on with MariaDB
* http://www.tocker.ca/2013/09/17/what-to-tune-in-mysql-56-after-installation.html
* http://www.technobits.net/articles/63051/how-to-improve-innodb-performance-by-55-for-writebound-loads/