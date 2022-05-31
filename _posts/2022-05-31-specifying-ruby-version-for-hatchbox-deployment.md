---
layout: post
title: Specifying Ruby Version for HatchBox Deployment
date: 2022-05-31 07:13 -0400
---
I recently had the situation where an application that I deployed to Hatchbox failed with a Ruby version conflict:

		-----> Installing gems...
		/home/deploy/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/bundler-1.17.3/lib/bundler/rubygems_integration.rb:200: warning: constant Gem::ConfigMap is deprecated
		Your Gemfile lists the gem capybara (>= 0) more than once.
		You should probably keep only one of them.
		Remove any duplicate entries and specify the gem only once (per group).
		While it's not a problem now, it could cause errors if you change the version of one of them later.
		Your Ruby version is 2.5.1, but your Gemfile specified 2.6.2

I dug into the (excellent) [online help for Hatchbox](https://hatchbox.gitbook.io/hatchbox/apps/ruby-versions#how-do-i-specify-my-apps-ruby-version) and found that you can specify your Ruby version with either the Gemfile or the .ruby-version file.  These files, however, serve different functions:

* Gemfile - tells your application what to use
* .ruby-version - tells RVM to switch the ruby version on change into the directory

In my case I had **both** and they were **different**.  Synchronizing them both to 2.6.2 fixed the issue entirely.