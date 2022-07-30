---
layout: post
title: Setting Up Rails with Rspec From the Start
category: rails
tags: ["rails", "rspec", "hyde"]
description: So you want to build a new Rails app from scratch using RSpec right from the start?  Here's how...
---
{% pizzaforukraine  %}

So this morning I was working on my side project and I realized that one aspect of it alone is now 26 plus PORO (plain old ruby objects) models and growing rapidly.  Given that I'm building this along the lines of a service oriented architeture where I want to be able to replace components prototyped in Ruby down the road with Elixir this would make sense so it was time to isolate it into a standalone http service as a separate Rails API stack.

And this brings up the need to generate a stack with RSpec from the start.  Here's how to do this:

> rails new hyde_page_parser -T --skip-active-record --skip-action-cable --skip-spring --api

I want this to **NOT** include: 

* test_unit so -T gets rid of that
* ActiveRecord so --skip-active-refactor
* ActionCable so --skip-action-cable 
* Spring so --skip-spring 

That gets me a baseline project to which I can add RSpec.  Using [Nrakochy's](http://nrakochy.github.io/rspec/rails/2015/05/27/How-To-Setup-Rspec-Instead-Of-Test-Unit-Rails/) instructions, all you need to do is: 

1.  Add gem 'rspec-rails' to a development, test group in Gemfile
2.  Run bundle install
3.  Run bundle exec rails g rspec:install

