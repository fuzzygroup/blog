---
layout: post
title: How to Turn Off Rails 5 Default Foreign Key Migrations
category: rails
tags: ["rails", "mysql", "migration", "foreign key"]
---
I could swear that I've written this down before but I can't find it now and, as usual, I blog as much for myself as I do for anyone else.  When Rails 5 came out it made foreign key migrations standard and that, as any major change, bites lots of existing users.  It certainly has me.  Here's how to turn it off:

1.  Turn off your server.
2.  Create an initializer in config/initializers named active_record_belongs_to_required_by_default.rb  You could also name it "you_suck_rails.rb" (yeah I'm at ElixirCon so hitting this, today, is beyond bitter).
3.  Add this content:

    #Be sure to restart your server when you modify this file.

    #Require `belongs_to` associations by default. This is a new Rails 5.0

    #default, so it is introduced as a configuration option to ensure that apps

    #made on earlier versions of Rails are not affected when upgrading.

    Rails.application.config.active_record.belongs_to_required_by_default = false

