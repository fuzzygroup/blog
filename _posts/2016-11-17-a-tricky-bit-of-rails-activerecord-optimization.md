---
layout: post
title: A Tricky Bit of Rails ActiveRecord Optimization
category: rails
tags: ["rails", "active_record", "sql", "optimization", "mysql"]
---
Yesterday I discovered that queries on a table of N rows were sometimes taking in excess of a few minutes to execute.  N was fairly large -- my guestimate would be about 70 or 80 million rows (a count(*) is still running; update it was 73,381,312).  This is a table that is large enough that the last time I tried to do an ALTER TABLE on it, well, it took the better part of 24 hours and it was still on the copy to tmp table stage when I finally threw my hands up and implemented a shadow table structure to represent the changes.

This table has a number of indices on it although none of them were exactly what I needed.  Now in the **real** world of very large databases where things are:

* implemented incrementally
* rarely refactored
* never re-thought as business needs change
* are too large to go back and change

this is actually common.  It is often what I think of as The Forrest Gump school of working with indices:

> Indices are like a box of chocolate; you never know what you're going to get.
> [Source](https://en.wiktionary.org/wiki/life_is_like_a_box_of_chocolates)

The ActiveRecord operation in question was a check to see if a row already existed in the table.  Here's the SQL that the ORM was generating:

    SELECT  `link2016_q1s`.* FROM `link2016_q1s` WHERE `link2016_q1s`.`site_id` = 215345 AND `link2016_q1s`.`page_id` = 2401963 AND `link2016_q1s`.`url_no_www_sha1` = 'fe9f2487051ac4ab2a86bdf5c501336c2bda315b'  ORDER BY `link2016_q1s`.`id` ASC LIMIT 1\G
    
And here's the explain showing the query plan:    
    
    explain SELECT  `link2016_q1s`.* FROM `link2016_q1s` WHERE `link2016_q1s`.`site_id` = 215345 AND `link2016_q1s`.`page_id` = 2401963 AND `link2016_q1s`.`url_no_www_sha1` = 'fe9f2487051ac4ab2a86bdf5c501336c2bda315b'  ORDER BY `link2016_q1s`.`id` ASC LIMIT 1\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: link2016_q1s
         type: index
possible_keys: s_c_p_u,s_c_d_p,index_links_on_site_id_and_crawl_id_and_page_id,site_id_url,site_id_url_no_www
          key: PRIMARY
      key_len: 4
          ref: NULL
         rows: 4306
        Extra: Using where

As you can see this is damn near a worst case as the only index being used is the PRIMARY meaning that none of our indices are being used.  *Grumble*.

As with any optimization problem in computing -- any -- you have to understand what your tool does in order to solve it.  You may not like the constraints placed on you but you have to live with them because you rarely solve optimization problems in production by changing stack components.  In this case we're using MariaDB which is a mysql variant.  Here are some quick basics on MySQL index usage:

* there is one and only one index per query
* the query order in the where clause generally matters
* the same index is used to order results as the query

The first thing that I noticed here was that ActiveRecord was appending an order construct to the query, the "order by id asc" crap -- I didn't put that into ActiveRecord where statement.  *more grumbling*.  So what happens to our query plan if we remove that?  Here you go:

    explain SELECT  `link2016_q1s`.* FROM `link2016_q1s` WHERE `link2016_q1s`.`site_id` = 215345 AND `link2016_q1s`.`page_id` = 2401963 AND `link2016_q1s`.`url_no_www_sha1` = 'fe9f2487051ac4ab2a86bdf5c501336c2bda315b'  LIMIT 1\G
  *************************** 1. row ***************************
             id: 1
    select_type: SIMPLE
          table: link2016_q1s
           type: ref
  possible_keys: s_c_p_u,s_c_d_p,index_links_on_site_id_and_crawl_id_and_page_id,site_id_url,site_id_url_no_www
            key: s_c_d_p
        key_len: 5
            ref: const
           rows: 16206
          Extra: Using index condition; Using where

Hm... We're now at least using an index.  Even if it isn't the right index, I'd regard that as progress towards a positive direction.  There are times when the mysql query planner is damn hard to convince of changes so this is good.  

Fixing this default ordering is actually fairly easy, just add *.order("")* to the where statement.  If this code base wasn't so large then I'd dig into how to prevent this on an ongoing basis but, as always, this is hurry up and rush style work so there's no time for that.  Yes there will be a cost for that later -- there always is.

Looking at the explain statement above still bothers me as we're dealing with 16K rows.  There has to be something better than that.  So digging into the possible indices shows this:

    UNIQUE KEY `s_c_p_u` (`site_id`,`crawl_id`,`page_id`,`crawler_id`,`url_no_www_sha1`) USING BTREE,
    KEY `s_c_d_p` (`site_id`,`crawl_id`,`domain_id`,`page_id`) USING BTREE

Looking at these two indices, knowing that one of them is a UNIQUE key means that there will be less data in it -- and it is *always* faster, even with indices, to deal with less data.  I remember debating this point at length with my Feedster cofounder back in the day when we were building our 64 bit XML search engine.  He took the position that the indices would be efficient enough that the amount of data wouldn't matter.  I took the position that it is always faster, even with an index, to have less data to sift through.  

So, ideally, it would be great to use the s_c_p_u index if at all possible.  This should dramatically reduce the amount of data in the index and thus lower the ROWS.  The problem here is that I don't know what's in the crawl_id column and I don't care about it at all.  The crawl_id column was originally used to disambiguate between different crawl runs when we stored all page data, irrespective of crawl run, in a single table.  We've since moved to a per table sharded architecture but that never got removed (note to self -- deal with that for our upcoming crawl).  

Thinking about this for a few minutes made realize that we can leverage both indices to support the underlying goal of quickly checking if this row already existed.  Why not leverage the s_c_d_p index to get the list of crawl_ids and then push that into the next query.  This fulfills the constraint of MySQL wanting the parameters in the index to all be fulfilled.  And after a few minutes of tinkering led to this method:

    def exists?(site_id, page_id, no_www_sha1)
      crawls = self.where(:site_id => site_id).select("distinct crawl_id").map(&:crawl_id)
      
      result = self.where(:site_id => site_id, :crawl_id => crawls, :page_id => page_id, :url_no_www_sha1 => no_www_sha1).order("").limit(1).first

      return true if result
      return false 
    end

This gave a nice rails style syntax method that I can use to abort the operation if the data already exists i.e.

    return if exists?(site_id, page_id, no_www_sha1)
    
The only reason that I'm not having this method compute the no_www_sha1 value is that if we continue we're going to use it anyway so its better to pass it in directly.  I could have computed it in the method and then returned it back as a second parameter but then it should really be exists not exists? since my preference is that a ? postfixed method should really only return a single value either true or false.

Not bad for a bit of late Wednesday night hacking.  And, yes, I did just now fix the schema for our next crawl.  Ah the wonderful fast bliss of ALTER TABLE on tables without any data in them.