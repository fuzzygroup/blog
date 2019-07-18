---
layout: post
title: Adding Quick and Dirty JSON Serialization to Database Objects
category: rails
tags: ["rails", "ruby"]
---
So let's say that you're building a system where you need to configure things like measurements and you know that some people like pounds and some people like kilograms.  One option is to hard code a database structure where you have an attribute for each.  And while that works, there are always going to be some more measurement types in the world and this approach leads you to an endless array of sucking database column changes.  

Another approach is to add a text column to your database and store a JSON blob in it.  Rails actually makes this pretty easy with a migration and a declaration:

Migration:

    class AddUnitPreferencesJsonToUsers < ActiveRecord::Migration[5.2]
      def change
        add_column :users, :options, :text
      end
    end

Declaration at the top of your class:

    serialize :options, JSON

This will now add an options column to your table where you can store anything.  And since there is a serialize call, it will even act like an attribute so you can say something like:

    user = User.first
    user.options

and get back:

    {
        "length" => "inches",
        "weight" => "pounds",
          "time" => "hours"
    }

And if you really, really like working on a REPL like I do then you can set this globally for all users with this snippet:

    users = User.all
    users.each do |user|
      user.options = options = { "length" => "inches", "weight" => "pounds", "time" => "hours" }
      user.save
    end

Easy - no fuss, no muss, no need to write code in an editor for a one time, one off fix.

And just to be clear, you can do a better job with this by really following the instructions.  Here's an [example from CodeBurst](https://codeburst.io/json-serialized-columns-with-rails-a610a410fcdf) which includes custom serializers.  Recommended
