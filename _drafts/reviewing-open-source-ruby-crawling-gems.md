---
layout: post
title: Reviewing Open Source Ruby Crawling Gems
---
I recently needed to build a crawler based page archiver that I could aim at a site and archive all pages on the site on a daily basis.  Historically I would have written this from scratch but I recently left my full time position and lost access to the recursive descent html crawler that I had painstakingly written over a period of years.  So it was either write it from scratch or build on top of something else.  Crawlers are one of those things that you can write easily at the start but then discover that getting them write is actually the work of years so I figured "time to look for some open source".  This blog post is a write up on what I learned about open source crawling gems / projects in Ruby.

I used a number of criteria to winnow down the set of possibilities including:

* dependencies
* # of issues
* # of commits
* # of contributors
* last commit 
* scalability approach: threads / queue / single machine

My logic here is that while code is good, maintained code is **better**.  Things like the # of issues, # of commits and last commit indicate that a project should be alive and being worked on.  This isn't entirely true.  There are some excellent crawling projects which have 0 issues (I was actually the first issue creator on at least one) but its a place to start.

The last one, scalability approach, is important.  I know that the site I need to crawl has 118,000 urls according to Google.  This means that unless I have either **consistent** subsecond per page speed or a decent approach to scalability, a single process approach just won't work.  There are 86,400 seconds per day so I need a per page crawl time of at least 0.75 seconds per page to meet that 118,000 goal with some wiggle room.  Additionally Ruby is a garbage collected, dynamic language so things tend to get slower over time as the crawl process either loses memory due to underling technical problems (either at their own code or at the components that it uses) or slows down due to garbage collection.

I started with github search for the terms: **ruby crawl**.  I didn't use the term gem because some crawling projects implemented in Ruby:

https://github.com/search?o=desc&q=ruby+crawl&s=stars&type=Repositories&utf8=%E2%9C%93

I then continued with the terms: **ruby crawl gem** because there were tools I didn't see on my first search that I remembered from having done this research previously (when I failed to document it).

https://github.com/search?p=2&q=ruby+crawl+gem&type=Repositories&utf8=%E2%9C%93

I ended up with this ridiculous set of browser tabs spanning two separate chrome windows:

![search_tabs_not_so_bad.png](/blog/assets/search_tabs_not_so_bad.png)
![search_tabs_utterly_ridiculous.png](/blog/assets/search_tabs_utterly_ridiculous.png)

On a side note, I don't understand why the state of researching something on the Internet, 20+ years after the browser launched, is still such a damn disaster but that's an entirely different rant.

This url was also useful in discovering crawlers: http://www.rubygemsearch.com/ruby-gems/search?q=web+crawling

My final search url was Ruby gems: 

https://rubygems.org/search?query=crawl&utf8=%E2%9C%93

# Sidebar: Why Ruby?

Given the issues noted above about Ruby and my particular performance metrics, you may be wondering "why ruby?".  Well I've spent the last decade plus in the Ruby world and I know ruby best among all the languages in my toolchest.  I'm 100% certain that no matter what codebase I find, I'm going to need to make changes -- that's the nature of any type of crawling project so better to do that in a language that, for all its warts and flaws, I know.

# Gems / Codebases Found

Here is a quick enumeration of the codebases / gems that I found.  What I'm going to do is give a list of everything and then cherry pick the promising ones and dig deeper into them.

