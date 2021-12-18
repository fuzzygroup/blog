---
layout: post
title: Rails 6 - Can't Find Application.js
date: 2021-12-18 09:51 -0500
category: rails
tags: ["rails"]
---
So I started fiddling about with a new Rails project and after finding a likely starting point, I immediately ended up with this:

    Webpacker can't find application.js in

I'm old school Rails and I find the whole asset compilation situation, honestly, perplexing.  The solution turned out to be:

    bundle exec rails webpacker:install
    
after the normal:

    git clone foo
    bundle install
    bundle exec rake db:migrate
    
I have no idea why the bundler install doesn't handle executing webpacker:install but cie la vie.  The more things change, the more they stay the same ...

