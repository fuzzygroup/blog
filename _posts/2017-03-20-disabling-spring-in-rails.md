---
layout: post
title: Disabling Spring in Rails
category: rails
tag: ["rails", "monolith", "hyde", "spring"]
description: The spring application pre-loader works find in a monolithic Rails app but far less so when you're not a monolith.  Here's how to disable it.
---
I now have more than a decade at building Rails apps and, since most of that time was a consultant, I think its fair to say that I've seen, worked on and built from scratch a lot of Rails applications.  My single least favorite part of Rails is the monolith application pattern.  While it can be incredibly productive to have every aspect of your source code in a single place, monoliths are an inherent anti-pattern:

* They are brittle
* They are fragile
* Gems can conflict with each other
* Ruby is a dynamic, late bound, garbage collected language -- the more lines of code you have the more likely you are to have some kind of conflict

Monoliths seem to work great for building BaseCamp but I am immensely unhappy with them and I've spent the past several months going down a service oriented architecture (SOA) approach for my side project.  

Spring is an application pre-loader which loads a chunk of your Rails code into memory in order to speed up development.  By having things preloaded, for example, you can get into rails console faster, or run tests faster, etc.  And this works fine when you have a monolith application pattern.  In my case, however, I'm partitioning my data at the user level into individual databases and using an environment variable to specify the database at load time with this trick in database.yml:

> database: cartazzi_web_app_<%= ENV['CARTAZZI_USER_ID'] %>_development

And this works perfectly -- until Spring rears its ugly head.  Since Spring has things cached, you can go into rails console and execute a User.first and find the wrong user.  It becomes even more confusing when you check the database with:

> Rails.application.config.database_configuration[Rails.env]["database"]

And it reports back a database that you **know** isn't the one where the user you just found doesn't exist.  What's going on is that the Rails console is talking to its in memory configuration which reports back something from earlier, not your current configuration.  And then you scratch your head for quite a bit until you cobble together enough brain cells to recall "oh crap -- SPRING!".

The solution is to disable Spring entirely.  Here's how:

1.  At the shell level, do this: **pkill -f spring** 
2.  Edit your Gemfile and comment out all the spring references.  
3.  At the shell level, do this: **bin/spring binstub --remove --all**  [Stack Overflow Reference](http://stackoverflow.com/questions/30302021/rails-runner-without-spring).

There are other ways around this including an environment variable which temporarily disables it but given the number of spring related processes I keep having to kill, I think getting it out entirely is better.