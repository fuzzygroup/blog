---
layout: post
title: Rails Refactoring Tip - When You Remove a Database Column and You Are Still Trying to Use It
category: rails
tags: ["rails", "refactor", "activerecord", "database"]
---
I have to admit, up front, that this is a hacky, schlocky recommendation but it is also **useful**.  As much as all of us would like to imagine that we refactor with grace, skill and perfection the reality is often far darker.  

I recently had a refactor involving the removal of database columns **fail** on me.  I attempted something quite ambitious and it just didn't work out.  And, worse, it involved removal of database columns from a production database so reverting to the older code is now quite an issue.  When I run it my master exception handler gives me output look this: 

    EXCEPTION===========================================================================
    undefined method `crawl_id=' for #<Form2016Q4:0x007fa52c346128>
    Did you mean?  crawl=
                   crawl
                   crawl_url=
                   crawl_url (PAGE) /Users/sjohnson/Dropbox/appdatallc/banks_before_refactor/banks/lib/common_page.rb 157 new_and_create_for_external_links
    ====================================================================================

What's happening here is that I've removed the crawl_id attribute from the form2016_q4s table. And the older code doesn't understand this.  At this point I'm still trying to get evaluate if the original problem I was trying to fix is fixed in the older code check out.  I don't want to make major changes in this check out since I'm still at that "should I stay or should I go now" part of the evaluation (i.e. toss out my refactor or try and pull in from the older check out).

Here's how I got around this, *attr_accessor*. [Good Blog Post](http://notes.jerzygangi.com/using-attr-accessor-in-rails-model-classes/) versus [Actual Docs](http://ruby-doc.org/core-2.0.0/Module.html#method-i-attr_accessor)

attr_accessor is one of those bits of Ruby magic that you don't use often when when you need it you really, really need it.  It generates reader and writer methods for an instance variable and it does so automagically behind the scenes.

Here's the only change that I needed to make at the top of my class:

    attr_accessor :crawl_id
    
Note 1: that I put it at the top of my class by style preference; it could have gone anywhere after class and before protected or private.  I also used attr_accessor instead of attr_writer I wanted support to enable reads in case I had any of those.

Note 2: If you're using a deleted column in an ActiveRecord where statement you're still going to have issues; those I had to fix by hand.