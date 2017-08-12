---
layout: post
title: When Font Awesome Won't Render in Production on Rails 5.x
category: rails
tags: ["rails", "font_awesome", "asset_pipeline"]
description: Font Awesome is, well, awesome but when the Rails asset pipeline gets involved you can run into things working correctly in production but failing in development.
image: https://fuzzyblog.io/blog/assets/font_awesome_working.png
---
[Font Awesome](http://fontawesome.io/) is one of those staggeringly good open source projects that you don't realize just how good it is until you use it -- and then it goes away.  The degree of *polish* and *finish* that an easy to use, inline icon adds to a project honestly just astounds me.  That's why, when I moved some code to production recently, and Font Awesome failed to render, well, I was **beyond frustrated**.

My current production platform is Rails 5.x and this is how I got past that particular hellish little bit of the Rails asset pipeline.  The context is that I've been developing with Font Awesome for over 8 months now and I even spent the $$$ to back their [KickStarter](https://www.kickstarter.com/projects/232193852/font-awesome-5/comments) since Font Awesome is just that, well, **awesome** and I've been viewing their icons daily for 8 months -- until I deployed at which point they vanished.  

On digging into this problem, I found a lot of discussion and suggestions in the [normal ](https://stackoverflow.com/questions/17904949/rails-app-not-serving-assets-in-production-environment) [places](https://github.com/FortAwesome/Font-Awesome/issues/5559) but I never found this solution.

1. Diagnose the problem by looking at the Chrome JavaScript console and seeing if you get a 404 error related to missing font files such as *fontawesome-webfont.woff2*.  That's the issue that this solution tackles.
2. Use the font-awesome-rails gem in Gemfile: **gem "font-awesome-rails"**.
3. In your application.css.scss file you should have an import directive at or near the top like @import "font-awesome";
4. In config/environments/production.rb, you need a series of asset compilation directives like these: 

    # Do not fallback to assets pipeline if a precompiled asset is missed.
    config.assets.compile = false
    # font_awesome additions
    config.serve_static_assets = true
    config.assets.compress = true
    config.assets.compile = true
    config.assets.digest = true

# Before and After

Here's the obligatory before and after screenshots:

![font_awesome_broken.png](/blog/assets/font_awesome_broken.png)    

![font_awesome_broken.png](/blog/assets/font_awesome_working.png)    

The working screenshot has slightly different data in it since this was written over a series of days while this issue was researched.

# Honest Disclaimer

I've now been using Rails since 2007 and Ruby since 2006 (and HTML since 93) which means that I so thoroughly precede the asset pipeline that it honestly makes me laugh.  In all honesty, I really don't understand the asset pipeline particularly well so if this advice is technically wrong, I **apologize**.  What I can tell you is that this advice took a Rails 5 system where Font Awesome worked in development but failed in production and made it work in production -- but when you don't understand the low level details, well, it makes you *uncomfortable*.
