---
layout: post
title: Getting Started with MongoDB and Rails
category: rails
tags: ["rails", "mongo"]
---
I am a well known MySQL fan if not fanatic.  I've used MySQL since 1999 and while I've had the occasional issue here and there, I've been immensely happy with it overall.  But times change and now I find myself using Mongo in the context of a Rails app and, well, I'm a bit lost.  This post writes down what I've learned -- mostly about the operational side of Mongo and getting started.

**Assumptions**: Rails 5 / Ruby 2.3 / Mongo 3.4 / OSX; currently building a rails application called **api**

# The Error Message

What drove me into writing all of this down was I kept hitting this error message:

    Mongoid::Errors::NoClientConfig: message:   No configuration could be found for a client named 'default'.

# Useful Reading:

I read a number of things including:

* [GoRails](https://gorails.com/guides/setting-up-rails-4-with-mongodb-and-mongoid)
* [TutorialsPoint](https://www.tutorialspoint.com/mongodb/mongodb_create_database.htm)
* [StackOverflow](http://stackoverflow.com/questions/15354936/rails-engine-mongoid-no-configuration-could-be-found-for-a-session-named-def)

# Installation

I used HomeBrew to install Mongo:

    brew install mongodb

# Getting into the Shell

After Mongo is installed you can get into the Mongo shell with the command:

    mongo

# Creating Your First Database

Oddly the use command creates the database.  If the database doesn't exist then it is automatically created:

    use api_development ENTER

# Making Mongo Work Under Rails

Getting to this stage wasn't all that hard.  The problem here is that I've never setup a new rails app from scratch with Mongo.  I've worked on Mongo stuff in the past but this was an entirely new thing. Here were the steps I followed.

## Getting Rid of ActiveRecord in Your Application

When you create your rails app, you need to add the --skip-active-record flag to turn off ActiveRecord entirely:

    rails new api --skip-active-record --api
    
Note: This is an api mode Rails application so I'm passing in --api.

## Creating the mongoid.yml File

rails g mongoid:config

## Getting mongoid.yml Loaded

touch config/initializers/mongo.yml