---
layout: post
title: Converting from FactoryGirl to FactoryBot
category: rails
tags: ["rails", "ruby", "testing"]
description: While the FactoryGirl to FactoryBot conversion isn't hard, using the standard search and replace approach means you don't necessarily understand what happened to your code base.  Here I do it step by step.
---
This blog post talks about the renaming of FactoryGirl to FactoryBoy  and the necessary refactoring that you have to do to a current Rails app to support it.  The official guide to converting your Rails from [FactoryGirl to FactoryBot](https://github.com/thoughtbot/factory_bot/blob/4-9-0-stable/UPGRADE_FROM_FACTORY_GIRL.md) is here.  Their solution is a search and replace approach and while that works, I wanted to go thru this step by step.

## Step 0: Update Your Gemfile

You need to change your Gemfile from FactoryGirl to FactoryBot:

    gem "factory_bot_rails"

## Step 1: spec/support/factory_girl.rb

This file needs to be renamed from spec/support/factory_girl.rb to spec/support/factory_bot.rb and then the contents changed to reflect it:

    RSpec.configure do |config|
      config.include FactoryBot::Syntax::Methods
    end
    
## Step 2: spec/rails_helper.rb

Depending on your RSpec configuration you may not need to adjust this file.  In my case I was using FactoryGirl to create an @user variable so I had to adjust this as:

    @user = FactoryBot.create(:user, options)    

## Step 3: spec/factories/*.rb

Each of your factories needs to be rewritten to call FactoryBot not FactoryGirl so you'll have a structure something like this:

    FactoryBot.define do
      factory :user do
        email { Faker::Internet.email }
        username Faker::Name.first_name.downcase
        password "Sample:1"
        password_confirmation "Sample:1"
        first_name Faker::Name.first_name
        last_name Faker::Name.last_name
        active true
        confirmed true
      end
    end    

## Step 4: Your Actual Spec Files 

In each of your spec files, you'll need to change calls from FactoryGirl.create to FactoryBot.create like this:

    @job = FactoryBot.create(:job, :user_id => User.first.id)

## Step 5: Also Check spec/spec_helper.rb

You should also check spec/spec_helper.rb as this is a common place where you may have located some Factory* type of stuff.

## Conclusion

Overall this was a simpler conversion than I had expected.  Admittedly this was done in a relatively small [Rails MVP](https://www.jobhound.io) but it really was pretty painless.