---
layout: post
title: Ids, Fids, Tokens and Permalinks
category: software_engineeering
tags: ["software_engineeering"]
---
These days I mostly build web database applications but there was a time when I built things which had permalinks as a big component and which did more than a bit of crawling / scraping the public web.  I find myself needing to build that type of underlying data structure again and I thought it might be illustrative to write up the database schema.

I'm building a tool for capturing knowledge out of rich media like Youtube videos and Podcasts.  I'm not stating that this is new, unique or novel; this is something that I simply want for myself.  Having mostly ignored Youtube since its launch, I've recently fallen in love with the [Computer Museum's Oral History](https://www.youtube.com/user/ComputerHistory/search?query=oral%20history) project where I can watch my hero's talk.  If you're a serious tech nerd, I highly recommend it -or- if you wish to punish your non-tech significant other!

Here's the schema I've arrived at (this is being implemented in Rails):

```ruby
class CreatePullQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :pull_quotes do |t|
      t.timestamps
      t.datetime :source_metadata_fetched_at
      t.date :date_created_at
      t.string :token
      t.string :url
      t.string :url_no_www
      t.string :url_domain
      t.boolean :resolved, :default => false
      t.string :resolved_url
      t.string :resolved_domain
      t.string :permalink
      t.string :hostname
      t.string :fid
      t.string :title
      t.boolean :transcribed, :default => false
      t.string :transcription_url
      t.references :user, null: false, foreign_key: true
      t.references :pull_quote_type, null: false, foreign_key: true  
      t.jsonb :details
    end
    add_index :pull_quotes, [:fid, :pull_quote_type_id, :user_id], :unique => true
  end
end
```

**Note**: I've previously alleged that blogging is a core engineering tool and this blog post is an example of this.  For myself, engineering is a solo pursuit -- I work from home and I'm not part of a team.  A blog post gives me a means to clarify my thinking formally and put forth an easy to create, rapid way to document my decisions.  Additionally it has the advantage of being **public**.  When things are public, it tends to force you to do a better job (the pressure of potential shame).  Another benefit to writing these things down is engineers tend to repeat themselves -- the next time I build this system (I suspect in about another month), I'll have the schema documented.  While today I'm reasoning it out from experience and first principles, that took me the better part 

This is for a table which is going to track the source url that represents the media in question.  If you've never written a table to represent crawling activities, you likely will find it overkill.  For myself, this is kind of the bare minimum and it represents all the knowledge I gained from Feedster, AppData and other crawling style projects.

I'm going to walk through each of the fields:

* t.timestamps -- the canonical created_at / updated_at -- when the record was created or updated; think of it as crawl_time
* :source_metadata_fetched_at -- this represents when my **AdHoc Metadata api** was applied to the url and captured whatever metadata it could fetch; if this is nil then it either didn't happen or couldn't happen.
* :date_created_at -- Just the date version of created_at; I like to build aggregate rollup views of what happened on a given day and this saves me a range query; more efficient
* :token -- this is going to be used to generate a permalink for the record that isn't an auto-incrementing id; this prevents exploits against your system
* t.references :source_page -- a foreign key relationship to the archived html source page (see Why All These Fields)
* :url -- the source url the user gives the system; let's say this is https://www.youtube.com/watch?v=IGNiH85PLVg
* :url_no_www -- the source url with the www and http / https stripped: youtube.com/watch?v=IGNiH85PLVg
* :url_domain -- The domain of the url so youtube.com
* :resolved -- a boolean which indicated whether or not the url was "resolved" to its actual destination; this helps deal with things like t.co url shorteners or OverCast which shares everything thru its own domain; defaults to false
* :resolved_url -- The url passed through an N pass resolver until it goes back to its domain
* :resolved_domain -- 
* :resolved_url -- 
* :permalink -- 
* :hostname -- 
* :fid -- 
* :title -- 
* :transcribed -- 
* :transcribed_url -- 
* t.references :user -- 
* t.references :pull_quote_type -- 
* :details -- 

## Why All these Fields?

When you build that works with the public internet, there are a few common concerns:

* Reporting and Monitoring -- seeing how systems are actually used is key.  These fields like us do things like group by url_domain or resolved_domain 
* Never throw information away -- one of the hardest lessons for me to learn was to NEVER throw information away.  Things like metadata extraction are inherently lossy operations -and- your code **will** have bugs.  The quality of everything I did with respect to crawling took a quantum leap upwards when I recognized that my need to potentially re-crawl and re-extract information was greater than the cost of storage.  Additionally as your understanding of what you are building increases, you will find that being able to re-process information is **.

abuse is always a factor

## Writing Crawlers and Scrapers in Ruby

If you find yourself needing to write crawlers and scrapers in Ruby, it might be helpful to know:

* I'm always available to talk on these kinds of projects; find me on Twitter as @fuzzygroup or find my email via the contact page above.
* I open sourced my core library for methods like url_no_www, url resolution and more https://github.com/fuzzygroup/url_common

## Acknowledgements

My understanding of this type of schema and the url_common library was formed with help from engineers I worked with including:

* Jared Haworth
* Dv Dasari
* Sean Kennedy
* Nick Gerakines

Thanks my friends.  Appreciated.
