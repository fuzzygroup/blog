---
layout: post
title: Gem Review Fuzzyurl Or How Do You Know if a Gem is Ready for Production Use?
category: software_engineering
tags: ["ruby", "gem", "software_engineering", "gem_review"]
---
**Disclaimer 1**: Recently at ElixirConf I met Pete Gamache, the CTO of an Internet company and he showed me his Fuzzyurl Gem which is implemented in Ruby, JavaScript and Elixir.  Given my propensity for implementing crawlers / scrapers / content processors, I was immediately intrigued and it is a **quality** bit of software.  Unfortunately in assessing it for our production use, I found a bug.  I have reported it as an issue and I'm sure it will get addressed, and there is an easy work around, but finding this bug raises the question of "How do you know if a gem is ready for production use?"  So I wanted to write this NOT to slam Pete's work -- which, again, is excellent -- but to teach the point that you don't blindly assume that code on the Internet always works.

**Disclaimer 2**: Before I even could finish this post, Pete responded to the [Github Issue](https://github.com/gamache/fuzzyurl.rb/issues/2) I raised and it looks like he's going to fix it.  Thanks man!

**Disclaimer 3**: Having added a new engineer recently this post is written for him so he understands that before you grab a new gem and rely on it willy, nilly, you put some consideration into it.  I actually think he knows this already but the engineer we hire after him?  Well that's unknown so ...

So I recently found the ruby Gem [Fuzzyurl](https://github.com/gamache/fuzzyurl.rb/) by Pete Gamache and I am intrigued.  As part of my current work I am the mildly unhappy maintainer of massive class - roughly 5K lines dealing with nothing but url parsing and handling.  What you find, the moment you say "I'll write a crawler", is that most of the Internet is non RFC compliant and you're dealing with a witches brew of nastiness.  Standard tools like URI.parse, *snort*, well I might have some choice words for the author.  So when I found Pete's work, the fact that it was implemented in Ruby, JavaScript and Elixir was intriguing to say the least.  Perhaps I might not have to port my url code to Elixir -- that would be a huge win.  And since I'm pretty sure that Pete actually *designed* this as opposed to the organic "here a problem; there a routine" approach I used to write my library, I'm pretty close to certain that it has to be better than mine.  Mine might handle a ton of weird edge cases but it was never designed -- just implemented in a "[root, hog or die](https://en.wikipedia.org/wiki/Root_hog,_or_die)" fashion.

So let's return to the title of this blog post -- How Do You Know if a Gem is Ready for Production Use?  There are a bunch of ways:

* read the code
* read the tests
* try and use it
* try and use it exhaustively

The first thing to understand here is that this is a case where you absolutely need to *time bound* things.  Time bounding is the practice where you decide, before you start, how much time you should allocate to something.  We all know that tasks involving computers tend to expand to fill the time available.  In my case I decided that this task, assessing if we could use Fuzzyurl in production, was worth an hour.  And I do know that's light but it was what felt right.

In an hour I can't possibly read and understand parsing code.  I've written too much of it and I know how detailed it can get.  Reading the tests is another option and a better one.  Generally speaking if a gem is well tested, that bodes well for it being quality.  But I know how bad my input set of urls is.  I can guarantee that the random ass crap I have to encounter isn't covered by tests.  So I'm left with either try and use it or try and use it exhaustively.  

## Try and Use It

A quick addition to the end of Gemfile and then the bundle install dance lets me restart console and try it:

    fu = Fuzzyurl.from_string("http://www.foo.com/")
    {
        :protocol => "http",
        :username => nil,
        :password => nil,
        :hostname => "www.foo.com",
            :port => nil,
            :path => "/",
           :query => nil,
        :fragment => nil
    }
    
And that's perfect.  Here's a 1:1 comparison with URI.parse:

    2.3.1 :009 > fu = URI.parse("http://www.foo.com/")
    #<URI::HTTP http://www.foo.com/>
    2.3.1 :010 > fu.protocol
    NoMethodError: undefined method `protocol' for #<URI::HTTP http://www.foo.com/>
    	from (irb):10
    	from /Users/sjohnson/.rvm/gems/ruby-2.3.1@banks/gems/railties-4.2.7/lib/rails/commands/console.rb:110:in `start'
    	from /Users/sjohnson/.rvm/gems/ruby-2.3.1@banks/gems/railties-4.2.7/lib/rails/commands/console.rb:9:in `start'
    	from /Users/sjohnson/.rvm/gems/ruby-2.3.1@banks/gems/railties-4.2.7/lib/rails/commands/commands_tasks.rb:68:in `console'
    	from /Users/sjohnson/.rvm/gems/ruby-2.3.1@banks/gems/railties-4.2.7/lib/rails/commands/commands_tasks.rb:39:in `run_command!'
    	from /Users/sjohnson/.rvm/gems/ruby-2.3.1@banks/gems/railties-4.2.7/lib/rails/commands.rb:17:in `<top (required)>'
    	from bin/rails:4:in `require'
    	from bin/rails:4:in `<main>'
    2.3.1 :011 > fu.host
    "www.foo.com"
    2.3.1 :012 > fu.port
    80
    2.3.1 :013 > fu.scheme
    "http"
    2.3.1 :014 > fu.path
    "/"
    2.3.1 :017 > fu.query
    nil
    2.3.1 :018 > fu.fragment
    nil
    2.3.1 :019 >

The only change that I would make here is that I would add an alias method on *protocol* to *scheme* which is what URI.parse calls protocol (personally I think Pete is actually right here -- protocol is a better word -- but if you added scheme as an alias -- then you're closer to being a drop in replacement for URI.parse).  Maybe I'll submit a pull request perhaps.

So now I know that Fuzzyurl works but anyone can type out a url - what about a real test case.

## Try and Use it Exhaustively

One of the best and worst things about my job is that I'm never lacking for data.  We're currently crawling about 1/4 terabyte of data monthly so at any given point I have access to N million urls.  So why not just try to feed say 250,000 urls thru Fuzzyurl and see what happens.  This gives this simple rake task:

    task :verify_fuzzy_url => :environment do
      pages = Page.order("id asc").select("id, url, long_url_id").limit(250000)
      pages.each_with_index do |page, ctr|
        puts "#{ctr} :: #{page.id} :: #{page.url}"
        fu = Fuzzyurl.from_string(page.url.strip)
        puts "    #{fu.hostname}"
        raise "error: #{fu}" if fu.hostname.nil?
      end
    end

Since all of these urls are supposed to be absolute urls we should always have a hostname and we'll stop if we don't.  Now we'll need to examine the stop and make sure that the input wasn't bad.  When we run this thru we hit a failure like this:

    fu = Fuzzyurl.from_string(p.url)
    ArgumentError: Couldn't parse url string: http://www.theintelligencer.net
    from /var/www/apps/banks/shared/bundle/ruby/2.3.0/gems/fuzzyurl-0.9.0/lib/fuzzyurl/strings.rb:32:in from_string' from /var/www/apps/banks/shared/bundle/ruby/2.3.0/gems/fuzzyurl-0.9.0/lib/fuzzyurl.rb:169:infrom_string'

p in this case was a page which a url which looked like "http://www.theintelligencer.net ".  That trailing space there is the reason for the failure.  I submitted a github issue and the author has agreed to address it when he has the time.  That's a great response - even tho this isn't technically a bug - since space characters are allowed as part of urls but since it does cause a failure, I appreciated him being willing to fix it.

Now that I've used this a fair bit, a few of the errors I've seen with url processing comes back to my memory.  Here are a few common things you see in the wild that break URI.parse cold:

1. trailing spaces
2. embedded spaces
3. missing ? before the & fragment
4. Using a & instead of a ?  (#s 3 and 4 may actually be one and then same)
5. Bad encoding

Let's try a few of these:

### Embedded Space

    url = "http://fuzzygroup.github.io/blog/scott was here"
    "http://fuzzygroup.github.io/blog/scott was here"
    2.3.1 :021 > fu = Fuzzyurl.from_string(url)
    {
        :protocol => "http",
        :username => nil,
        :password => nil,
        :hostname => "fuzzygroup.github.io",
            :port => nil,
            :path => "/blog/scott was here",
           :query => nil,
        :fragment => nil
    }

### & Instead of ? Before the Fragment

    url = "http://fuzzygroup.github.io/blog/scott was here&foo=bar"
    "http://fuzzygroup.github.io/blog/scott was here&foo=bar"
    2.3.1 :023 > fu = Fuzzyurl.from_string(url)
    {
        :protocol => "http",
        :username => nil,
        :password => nil,
        :hostname => "fuzzygroup.github.io",
            :port => nil,
            :path => "/blog/scott was here&foo=bar",
           :query => nil,
        :fragment => nil
    }
    
## Conclusions

Overall Fuzzyurl is just plain a fantastic bit of code.  It handles most of the common cases that break URI.parse.  Here are a few suggestions:

* Add an alias method called parse for from_string  That lets Fuzzyurl be used as a drop in replacement for URI.parse
* Add support for a call back function so you could register your own pre-processor to clean up a url before it gets parsed.  When implementing this type of library I understand the desire to follow the standards and only modify them slightly for common edge cases.  But there are so many ways to craft a crappy url in this Internet of ours that if you simply allow for a pre-processor routine then you can always say "there's an api for extending this, use it."