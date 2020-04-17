---
layout: post
title: Rails Asset Pipeline Failures and Capistrano
category: rails
tags: ["rails", "deploy", "capistrano"]
---
One of the single worst parts of being a one man show on an engineering effort is that when you hit a serious snag, well, you're *fscked*.  I'm at the death march phase of a project, that wonderful stage, where you're so far into it that you can see the end but it seemingly never arrives -- like the speed of light, it feels like you can never quite get there.  

Pro Tip: At this stage being asked by your manager, on a continuous basis, "anything that you can show me" is not helpful.  It is actually an antipattern which simply slows the project by making the engineer feel even worse (yes I'm late and I can argue for scope creep, etc but I'll own it and I'm still late).

Anyway I recently went through this with respect to getting a complex Rails code base deployed onto AWS.  I started with my usual deploy tool of HatchBox but nothing worked and it was in the wee hours, and over a weekend, when I had no right to expect timely technical support so I figured "Ok I'll do a raw deploy with Capistrano" -- and then the cluster fsck began in earnest.  

One of the general rules of technology is that everything is a two edged sword and where you get something, you give something.  For example C gives outstanding performance and flexibility but it also can be a source of security issues, pointer bugs, buffer overflows, etc.  Similarly Rails, even today, gives you: 

* an unprecedentedly easy way to build web apps (provided you do it the Rails way)
* but deployment of modern Rails apps can be one of the most cursing laden experiences I've ever had

The only easy way I've ever found to deploy Rails apps is HatchBox and HatchBox wasn't actually a good fit for this application due to particularly complex, multi language CI / CD requirements (4 different git repos spanning, today, two languages).  The real deployment approach is going to be a combination of Jenkins + Ansible that drive Capistrano plus some other deployment tools.

But I digress and have now devolved into a large number of words, more words than I should.  And so ...

## Error Conditions from a Capistrano Deploy that Claimed to Go Correctly but Didn't

Here's what I noticed:

* Everything in the application appeared GIANT on screen (this is a characteristic in modern web apps of a CSS failure)
* Normally I'd assume an asset pipeline failure but I watched the asset pipeline build perfectly time after time
* Capistrano ran correctly
* When I followed a link to the CSS, I got a 500 error trying to access it.  Here is what the error said: "500 Internal Server Error If you are the administrator of this website, then please read this web application's log file and/or the web server's log file to find out what went wrong."
* Nothing in the production.log file -- I mean nothing!  Over a decade plus in Rails and I've never seen the log files silent.
* Nothing in the underlying NGINX error log / server log

When I described this to a personal colleague their reaction was:

> Holy hell, production-specific bug and no logs? That sounds like some inner circle of hell

Now my manager has been asking me on our daily stand ups for the last several days "Any blockers?" and my answer has been "No" and, honestly, that's true:

* There is not one person on the team with the requisite technical knowledge to assist in this
* The effort of explaining this was not to my liking
* I have over a decade of Rails experience and my failure to get a simple Capistrano deploy functioning was beyond humiliating.

And so I did what I normally do with this type of problem; I put it aside and worked on other parts of the project as there was plenty of other work to accomplish.  Periodically I would come back to it and nibble away at different aspects of it.  So from one perspective I was entirely blocked on this and from another, it was just one more partially completed task.  And then today, working from a parking lot for a change of pace (yay COVID-19), I finally hit upon the solution:

> The last stage in a deploy via Capistrano has to be to restart the underlying NGINX (I'm using Passenger) web server

Normally the Capistrano gem does this if you have the Capistrano/Passenger extension loaded.  My guess is that this is weirdness related to Rails 6 although maybe I have a configuration issues (Capistrano is complex enough that I will freely admit that I may have made an error).

## Restarting Passenger via Capistrano

Passenger, the web server level Ruby extension that drives a Rails site, looks for the file restart.txt in the tmp directory underneath your web root.  I could have tried to figure out whether or not Capistrano was perhaps putting it in the wrong place but the easier approach was to simply extend Capistrano itself using a post deploy hook.

```ruby
# put this line in config/deploy/production.rb

after 'deploy:publishing', 'deploy:restart_passenger'
```

```ruby
# put this file in lib/capistrano/tasks/restart_passenger.rake

namespace :deploy do
  task :restart_passenger do
    on roles(:web), in: :sequence, wait: 10 do
      # VERSION 1 -- The way you want to write this:
      #upload! File.join(Rails.root, '/bin/restart.text'), "/home/ubuntu/ohi/current/tmp/restart.txt"
      
      # VERSION 2 -- The way that you have to write this:
      upload! '/Users/sjohnson/Sync/fuzzygroup/adl/ohi_kafka/ohi/bin/restart.txt', "/home/ubuntu/ohi/current/tmp/restart.txt"
      
      # VERSION 3 -- The way you debug this when figuring this out
      # `scp -i ~/Downloads/adl_fuzzygroup2.pem /Users/sjohnson/Sync/fuzzygroup/adl/ohi_kafka/ohi/bin/restart.txt ubuntu@3.134.253.53:/home/ubuntu/ohi/current/tmp/restart.txt`
    end
  end
end
```

You'll notice that there are **three** different versions of this.  One of the issues with Capistrano extensions is that they run OUTSIDE of Rails itself so the normal magic that is Rails.root **does not** exist.  And, yes, there are ways to construct the correct path but I simply didn't have the time so I ticketed the issue in Jira and moved on.  On a historical note, I remember encountering this back in August of 2018 so there's that ...

## The Moral of the Story 

Here's the moral of the story:

* Your asset pipeline can build perfectly but NOT actually be usable
* Make absolutely certain that your web server restarts AFTER the asset pipeline builds

## See Also

* [Capistrano](https://github.com/capistrano/)
* [Capistrano Passenger](https://github.com/capistrano/passenger)
* [Stack Overflow](https://stackoverflow.com/questions/11269935/rails-500-error-application-css-isnt-precompiled)