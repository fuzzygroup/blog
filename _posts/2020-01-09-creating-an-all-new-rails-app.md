---
layout: post
title: Creating an All New Rails App
category: rails
tags: ["rails"]
---
{:.center}
![2017-02-20_08.11.21.jpg](/blog/assets/2017-02-20_08.11.21.jpg)

I have been mentoring a person new to Rails for the past several weeks and it is always instructive to see where someone new to the platform has issues.  This blog post walks through the commands we used today and explains them.  If you're an old hat at this, just move on but if you're starting out, I suspect this may be quite helpful.

## Navigate to the Right Starting Directory

    cd /Users/sjohnson/Sync/coding/rails/

## Make Sure Rails is Ok

    rails --version

## Set the Ruby Version

    rvm use 2.7.0

## Find a Rails New Command from my History

    history | grep 'rails new'

## Create a New Rails App

    rails new dev_home_page --database=mysql

## Change Into The Directory

    cd dev_home_page

## Run Bundle Install

    bundle install

## Start a Web Server

    bundle exec rails s -p3096

Open the web server in your browser with:

    http://localhost:3096/

## Close Web Server with Ctrl+C and Edit config/database.yml

    mate config/database.yml

You need to set the user and password on your database server in the first configuration block within the database.yml file.

## Create the Database Itself

    bundle exec rake db:create

## Run rake db:migrate

    bundle exec rake db:migrate

## Start Two More Terminal Panes

I run iTerm and I'm a firm believer in the "The Trininty of Terminal Windows for Rails Development" so I right click in my terminal window and select Split Pane Horizontally twice giving me 3 terminal windows in one.  I then go back to my first terminal window and get the current directory.

**Note 1**: The trinity of terminal windows is Web Server, Rails Console and a Command Line for git commits / whatever else.

**Note 2**: The same result can be done with 3 tabs in standard OSX Terminal.  I just **adore** iTerm; it has made my life better.

**Note 3**: Start your Rails Console in the middle pane with:

    bundle exec rails c

## Get the Current Directory and Set all Terminal Panes to this Directory

    pwd 

and then in each other terminal pane, do:

    cd /Users/sjohnson/Sync/coding/rails/dev_home_page

This is the directory that pwd displayed or you.

## Install Yarn

    curl -o- -L https://yarnpkg.com/install.sh | bash

Update your current terminal window's path with:

    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

Add yarn to your application:

    yarn install --check-files    

## Re-Run the Web Server from the Top Terminal Pane

    bundle exec rails s -p3096

At this point the errors seen initially should be gone entirely.  Open the web server in your browser with:

    http://localhost:3096/

## Create a Model and Edit the Migration

The next real test of being able to make a Rails app is to generate a model.  If this works then your entire Rails app should be setup correctly:

    bundle exec rails g model Project


