---
layout: post
title: Notes on Upgrading to Rails 5.1
category: rails
tags: ["rails", "ruby", "puma", "apartment"]
description: With Rails 5.1.4 on the horizon, it is time to upgrade to Rails 5.1.  Here I discuss the issues that I found with upgrading a suite of 7 Rails apps from Rails 5.0.2 to Rails 5.1.
---
So this morning I upgraded the suite of Rails apps (7 in total) that make up the product that I've been building from Rails 5.0.2 to 5.1.3.  I took my usual, slow as a turtle, approach to doing this upgrade (5.1.4 has now reached RC1 status which means that 1 release behind is uite stable by now).  The main change driving my desire to upgrade was the improved low level connection handling in ActiveRecord which should make developing multi-tenant applications better.

Here are a few notes on upgrading to Rails 5.1.

# The Lines to Change in Gemfile

Previously I had:

    gem 'rails', '~> 5.0.2'
    gem 'puma', '~> 3.0'

which I changed to

    gem 'rails', '~> 5.1.3'
    gem 'puma', '~> 3.10'

The reason for the Puma update turned out to be unneeded but it is a core part of my stack so it is likely good to upgrade.

# Useful Links

* [Rails 5.1 Readme](http://edgeguides.rubyonrails.org/5_1_release_notes.html)
* [Ruby Gems on Puma](https://rubygems.org/gems/puma/versions/3.4.0)
* [Ruby Gems on Rails](https://rubygems.org/gems/rails/versions/5.0.0)

# Don't Be Afraid to Delete Gemfile.lock and Re Bundle

Out of my seven apps, all built on top of the same version of Rails, two had problems with:

> bundle update rails puma

These two applications had issues with the font-awesome-rails gem and railties.  Rather than try and monkey around with them, I simply did a: 

> git rm Gemfile.lock

and then a:

> bundle install

And that fixed everything.

# Puma Now Needs a Space Before the Port

Right after my Rails update and before I did the Puma update, I got this bit of joy when I started my server:

    bundle exec rails s -p3203
    => Booting Puma
    => Rails 5.1.3 application starting in development on http://localhost:3203
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.10.0 (ruby 2.3.1-p112), codename: Russell's Teapot
    * Min threads: 2, max threads: 2
    * Environment: development
    * Listening on tcp://
    Exiting
    /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/binder.rb:270:in `initialize': getaddrinfo: nodename nor servname provided, or not known (SocketError)
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/binder.rb:270:in `new'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/binder.rb:270:in `add_tcp_listener'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/binder.rb:105:in `block in parse'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/binder.rb:88:in `each'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/binder.rb:88:in `parse'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/runner.rb:144:in `load_and_bind'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/single.rb:87:in `run'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/puma/launcher.rb:183:in `run'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/puma-3.10.0/lib/rack/handler/puma.rb:69:in `run'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/rack-2.0.3/lib/rack/server.rb:297:in `start'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/railties-5.1.3/lib/rails/commands/server/server_command.rb:44:in `start'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/railties-5.1.3/lib/rails/commands/server/server_command.rb:131:in `block in perform'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/railties-5.1.3/lib/rails/commands/server/server_command.rb:126:in `tap'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/railties-5.1.3/lib/rails/commands/server/server_command.rb:126:in `perform'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/thor-0.20.0/lib/thor/command.rb:27:in `run'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/thor-0.20.0/lib/thor/invocation.rb:126:in `invoke_command'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/thor-0.20.0/lib/thor.rb:387:in `dispatch'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/railties-5.1.3/lib/rails/command/base.rb:63:in `perform'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/railties-5.1.3/lib/rails/command.rb:44:in `invoke'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_admin/gems/railties-5.1.3/lib/rails/commands.rb:16:in `<top (required)>'
            from /Users/sjohnson/Dropbox/fuzzygroup/hyde/seira_watch/seira_admin/bin/rails:9:in `require'

This turned out to be a change somewhere in Rails where a space is now needed between the -p and the port number, so this:

> bundle exec rails s -p3203

needs to be:

> bundle exec rails s -p 3203

This was covered in this [Github Issue](https://github.com/rails/rails/issues/28971). Supposedly the latest version of Puma restores the previous functionality where a space isn't needed but I have **NOT** found that to be so.  The solution was to simply accept that a space after -p is required.  Technically I could have not upgraded Puma but it feels like running the current version of is always a good thing.

# Middleware Now Needs a Class Constant Not a String

What I am building uses a multi-tenant approach based on the [Apartment gem](https://github.com/influitive/apartment) and this requires an initializer that specifies a middleware layer.  Prior to Rails 5.1, this was done as follows:

    Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'
    (in config/initializers/apartment.rb)
    
When I first started my application using Rails 5.1, I got this unpleasant result:

     bundle exec rails s -p 3210
    => Booting Puma
    => Rails 5.1.3 application starting in development on http://localhost:3210
    => Run `rails server -h` for more startup options
    Exiting
    /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/actionpack-5.1.3/lib/action_dispatch/middleware/stack.rb:35:in `build': undefined method `new' for "Apartment::Elevators::Subdomain":String (NoMethodError)
    Did you mean?  next
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/actionpack-5.1.3/lib/action_dispatch/middleware/stack.rb:99:in `block in build'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/actionpack-5.1.3/lib/action_dispatch/middleware/stack.rb:99:in `each'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/actionpack-5.1.3/lib/action_dispatch/middleware/stack.rb:99:in `inject'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/actionpack-5.1.3/lib/action_dispatch/middleware/stack.rb:99:in `build'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/railties-5.1.3/lib/rails/engine.rb:508:in `block in app'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/railties-5.1.3/lib/rails/engine.rb:504:in `synchronize'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/railties-5.1.3/lib/rails/engine.rb:504:in `app'
            from /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch/gems/railties-5.1.3/lib/rails/application/finisher.rb:45:in `block in <module
    
Apparently middleware layers that used to take a string now need a class constant so this needs to be rewritten as:

    Rails.application.config.middleware.use Apartment::Elevators::Subdomain

This is discussed in this [Rails Issue](https://github.com/rails/rails/issues/28946)

# skip_before_filter Is Now skip_before_action 

Although I was able to start my application correctly in development mode with a still in place skip_before_filter, when I tried it in production, I got:

    => Run `rails server -h` for more startup options
    Exiting
    /Users/sjohnson/Dropbox/fuzzygroup/hyde/seira_watch/seira_watch_web_app/app/controllers/api_controller.rb:3:in   `<class:ApiController>': undefined method `skip_before_filter' for ApiController:Class (NoMethodError)
    Did you mean?  skip_before_action

This was an easy change but it is still something that could easily trip you up.  Obviously I have been seeing the deprecation warnings for some time now and it is my bad for not having made these changes.

# Conclusions

While mildly annoying these are relatively small issues htat I was able to work around quite cleanly.  The total time to upgrade 7 Rails apps from 5.0.2 to 5.1 was less than an hour in total even including the research and deploy time.  **Recommended**.

# Public Service Announcement

If you haven't upgraded your Ruby Gems executable, you likely should.  [More details are here](https://www.ruby-lang.org/en/news/2017/08/29/multiple-vulnerabilities-in-rubygems/).