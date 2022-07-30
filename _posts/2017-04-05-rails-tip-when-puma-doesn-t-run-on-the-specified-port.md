---
layout: post
title: Rails Tip - When Puma Doesn't Run on the Specified Port
category: rails
tags: ["rails", "puma"]
description: When you find your Puma Rails server not running on the port you specify, try updating it your Puma gem.
---
{% pizzaforukraine  %}

So I just noticed this particular oddness:

    12:12 $ bundle exec rails s -p4000
    => Booting Puma
    => Rails 5.0.1 application starting in development on http://localhost:4000
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.7.0 (ruby 2.3.1-p112), codename: Snowy Sagebrush
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://0.0.0.0:3000

As you can see Puma is being started with a port 4000 directive but it is actually listening on the default 3000 port.  

A bit of googling led me to this bit of text in a [Github issue](https://github.com/puma/puma/issues/1200):

> After updating the gem version and bundling: gem 'puma', '~> 3.6.2' [More...](https://github.com/puma/puma/issues/1200#issuecomment-278606118)

I edited my Gemfile and replaced:

> gem 'puma', '~> 3.0'

with:

> gem 'puma', '~> 3.6.2'

A quick bundle install and then another rails s -p4000 gives:

    bundle exec rails s -p4000
    => Booting Puma
    => Rails 5.0.1 application starting in development on http://localhost:4000
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.6.2 (ruby 2.3.1-p112), codename: Sleepy Sunday Serenity
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:4000

As with all http testing, a curl -I is always handy for figuring out if things are working:

    curl -I http://localhost:4000/
    HTTP/1.1 200 OK
    X-Frame-Options: SAMEORIGIN
    X-XSS-Protection: 1; mode=block
    X-Content-Type-Options: nosniff
    Content-Type: text/html; charset=utf-8
    ETag: W/"c06ad854cb732d5ed93f13e0e4a601ac"
    Cache-Control: max-age=0, private, must-revalidate
    X-Request-Id: 85a07f99-f8b3-4692-aaa5-4f7c8327d901
    X-Runtime: 0.032369