---
layout: post
title: Rails and ActiveRecord Optimization - Banishing MySQL File Sorts
category: rails
tags: ["rails", "mysql", "optimization", "activerecord"]
description: A filesort in your MySQL explain analysis indicates a performance problem.  ActiveRecord automatically adds a default ordering to your query that can cause this depending on your table structure.
---


MariaDB [seira_crawler_development]> explain SELECT  `page_archives`.* FROM `page_archives` WHERE `page_archives`.`url_type` = 'udemy_user' AND `page_archives`.`url_fid` = 'zohouniversity' ORDER BY `page_archives`.`id` ASC LIMIT 1\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: page_archives
         type: ref
possible_keys: page_type__date_created_at__url,url_fid__url_type__adate_created_at__url,page_type__meta_type__date_created_at__url
          key: url_fid__url_type__adate_created_at__url
      key_len: 1536
          ref: const,const
         rows: 2
        Extra: Using index condition; Using where; Using filesort
1 row in set (0.00 sec)

MariaDB [seira_crawler_development]> quit
Bye
sjohnson@ip-10-19-48-1:~/Dropbox/fuzzygroup/hyde/seira_crawler$ bundle exec rails c
#<Gem::Specification name=sidekiq version=4.2.10>
Loading development environment (Rails 5.0.2)
2.3.1 :001 > PageArchive.url_type_and_url_fid_exist?("udemy_user", "zohouniversity1")
  PageArchive Load (0.4ms)  SELECT  `page_archives`.* FROM `page_archives` WHERE `page_archives`.`url_type` = 'udemy_user' AND `page_archives`.`url_fid` = 'zohouniversity1' LIMIT 1
false
2.3.1 :002 > quit
sjohnson@ip-10-19-48-1:~/Dropbox/fuzzygroup/hyde/seira_crawler$ mysql -uroot -p seira_crawler_development
Enter password:
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 147
Server version: 10.1.19-MariaDB Homebrew

Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [seira_crawler_development]> explain SELECT  `page_archives`.* FROM `page_archives` WHERE `page_archives`.`url_type` = 'udemy_user' AND `page_archives`.`url_fid` = 'zohouniversity1' LIMIT 1\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: page_archives
         type: ref
possible_keys: page_type__date_created_at__url,url_fid__url_type__adate_created_at__url,page_type__meta_type__date_created_at__url
          key: url_fid__url_type__adate_created_at__url
      key_len: 1536
          ref: const,const
         rows: 1
        Extra: Using index condition
1 row in set (0.00 sec)


  # PageArchive.url_type_and_url_fid_exist?("udemy_user", "zohouniversity")
  def self.url_type_and_url_fid_exist?(url_type, url_fid)
    return true if PageArchive.where(:url_type => url_type, :url_fid => url_fid).order("").limit(1).first
    return false 
  end