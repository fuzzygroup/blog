---
layout: post
title: Vacation Insomnia and the Hotel Business Office
tags: ["vacation", "remote_work"]
category: remote_work
---
As a remote worker I've found that you tend to work more, there are fewer distractions, there are no co-workers to go out with, etc, so you just work more.  And when you always have a laptop with you then even vacation tends to flow into work.  One of the oddest things about being a remote worker is that you end up with recollections of work that are entirely cognitively dissonant with work itself.  

Here are a few examples:

* When I first wrote the iOS version of AppData after fighting an internal battle **hard** that iOS mattered (this was back in 2010 or 2011) I remember staying at a cheap Dallas hotel with bad wifi on vacation with my family when I first wrote that crawler
* I can't tell even begin you how much code I wrote from Great Wolf Lodge on different family trips.  I suspect I've not only written code there but entire products there.
* The last time I was in Disney world I wrote an anti-spam algorithm to evaluate your Twitter followers for their *spamminess* related to your content.  I guess that wasn't for work tho -- more for late night boredom.

So I'm once again on a short vacation and I find myself in the hotel business office working in wonderful, blessed quiet and darkness.  This time I'm in the hotel's business office and it is *absolutely lovely*.  After a night's drive on the way to our destination and a late checkin I found myself up at the crack of 1 am.  And with three other people in the hotel room, what do you do?  Well, if you're me, you shower, shave, grab your gear and find a place with wifi.  

And this time around I'm rewriting the core crawl / recursive_crawl routines for our main HTML crawler.  This is a core loop which is the innermost guts of our crawler and it is ugly beyond belief.  I can say that because I'm one of its two core authors.  This is a routine which takes like 8 parameters and returns 7 (or the other way around; even I can't tell).  So I'm in the middle of a massive refactor where it takes in one struct and returns another.  And I know it will be better but right now I suspect it resembles a butcher shop when a flood of carcasses has just arrived -- there's blood everywhere and bits of bone and gristle from the big band saws that a real butcher shop would actually use.  Even if you're a self confessed carnivore like myself, you likely wouldn't want to see it and that's how I feel right now.  I want this refactor done desperately but, man, even I don't want to do this work.

I've now gotten it to this stage:

    crawl_struct = UrlTool.get_mechanize_links_on_a_page_from_struct(OpenStruct.new(:site => site))
    
which returns this:
    
    OpenStruct {
               :num_pages => 1,
         :already_crawled => [
            [0] "14b461cc3eecf248213c23999ca33236363d083f"
        ],
        :page_body_hashes => [],
                   :links => [],
          :mechanize_page => nil,
          :resolved_links => []
    }
    
which means that I've made a crawler which, now, does not crawl.  **Groan**.  I wish I'd stayed in bed.  Happily that likely means that I've missed something basic like a conditional since at least my basic return structure is better.  And, while writing this, I just found it -- I had omitted a conditional. 

Now I suspect that a number of my readers are saying something along the lines of "Dude -- **it is vacation**; STOP CODING!" and I will.  And you are right but there are some mitigating factors

* this is time sensitive work that needs to get done before year end 
* I suffer from an over developed sense of personal responsibility on all fronts
* everyone else is sleeping which means no reading, no media to consume
* workaholic

The strongest mitigating factor here tho is that I've found that when I'm forced to leave my home office it often **spurs creativity** fairly dramatically.  Just as an example we normally compare crawl results to past crawls only on 2 dimensions, pages and links because the attributes for those versus past crawls are easily accessible.  What I just realized tho is that I can implement a simple JSON api and compare my new crawl against any of the dimensions by which we crawl - forms, iframes, etc.  And, in the process of writing this post, I actually implemented that JSON api.