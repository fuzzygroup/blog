---
layout: post
title: Becoming a Rails Developer - Bundle Install Completes; What's Next
category: rails
tags: ["rails"]
---
{% pizzaforukraine  %}

I currently bootstrapping a friend into a Rails development cycle and here's their status:

1. RbEnv is installed.
2. Ruby is installed.
3. Application is checked out.
4. Bundle Install has completed.
5. The database is created i.e. bundle exec rake db:create has completed.

So from their parlance, "the application compiles" -- but what now brown cow?

The first thing you want to do is verify that things work.  I mean they should but how do you know?  

The first step is to run the test suite:

    bundle exec rspec spec
    
That should execute and not show any errors.  If that succeeds then the next step in making sure your installation is complete is to run the Rails console and do something simple:

    bundle exec rails c (and press enter and wait for it to load)
    User.where(username: 'fuzzygroup') (and press enter)
    
What this should do is launch the interactive rails console -- a REPL, similar to what you get when you type python.  A REPL (read-evaluate-print-loop) is an interactive way to do development and manipulate the state of the system.  There are two different REPLs in the ruby world -- there is **irb** which is a REPL for the ruby language and then **rails c** which is the ruby REPL but loaded with all the "objects" (really classes) for your application.

The command:

    User.where(username: 'fuzzygroup')
    
is a "ActiveRecord" statement which says "Execute the User class and return any database objects with the username of 'fuzzygroup' drom the users table".  ActiveRecord is an ORM (object-relational mapper) that drives the database layer of Rails.  Unlike most ORMs, ActiveRecord actually works strikingly well.  

What you should get back from User.first at this point is basically [] and a response like this:

    User Exists? (56.5ms)  SELECT 1 AS one FROM `users` WHERE `users`.`username` = 'fuzzygroup' LIMIT 1
    []
    
The default operation for ActiveRecord's where statement is to query the database and return a collection of objects (think array although its actually richer).  In this case there was no matching object so you just got back an empty array (like class).

This brings us to an interesting ruby-ism which messes up a lot of people -- the concept of the default return.  Here's an example

    def multiply(x,y)
      x * y
    end
    
If you executed this method with multiply(2,3) then you'd get back 6 even though there is no actual return statement.  Ruby operates by returning the last evaluated expression at the end of a statement and we can use that concept right now.  Back in the Rails console type:

    result = _
    
And you'll get this:

    2.6.3 :018 > result = _
      User Exists? (8.3ms)  SELECT 1 AS one FROM `users` WHERE `users`.`username` = 'fddd' LIMIT 1
    []
    2.6.3 :019 > result.class
    User::ActiveRecord_Relation < ActiveRecord::Relation
    
In the Rails console, the last result is always available as the special variable **_**. And you can always look at an object's class with the .class method.  

To exit the Rails console, just type quit and press enter:

    quit
    
What you have now done is to validate that the Rails system itself works.  If you can bring up a Rails console and connect to the database thru ActiveRecord then pretty much 100% of Rails itself works (the connection to Redis is something else but we're not ready for that yet).  

And this brings up to the nasty truth about any Rails environment -- without data to operate on, things, well, really suck.  This process of getting an initial set of development data to work on is referred to as "seeding".  And there is both a default way to do this -- and then the way that I do it.

The default want to do this is:

    bundle exec rake db:seed
    
And that should load a series of YAML files which define the state of the objects in the system.  And while that works, I have always found that database seeding needs to be far more controllable and idempotent than a simple YAML loader.

Note: Idempotence is a fancy computer term that means:

  Idempotence (UK: /ˌɪdɛmˈpoʊtəns/, US: /ˌaɪdəm-/) is the property of certain operations in mathematics and computer science whereby they can be applied multiple times without changing the result beyond the initial application.  [Wikipedia](https://en.wikipedia.org/wiki/Idempotence)
  
From a personal perspective, in this context, idempotence means that an object in the database should be created correctly when it doesn't exist **and** that creation command should be able to be run again -- and not have that object altered.  Here's an example - you want a user named fuzzygroup (yep that's me; it is short for me and my cats while also being a mild reference to fuzzy logic) to exist in the system.  And when you extend the database seeding routine to be more powerful, you don't want the work that was done incrementally using the user interface to be wiped out.  

Here's how I manage database seeding:

    bundle exec rake seed:init --trace
    
**Note**: Yes you should do this now if you are working on one of my codebases; otherwise this won't do a damn thing.

The command rake is a way to execute a set of ruby scripts that run from the command line. Rake is a creation of the late Jim Weirich, a wonderful rubyist, and "rake tasks" are a key part of the Rails infrastructure.  This command is saying: "Run the seed namespace and call the init task within it.  Also give me a detailed trace of any errors".  Rake tasks live in this part of your rails codebase:

    lib/tasks/
    
All Rails codebases have a standard directory structure and lib is a top level directory in the hierarchy.  

At the end of this you should have a database that is now correctly populated with a series of objects related to the problem domain you are solving.  

The next step is to launch the default Rails web server with:

    bundle exec rails s -p3000
    
This runs Puma which is a ruby web server and you can navigate to:

    http://localhost:3000/
    
in Chrome or your default browser of choice and you should see a home page -or- a sign in page.  At this point you should dig into lib/tasks/user.rake and see if there are credentials to use (there are).