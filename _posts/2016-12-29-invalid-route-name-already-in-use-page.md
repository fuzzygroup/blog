---
layout: post
title: Invalid route name, already in use 'page'
category: rails
tags: ["rails", "pages", "authlogic", "bootstrap"]
---
It seems that whenever you start a new Rails project you hit some kind of wackiness with respect to an error message that you've never seen before.  Yesterday I started a new project and I wanted to use Bootstrap for my layout.  Well I couldn't make it work and then [Dv](http://dv.dasari.me) couldn't make it work so I finally turned to the [RailsApps](https://github.com/RailsApps/) project and used their [bootstrap template app](https://github.com/RailsApps/rails-bootstrap/blob/master/config/routes.rb).  And that worked so Huzzah! both for them and me.  Thanks Guys!

Note: Dv and I have both used bootstrap on I can't tell you how many different sites and its always a pain in the neck to initially get going.  We were using the bootstrap gem and we had the scss stuff configured correctly at least by comparing to a reference site.

Today I integrated [authlogic](https://github.com/binarylogic/authlogic) for authentication based on a [SitePoint AuthLogic tutorial](https://www.sitepoint.com/rails-authentication-with-authlogic/).  When I generated a Pages Controller and dropped a resources :pages into my routes file I got this:

    Invalid route name, already in use: 'page' 
    
My routes file right now is like 5 lines so I was actually certain that I didn't have pages in there already (embarrassingly though I did do a command+F anyway).  A bunch of googling turned up this [answer](https://github.com/thoughtbot/high_voltage/issues/109).  Apparently the [High Voltage gem](https://github.com/thoughtbot/high_voltage) from [Thoughtbot](https://github.com/thoughtbot) automagically inserts its pages route into the routes file.  And I get the desire for simplicity but when it doesn't even require a declaration in the Gemfile it makes tracking this kind of stuff down annoying.  Sigh.

Once that was removed then I was able to get my static pages working again so that's nice.  And I like what the High Voltage gem is actually doing.