* [Band Camp Crawler](https://github.com/lxxxvi/bc_crawler)
  * dependencies: 
  * # of issues: 0
  * # of commits: 5
  * # of contributors: 1
  * last commit: 2 years ago
  * scalability approach: single machine
* [Ruby Web Crawler](https://github.com/andreikoenig/ruby_web_crawler/blob/master/crawl_script.rb)
  * dependencies: anemone
  * # of issues: 0
  * # of commits: 1
  * # of contributors: 1
  * last commit: 2 years ago
  * scalability approach: none / anemone
* [Spider Crawl](https://github.com/belsonheng/spidercrawl)
  * dependencies: 
  * # of issues: 
  * # of commits: 
  * # of contributors: 
  * last commit: 
  * scalability approach: single machine
* [Cloud Crawler](https://github.com/CalculatedContent/cloud-crawler)
  * dependencies: Unclear / aws
  * # of issues: 15
  * # of commits: 170
  * # of contributors: 2
  * last commit: 3 years ago
  * scalability approach: redis
* [CosmiCrawler](https://github.com/bash0C7/cosmicrawler)
  * dependencies: EventMachine
  * # of issues: 0
  * # of commits: 8
  * # of contributors: 2
  * last commit: 4 years ago
  * scalability approach: EventMachine 
* [Kabutops](https://github.com/reneklacan/kabutops)
  * dependencies: Unclear
  * # of issues: 0
  * # of commits: 94
  * # of contributors: 1
  * last commit: 1 year ago
  * scalability approach: sidekiq
  * other: support for javascript agent, support for debugging (brilliant)
* [Crawler](https://github.com/kdurski/crawler)
  * dependencies: unclear
  * # of issues: 0
  * # of commits: 5
  * # of pull requests: 0
  * # of contributors: 1
  * last commit: 2 years ago
  * scalability approach: threads
* [Anemone](https://github.com/chriskite/anemone)
  * dependencies: mongo
  * # of issues: 0
  * # of commits: 197
  * # of pull requests: 22
  * # of contributors: 12
  * last commit: 5 years ago
  * scalability approach: threads
* [Link Checker](https://github.com/endymion/link-checker)
  * dependencies: unclear
  * # of issues: 15
  * # of commits: 105
  * # of pull requests: 6
  * # of contributors: 2
  * last commit: 4 years ago
  * scalability approach: threads 
* [Email Spider](https://github.com/endymion/email_spider)
  * dependencies: anemone
  * # of issues: 1
  * # of commits: 11
  * # of pull requests: 0  
  * # of contributors: 1
  * last commit: 5 years ago
  * scalability approach: anemone
* [crawler_r](https://github.com/versioneye/crawl_r)
  * dependencies: docker, mongo
  * # of issues: 3
  * # of commits: 665
  * # of pull requests: 3
  * # of contributors: 2
  * last commit: 1 month
  * scalability approach: unclear
  * app or gem: app
* [Cobweb](https://github.com/stewartmckee/cobweb)
  * dependencies: unclear
  * # of issues: 9
  * # of commits: 481
  * # of pull requests: 2
  * # of contributors: 13
  * last commit: 2 months ago
  * scalability approach: resque / sidekiq
  * app or gem: gem
* [Spidey](https://github.com/joeyAghion/spidey)
  * dependencies: 
  * # of issues: 2 
  * # of commits: 27
  * # of pull requests: 0  
  * # of contributors: 3
  * last commit: 1 year ago
  * scalability approach: none
  * app or gem: app  
* [Wayfarer](https://github.com/bauerd/wayfarer/)
  * dependencies: unclear
  * # of issues: 2 (I created both)
  * # of commits: 1,135
  * # of pull requests: 0  
  * # of contributors: 1
  * last commit: 3 days ago
  * scalability approach: ActiveJob / Threads
  * app or gem: gem  
* [Alpha Insights Crawl](https://github.com/alphasights/crawl)
  * dependencies: Event Machine
  * # of issues: 0
  * # of commits: 68
  * # of pull requests: 1
  * # of contributors: 6
  * last commit: 4 months ago
  * scalability approach: threads
  * app or gem: app  
  * callback structure / extensibility approach: none
* [Daimon Skycrawlers](https://github.com/bm-sms/daimon_skycrawlers)
  * dependencies: Docker
  * # of issues: 0
  * # of commits: 665
  * # of pull requests: 0  
  * # of contributors: 10
  * last commit: 2 months
  * scalability approach: RabbitMQ
  * app or gem: framework  
  * callback structure / extensibility approach: 
* [Wombat](https://github.com/felipecsl/wombat/)
  * dependencies: Unclear
  * # of issues: 11
  * # of commits: 242
  * # of pull requests: 3
  * # of contributors: 16
  * last commit: 5 months
  * scalability approach: Single machine 
  * app or gem: gem
  * callback structure / extensibility approach: pass in code block
* [SuperCrawler](https://github.com/htaidirt/super_crawler)
  * dependencies: Unclear
  * # of issues: 0
  * # of commits: 15
  * # of pull requests: 0  
  * # of contributors: 1
  * last commit: 9 months
  * scalability approach: threads 
  * app or gem: gem / app
  * callback structure / extensibility approach: unclear
* [Gru Crawler](https://github.com/slava-vishnyakov/grucrawler)
  * dependencies: typhoeus
  * # of issues: 0
  * # of commits: 18
  * # of pull requests: 0
  * # of contributors: 1
  * last commit: 2 years
  * scalability approach: thread
  * app or gem: gem
  * callback structure / extensibility approach: callback
* [News Crawler](https://github.com/haqduong/news_crawler)
  * dependencies: typhoeus / celluloid
  * # of issues: 1
  * # of commits: 62
  * # of pull requests: 0  
  * # of contributors: 1
  * last commit: 4 years
  * scalability approach: celluloid
  * app or gem: gem  
  * callback structure / extensibility approach: unclear
* []()
  * dependencies: 
  * # of issues: 
  * # of commits: 
  * # of pull requests: 0  
  * # of contributors: 
  * last commit: 
  * scalability approach: 
  * app or gem: app  
  * callback structure / extensibility approach: 
* []()
  * dependencies: 
  * # of issues: 
  * # of commits: 
  * # of pull requests: 0  
  * # of contributors: 
  * last commit: 
  * scalability approach: 
  * app or gem: app  
  * callback structure / extensibility approach: 
* []()
  * dependencies: 
  * # of issues: 
  * # of commits: 
  * # of pull requests: 0  
  * # of contributors: 
  * last commit: 
  * scalability approach: 
  * app or gem: app  
  * callback structure / extensibility approach: 
* []()
  * dependencies: 
  * # of issues: 
  * # of commits: 
  * # of pull requests: 0  
  * # of contributors: 
  * last commit: 
  * scalability approach: 
  * app or gem: app  
  * callback structure / extensibility approach: 
  
# Commentary

With this exhaustive a look at different crawlers, you're probably wondering why I didn't toss a lot of the candidates early on.  Well I've written a lot of crawlers over the years and this is a field where you can always learn from something.  A big part of why I looked at even some of the less promising candidates was that I wanted to learn from them.

# Crawlers Reviewed

In no particular order, here are reviews of each of the crawlers.  Most of these, at least those I could make work, I attempted to actually using and build a simple page archiver with them.  This gave me a generic use case so that there was a similar evaluation for each.

## Spidr

This was the first one I tried and probably the easiest to work with.  I had a sample crawler up and running with Spidr in probably less than 15 minutes which is stellar.  The one real problem is performance.  After about 300 pages were processed I started to see a 1.3 to 1.5 second per page response time.

## Anemone 

Anemone is an old school ruby project -- I remember evaluating it back in 2014 the last time I  took a stab at this research.  And while I really wanted to look at it, the answers on this [Stack Overflow](http://stackoverflow.com/questions/18367170/getting-all-urls-using-anemone-gem-very-large-site) convinced me to take a pass.

## Cobweb

I really, really like Cobweb.  Sometimes you hit a codebase which just has a good feel and Cobweb is one of those.  It was very simple to integrate, quite fast and 

    statistics = CobwebCrawler.new(:cache => 600, :thread_count => 10, :valid_mime_types => ["text/html"]).crawl("http://www.udemy.com") do |page|
      puts "Just crawled #{page[:url]} and got a status of #{page[:status_code]}."
      if page[:mime_type] == "text/html"
        page_ctr = page_ctr + 1
        #puts page.title
        #debugger
        page_archive = PageArchive.find_or_create(page[:body], page[:url])
        total_time = (Time.now - start_time) 
        puts "  Total time: #{total_time}"
        puts "  Total pages: #{page_ctr}"
        puts "  Time per page: #{total_time.to_f / page_ctr}"
      else
        puts "  Not text/html for: #{page[:url]}"
      end
      
    end

# Wayfarer

## AlphaSights Crawler

This was actually pretty interesting.  Its a threaded crawler written in ruby and actually appears to be fairly fast.  It has zero callbacks / extension facilities as best I can tell but the underlying engine appears clean and determining the integration points where I'd need to insert my own code was pretty easy.

## Daimon Sky Framework

This crawler was extremely promising and very, very disappointing.  Here were the issues:

* The crawler assumes that you have a Postgres installation by default so you can't even bundle install without it.  So I had to fork it and then change that to MySQL just to install it.
* This is a very rails like framework where you install the gem and then the gem generates an application which is Rails-esque.  Its actually pretty brilliant and even generates docker containers for all the dependencies which is **sweet**
* The only real problem is simple -- I couldn't make it actually crawl.  All that happened was that it would start, process the home page and fail to populate the body and then stop.

There is definitely goodness here but when something fails at the very basic use case, it is hard to justify pushing farther.
