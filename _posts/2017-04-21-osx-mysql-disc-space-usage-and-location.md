---
layout: post
title: OSX MySQL Disc Space Usage and Location
category: mysql
tags: ["osx", "mysql", "mariadb", "saas", "ruby", "hyde"]
description: Undertanding how your data is stored is key to estimating the size of the servers you need to lease.  Here I look into mysql disc usage.
---
Your permanent storage for a SAAS app is always one of your single biggest per user costs.  There are two ways to get this info -- at the SQL layer with a query and at the filesystem layer.  Each method is explained.

# Getting Disc Space From MySQL With a Query

You can run this query:

    select table_schema, sum((data_length+index_length)/1024/1024) AS MB from information_schema.tables group by 1;

and you'll get back a per database assessment of disc space used.  That's the easiest way to get this information.  Here's what it looks like:

    | seira_crawler_development         | 354.68750000 |
    | seira_crawler_test                |   0.23437500 |
    | seira_watch_development           |   0.75000000 |
    | seira_watch_site_development      |   0.12500000 |
    | seira_watch_web_app_1_development |   2.82812500 |
    | seira_watch_web_app_2_development |   1.21875000 |

# Where Is Your Physical Database Instance?

Run this mysql query from your command line:

    mysql -uUSER -p -e 'SHOW VARIABLES WHERE Variable_Name LIKE "%dir"'

You'll see something like this:

    mysql -uUSER -p -e 'SHOW VARIABLES WHERE Variable_Name LIKE "%dir"'
    Enter password:
    +---------------------------+---------------------------------------------------------+
    | Variable_name             | Value                                                   |
    +---------------------------+---------------------------------------------------------+
    | aria_sync_log_dir         | NEWFILE                                                 |
    | basedir                   | /usr/local/Cellar/mariadb/10.1.19                       |
    | character_sets_dir        | /usr/local/Cellar/mariadb/10.1.19/share/mysql/charsets/ |
    | datadir                   | /usr/local/var/mysql/                                   |
    | innodb_data_home_dir      |                                                         |
    | innodb_log_arch_dir       | ./                                                      |
    | innodb_log_group_home_dir | ./                                                      |
    | innodb_tmpdir             |                                                         |
    | lc_messages_dir           |                                                         |
    | plugin_dir                | /usr/local/Cellar/mariadb/10.1.19/lib/plugin/           |
    | slave_load_tmpdir         | /var/folders/76/mqchlgzs6x5cv2f11jh3jkjw0000gn/T/       |
    | tmpdir                    | /var/folders/76/mqchlgzs6x5cv2f11jh3jkjw0000gn/T/       |
    | wsrep_data_home_dir       | /usr/local/var/mysql/                                   |
    +---------------------------+---------------------------------------------------------+

The path datadir is where your data is stored.  For my system I want to look into this path: /usr/local/var/mysql/.

# Assessing Disc Space Usage

Running an ls -l on the path in datadir will show you all your databases on your development machine.  Doing a du -h on the path to any database on your system will show you a result like this:

    du -hc /usr/local/var/mysql/seira_crawler_development/
    400M    /usr/local/var/mysql/seira_crawler_development/
    400M    total

That's the metric for my backing crawler data archive.  The data for a single user instance is:

    du -hc /usr/local/var/mysql/seira_watch_web_app_1_development/
     12M    /usr/local/var/mysql/seira_watch_web_app_1_development/
     12M    total

# Scaling the Numbers Up

If you want to assess your disc space needs for a SAAS app, take your per user disc space needs and then multiply it by the number of users that you are projecting to handle and then add the disc space for any system level databases (such as the crawler data above).

# Adding the Numbers to a Dashboard

If your SAAS app supports an admin tool of any type then you want to watch the growth of this number pretty carefully since unexpected database growth can lead to system outages and the like.  Here's a quick Ruby snippet to get this information as a float which you could log, graph, etc:

    def self.database_size
      sql = "select table_schema, sum((data_length+index_length)/1024/1024) AS MB from information_schema.tables where table_schema='#{Rails.configuration.database_configuration[Rails.env]["database"]}' group by 1;"
      results = ActiveRecord::Base.connection.select_all(sql)
      return results.first["MB"].to_f
    end
    
  I'm getting the name of the current database in an environment agnostic way using: **Rails.configuration.database_configuration[Rails.env]["database"]**.  That value was read from the configuration file.  You could also get it from: **ActiveRecord::Base.connection.current_database** (which to use depends on whether or not you are using ActiveRecord or a different storage abstraction).
  
  Note: I'm feed this, via a JSON feed, to my new Cartazzi engine and I'm pretty pleased with this as an admin tool.

# References

* [Finding Your MySQL Data Directory](http://stackoverflow.com/questions/17968287/how-to-find-the-mysql-data-directory-from-command-line-in-windows)
* [mysqldiskusage utility (not always available)](https://dev.mysql.com/doc/mysql-utilities/1.5/en/mysqldiskusage.html)
* [Calculating Disc Space Usage with a Query](https://dba.stackexchange.com/questions/14337/calculating-disk-space-usage-per-mysql-db)
* [Getting Current ActiveRecord Configuration](http://stackoverflow.com/questions/10001583/how-to-check-the-database-name-that-activerecord-uses)