---
layout: post
title: Rails Console and Test Mode
category: rails
tags: ["rails", "test"]
---
{:.center}
![IMG_1831.jpeg](/blog/assets/IMG_1831.jpeg)

This one is a short one but a good one.  One really useful trick is to launch Rails console in test mode:

    ❯ RAILS_ENV=test rails c
    Running via Spring preloader in process 41705
    Loading test environment (Rails 6.0.2.1)
    irb: warn: can't alias context from irb_context.

You can check the Rails environment this way:

    2.7.0 :001 > Rails.env
    "test"

The benefit to this is that you can work directly with FactoryBot and experiment with factories:

    2.7.0 :002 > project = FactoryBot.create(:project, name: "Scott's Project")

FactoryBot is installed via Gemfile and locked into test environment only (which is why you need to launch Rails console in test mode):

    group :test do
      # Adds support for Capybara system testing and selenium driver
      gem "capybara", ">= 2.15"
      gem "selenium-webdriver"
      # Easy installation and use of web drivers to run system tests with browsers
      gem "webdrivers"
      gem 'factory_bot_rails'
      #gem 'database_cleaner'
      # gem 'shoulda'
      # gem 'shoulda-matchers'
    end