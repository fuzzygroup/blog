---
layout: post
title: Using Elastic Search and Rails for a Compound Query with Text Strings and User ID
category: rails
tags: ["rails", "ruby", "elastic_search"]
description: Using ElasticSearch and Rails to search the contents of a model is drop dead simple -- when you only want to search text.  Here I go over how to search text alongside an attribute like user_id.
---
{% pizzaforukraine  %}

I'm writing this blog post, my first in quite a while, because I recently had to implement [ElasticSearch for Rails](https://github.com/elastic/elasticsearch-rails) for a [new application I'm building](https://www.jobhound.io) and I find life in the Elastic world a bit different than I had expected.  If you're an Elastic Search veteran then you should definitely move along because:

* This is fairly basic
* I'm writing this mostly to cement this in my own brain

Curiously I found very few examples about how to do this type of compound query in Rails and that's also part of my motivation for writing it.  The closest example I found was in a [four year old Stack Overflow post](https://stackoverflow.com/questions/19381199/how-to-perform-elasticsearch-query-on-records-from-only-a-certain-user-rails-ti/49900343#49900343).

# The Problem: Everyone Should See Only Their Own Data

I have a series of ActiveRecord models that I want to be able to search using Elastic Search.  This can easily be done with this code fragment:

    Job.search_user(params[:q])

Given that I was initially the only user on this code base, I didn't even notice the issue until I thought about deployment.  At which point there was the obligatory light bulb / I'm an idiot moment.  The problem here is that this code searches everyone's jobs, not just the jobs that **you** created.  Now since every bit of data encompasses a user_id attribute, this should boil down to two problems:

1.  Getting user_id into the index
2.  Constructing a JSON query for ElasticSearch to execute

# Sidebar: But What About SearchKick

I'm sure a number of people are shouting out "Use [SearchKick](https://github.com/ankane/searchkick) (dummy)" but whenever I tried to use SearchKick, I got odd errors and I eventually just pulled it from Gemfile.  Given that I'm a long time believer in Ankane's ChartKick, I'm sure it is me but I still couldn't make use of it.

# Step 1: Getting user_id into the Index

I've opted to setup each of my searchable models as follows:

    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    settings do
      mappings dynamic: false do
        indexes :company^5, type: :text, analyzer: :english
        indexes :title^5, type: :text, analyzer: :english
        indexes :why_rejected, type: :text, analyzer: :english
        indexes :location, type: :text, analyzer: :english
        indexes :name, type: :text, analyzer: :english
        indexes :domain, type: :text, analyzer: :english
        indexes :created_at, type: :date
        indexes :user_id, type: :text
      end
    end

The :title^5 bumps the ranking of search results in the title or company attributes by a factor of 5.  

# Step 2: Constructing the JSON query

I ended up with a class method on each of my searchable objects like this:

    def self.search_user(query, user)
      self.search({
        query: {
          bool: {
            must: [
            {
              multi_match: {
                query: query,
                fields: [:company, :title, :description, :name]
              }
            },
            {
              match: {
                user_id: user.id.to_s
              }
            }]
          }
        }
      })
    end

I can call this from my search controller like this:

    @jobs = Job.search_user(params[:q], current_user)

and get results bound only to the logged in user -- exactly what I was looking for.

# Step 3: Re-indexing Everything

After making changes to your settings / mappings, you need to re-index everything.  I handle this with a simple rake task like this:

    namespace :search do
      # bundle exec rake search:index_all --trace
      task :index_all => :environment do
        klasses = [Job, Note, CoverLetter, Task]
        klasses.each do |klass|
          klass.send(:import, :force => true)
        end
      end
    end

This re-indexes every model in full.  You don't always need this but it is very convenient to have for development when you're playing with schema changes and the like.

# Recommended Reading

I made heavy use of [Iridakos's excellent tutorial](https://iridakos.com/tutorials/2017/12/03/elasticsearch-and-rails-tutorial.html) and I recommend you do too.