---
layout: post
title: Deploying to HatchBox with Rails 5.x
date: 2020-09-14 09:22 -0400
category: rails
tags: ["rails", "deploy", "hatchbox"]
---
{:.center}
![IMG_4620.jpeg](/blog/assets/IMG_4620.jpeg)

I just got a database less home page for a future SAAS app deployed via [HatchBox](https://www.hatchbox.io/) under Rails 5.x and I thought the differences were significant enough that I should document it.  HatchBox is the best tool I've ever found for Rails deploys but knowing all the steps to follow is key.

**Note**: Other than the Rails 5.2 upgrade step, there aren't many differences between this and Rails 6 but it has been long enough since I've done this that writing it down felt right.

## 1. Upgrade Rails to "5.2.x" if You Don't Have rails credentials:edit

If your Rails 5 version is old enough that you get this crap:

    ❯ rails credentials:edit
    rails aborted!
    Don't know how to build task 'credentials:edit' (see --tasks)

Here's the line you want to put into your Gemfile:

    gem 'rails', '~> 5.2'
    
Once you change your Rails version, you want to use:

    bundle update

to upgrade your Rails installation.

## 2. There is No True Database Less Deploy in HatchBox

HatchBox is designed to work with a database (which is also the Rails default) because it calls database create and database migrate as part of the deploy.  The trick here is to use an existing database and set your env variables and database.yml to allow for this

Here's how to set up your database.yml file:

    production:
      adapter: postgresql
      url: <%= ENV['DATABASE_URL'] %>
      encoding: utf8
      pool: 50

Your env variables are described in the section below.

As long as you don't have migrations or database tables as part of your app, you can use any DATABASE_URL value (you set this below under environment variables; I just copied one from a different application).

## 4. Run rails credentials:edit

The command:

    rails credentials:edit

creates the Rails master key and secret key base that you need.  

You want to save your master key and secret key base because you need both in the env variables section.

## 5. HatchBox Setup

You want to:

* Add your app to github or another supported version control system and note the username/repo_name pairing
* Create a new app
* Choose the cluster
* Add your env variables (see next section)

## 6. Set Your Env Variables Correctly

Here are the env variables you want to set:

* DATABASE_URL
* RACK_ENV
* RAILS_ENV
* RAILS_MASTER_KEY
* REDIS_URL
* SECRET_KEY_BASE

## 7. Do a Deploy

After you get everything setup you want to do a deploy.  This is necessary before you can do the SSL stuff.

## 8. Setup Your Domain

I added my domain to the Domains section of HatchBox both as the base domain and as the www variant.

## 9.  Setup SSL

The next step is to select the SSL option and then turn on Let's Encrypt.

## 10.  Deploy and Verify

There are two final steps.  At this point everything should be setup so you want to do a final deploy and then verify your site in https mode.

## 11. Turn on Push Based Deploying

The absolute last step is to turn on git push based deploys so any code changes you make automatically trigger a deploy of your code.  HatchBox makes this brilliantly simple:

1. Go to your app's main page.
2. Click the Deploy menu item.
3. Click the Green Automatic Deploy button

And then make a simple code change and push the code.  At that point a deploy will start automatically.
