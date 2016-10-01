---
layout: post
title: Rails 5 - The MySQL Plus / Async Query Mystery Once Again
category: rails
tags: ["rails", "mysql", "gem"]
---
I do a lot of work with high throughput db writes using MySQL and we've historically done this thru a bit of an oddity:

    Gemfile:

    gem 'mysql2'
    gem 'mysqlplus'

In our application:

    require 'mysql'
    class Mysql; alias :query :async_query; end

What this effectively does is load the async_query method of mysqlplus over the mysql2 gem's query method allowing non blocking queries.  This is an old school technique that we developed in the Rails 4 / Ruby 1.9.3 world and its gone badly awry now that we are in Ruby 2.3.1.  Or has it?  We've changed:

* ruby version
* rails version
* gem stack
* number of servers
* mysql version (now its MariaDB)
* operating system

This is all in the context of our custom crawler which has its own application framework (hence the require statement above).  With that many changes what we need to do is establish a benchmark.  Thankfully when things change in a major way for me, I keep my old development system available.  This will allow us to easily compare crawl throughput over a somewhat long time period.  Here's the initial results:

* Ruby 2.3.1 version of code base: 2 hours produced a crawl of:
  * 358 pages; 
  * 16492 links; 
  * 52 forms; 
  * 2443 unique urls; 
  * 358 page_bodies
* Ruby 1.9.3 version of code base: 2 hours produced a crawl of: 
  * 609 pages
  * 13660 links
  * 204 forms
  * 0 unique urls
  * 609 page_bodies
  
Clearly this is a significant difference so this problem has to be addressed.  All I've been going on so far is a feeling that we had a performance difference in our crawl results.  Now we actually have numbers and that's infinitely better -- always remember that **if you can't measure it then its not engineering**.  

This was done with the following process:

* bin/rails c Site.truncate_shards
* mysql -uroot -p banks_development < ~/Downloads/sites.sql 
* mysql -uroot -p banks_development < ~/Downloads/banks.sql
* mysql -uroot -p banks_development < ~/Downloads/processing_runs.sql 
* mysql -uroot -p banks_development < ~/Downloads/bank_details.sql
* bundle exec rake ucrawler:load_command_line_queue foo=bar OBJECT=Site METHOD=crawl_queue_all --trace
* bundle exec ruby script/ucrawler foo=bar NUM_THREADS=25 CRAWL_QUEUE=Site --trace

Benchmarking could be done on a development system or the production boxes but by benchmarking on a development system we can eliminate the impact of the OS change, the server types, etc and limit it to, generally, just the ruby level differences.

The key difference is the lack of the mysqlplus gem and the alias method on query being mapped to async_query.  