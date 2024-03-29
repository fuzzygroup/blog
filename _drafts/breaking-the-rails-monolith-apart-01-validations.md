---
layout: post
title: Breaking the Rails Monolith Apart 01 - Validations
---
The classical Rails architectural pattern is the *monolith* -- a giant application that encompasses all parts of your codebase. You know it, I know it, we all know it and all **too well**.  Even though we all talk about micro services, Rails itself seems almost designed to prevent that architectural pattern.  You know what I'm talking about -- you start by building a web app in Rails. Then you need an API so you quickly make an API controller within the same application.  Then you need an admin tool and sooner or later you end up with numbers like these:

    +----------------------+-------+-------+---------+---------+-----+-------+
    | Name                 | Lines |   LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Controllers          | 36621 | 24073 |     147 |    1297 |   8 |    16 |
    | Helpers              |  6688 |  5212 |       1 |     393 | 393 |    11 |
    | Models               | 153716 | 81985 |    1446 |    9737 |   6 |     6 |
    | Mailers              |     0 |     0 |       0 |       0 |   0 |     0 |
    | Javascripts          | 25828 | 16579 |       0 |    1993 |   0 |     6 |
    | Libraries            | 60197 | 36648 |     189 |    1571 |   8 |    21 |
    | Integration tests    |    75 |    59 |       1 |       1 |   1 |    57 |
    | Controller specs     | 18848 | 11227 |       0 |       0 |   0 |     0 |
    | Feature specs        |  4239 |   529 |       0 |       0 |   0 |     0 |
    | Helper specs         |  2366 |  1388 |       0 |       0 |   0 |     0 |
    | Lib specs            |  4162 |  2948 |       0 |       0 |   0 |     0 |
    | Model specs          | 54256 | 37837 |       0 |       3 |   0 | 12610 |
    | View specs           |   534 |   320 |       0 |       2 |   0 |   158 |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Total                | 367530 | 218805 |    1784 |   14997 |   8 |    12 |
    +----------------------+-------+-------+---------+---------+-----+-------+
      Code LOC: 164497     Test LOC: 54308     Code to Test Ratio: 1:0.3

That's from one of my production applications -- it has **everything** and it is an absolute nightmare to maintain.  Yes it is terribly convenient to have a monolith but the number of potential interactions between different parts of the system are monstrous and just the time to launch Rails console is now approaching a full minute.  

So if a monolith has all these issues, why do we do it?  Well the answer really comes down to code re-use and code management.  Let's consider, for example, what happens when you want to add a user api onto an existing application.  To start you probably want to use the new Rails 5 API mode.  

Thank about the task of building an API for your Rails application.  While Rails 5 offers the **wonderful** new API mode, it is a *mode* and it cannot be used as part of a full stack Rails application. 

rake task for copying in validations

http://stackoverflow.com/questions/11372484/rails-put-validation-in-a-module-mixin

  require 'api_key_validations'
  include ApiKeyValidations


module ApiKeyValidations
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name
    validates_presence_of :user
    #validates :name, :length => { :minimum => 2 }, :presence => true, :uniqueness => true
    #validates :name_seo, :length => { :minimum => 2 }, :presence => true, :uniqueness => true
  end
end