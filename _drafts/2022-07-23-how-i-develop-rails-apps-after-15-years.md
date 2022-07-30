---
layout: post
title: How I Develop Rails Apps
date: 2022-07-23 12:39 -0400
category: rails
tags: rails
---
{% pizzaforukraine  %}

When you do the same thing over and over and over for enough years, you start to develop an approach to a problem.  I've now been building Rails apps since 2007 and I've definitely got an approach.  I don't think I've ever really set it down in one place before though so here goes:

0. Write a business plan for the new application (if applicable; and its generally applicable)
1. Generate a new application.
2. Customize it by running add_to_every_rails_application/go shell script which moves common stuff into it
3. Customize config/initializers/constants.rb with product_name and tag_line
4. Deploy First Development -- deploy it immediately before it gets any more complex.
5. Model the data scaffold by scaffold.
6. For each model create a self.exists method and a self.find_or_create method
7. Write the validations for the model
8. Build a lib/tasks/model_name.rake file to seed it with initial data
9. Add the lib/tasks/model_name.rake file to lib/tasks/seed.rake
10. Write the controller logic

You'll notice that this isn't exactly standard practices.  Specifically I differ a lot in terms of seeding.  I've always found that data drives the application (and data is often more valuable than the application itself).  So you need real logic to handle the process of seeding the app.

More details on each step are below.

## 0. Business Plan

I firmly believe that if its worth writing code, its worth planning out the effort.  I templated out the process of building a light weight business plan -- I actually call it an opportunity profile -- here:

* Template

## 1. Create a New Application

This is almost always a Rails generator statement like:

    bundle exec rails new flow_analytics_marketing  --javascript=esbuild --css=bootstrap --force -d=postgresql
    bundle exec rails new collection_select --force --css=bootstrap -d=postgresq
    rails new pool_api --api

**Note**: When I build from a JumpStart Pro template, I use the process [here](https://fuzzyblog.io/blog/rails/2022/07/07/creating-a-rails-app-using-jumpstart-pro.html).

I used to cargo cult old rails apps from project to project and that is such a litany of code smells that, well, we don't have deodorizers powerful enough.

## 2. Customize It

I have a series of things that I do to every Rails app.  Not all of these are gems (yet) so I wrapped that process into a shell script.  

It is open sourced [here])(https://github.com/fuzzygroup/add_to_every_rails_app).

## 3. constants.rb

Every Rails application I build has at least two constants:

* PRODUCT_NAME
* TAG_LINE

PRODUCT_NAME might have a value like "Pool Wizard" and TAG_LINE might have a value like "Never have to test your water again".

**Note**: Jared Haworth and I started using a file called constants.rb in config/initializers back in '08.  So this is about a 15 year old practice.

## 4. Deploy First Development

I strongly, strongly, strongly advocate for DFD (deploy first development) right from the beginning.  Rails applications are very much like complex swiss watches.  And as the complexity grows, they get harder and harder to deploy.

And if you need to [engage in rework](https://fuzzyblog.io/blog/rails/2022/07/02/software-has-rework-too.html) to support deployment, well, better to do it sooner.

## 5. Model the Data Scaffold by Scaffold

Data is vastly more important than code.  I'm sorry to all my fellow software engineers but our code is ephemeral but the data it manages

## 6. Create find_or_create Scaffold Method

I wrote about [idempotency and Rails database objects here](https://fuzzyblog.io/blog/rails/2022/06/10/thinking-about-rails-database-objects-and-idempotency.html).

## 7. Validations

## 8. Seeding via Rake

## 9. Add the Model Level Seeder to seed.rake

## 10. And Finally Controllers ...
