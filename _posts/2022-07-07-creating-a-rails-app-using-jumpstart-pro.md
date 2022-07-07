---
layout: post
title: Creating a Rails App Using JumpStart Pro
date: 2022-07-07 02:36 -0400
category: rails
tags: ["rails", "jumpstart"]
---
The following blog post is an excerpt from a series of articles I'm working on about JumpStart Pro.  I found myself referring to the steps below that I thought it might be generally useful for people.

I'm going to walk you through the "post purchase" experience with Jump Start Pro (JSP).  This will guide you through creating a new app using JSP.

## Step 1: Cloning an App Into Your Github

Here's what you do:

1. Purchase your Jumpstart Pro license.
2. Log in to [https://Jumpstartrails.com/](https://Jumpstartrails.com/) if you haven't already.
3. Click on your license name.
4. You will end up at a page which tells you to visit your Github repo.  You need to goto: [https://github.com/orgs/Jumpstart-pro](https://github.com/orgs/Jumpstart-pro).  This in turn will take you here: [https://github.com/Jumpstart-pro](https://github.com/Jumpstart-pro)
5.  Click into the Rails repository [https://github.com/Jumpstart-pro/Jumpstart-pro-rails](https://github.com/Jumpstart-pro/Jumpstart-pro-rails)
6. Click the green Use This Template button.
7. Change the owner to be **your** github name
8. Enter the name of the NEW repo: 
9. Set your description if you care (I never do).
10. Change the setting to be **private**.
11. I checked off [ ] include all branches (no clue if that was right or not)
12. Click the green **Create repository** from template button

## Step 2: Getting that Cloned App Onto Your Machine

Github is going to clone the Jumpstart pro rails repo over to your personal github account.  Here's what's next

1. On your new repo, click the green **Code** drop down and get the clone url .
2. On your development machine, change to your local development directory and clone the repo: git clone (what you copied)
3. Set up your local ruby to be 3.1 if you don't have it.
4. Run a bundle install 
5. Edit config/database.yml and change database names as needed.

Now you want to run:

    bin/rails db:create

## Step 3: Setup and Getting to Green Tests in a Rails 7 World

When you're starting with something complex that someone else built then tests are always, always, always your friend.  So this means that you start with:

    bin/rails test

This is going to fail but we're working from failure to success (a red / green refactor approach).

1. Run npm install
2. Run yarn install --check-files (Disclaimer -- the whole asset pipeline largely remains a mystery to me; I think this is needed but, for all I really know, running it could kill Santa's elves and invoke the apocalypse).
3. Run bin/rails test - if this passes, GREAT!  But if you get the error: DRb::DRbRemoteError: The asset "application.js" is not present in the asset pipeline. then revert your node version back to 16.  

Here's how to check your node version:

    ❯ node -v
    v18.2.0

Just like ruby has RVM, node has [NVM](https://github.com/nvm-sh/nvm) (node version manager) so install that.

    nvm install 16.3.0

and then:

    npm install

Now you need to build the JavaScript for the app:

    rails javascript:build

The next error you will get is

> The asset "application.css" is not present in the asset pipeline

so now you need to do:

    rails css:build

And now you can do:

    bin/rails test

and you should have passing tests!

Kudos to: [Benjamin Huoy](https://jumpstartrails.com/discussions/javascript-error-with-ruby-3-1-and-latest-commit)  for making this clear to me.  Thank you.

## Step 4: Add Your Gems

My usual next steps are to add my normal suite of gems:

    bundle add url_common && bundle add text_common && bundle add date_common && bundle add time_common
    bundle add factory_bot_rails --group test

Disclaimer: The gems named something_common are ones that I wrote.  They are on my [Github](https://github.com/fuzzygroup).