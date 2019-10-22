---
layout: post
title: Getting Used to Heroku and Rails
category: rails
tags: ["rails", "heroku"]
---
{:.center}
![IMG_9604.jpeg](/blog/assets/IMG_9604.jpeg)

I remember using [Heroku](https://www.heroku.com) in its very infancy when it was mostly a web based user interface for authoring Rails apps.  I looked at it, thought "why would you want to author code in a browser; that's dumb af" and promptly moved on.  Now, more than a decade later, I find myself using Heroku daily for my latest side project -- and absolutely loving it.  This blog post lays out some tips and tricks that I've learned.

All of this assumes you have a Rails application and it is configured to use Heroku.  If you don't have the heroku executable then you can use brew on OSX to install it:

    brew tap heroku/brew && brew install heroku

## Getting Help

Just use the --help flag to the heroku command.

    heroku --help

## Running the Rails Console

To load up a Rails console for your project, change into the product directory and:

    heroku run rails console

## Accessing Your SQL Database

Just use the host parameter of your sql database's client software and connect to it directly.  Here's an example from mine (details changed):

     mysql -uUSERNAME -pPASSWORD DB_NAME --host=HOSTNAME

Get the details of what to connect to with:

    heroku config | grep CLEARDB_DATABASE_URL

## Running Migrations

Migrations should run automatically on deployment.  Apparently, however, that is not always true and they can be run manually with:

    heroku run rake --trace db:migrate

Thank you to the very first user of my new side project for finding this.  Hat Tip.  

## Tailing Your Logs

Heroku only gives you access to the last 1500 lines of your logs:

    heroku logs

For access to more logging into then I strongly, strongly, strongly recommend [HoneyBadger](https://fuzzyblog.io/blog/rails/2019/10/21/honeybadger-even-more-awesome-than-ever.html).

## Listing All Time Zones (or Running Any Damn Rake Task)

You can see your time zones or run any rake task with:

    heroku rake time:zones:all

## To View Your Configuration

View configuration details with:

     heroku config

## Importing Your Development Data

See this [blog post](https://fuzzyblog.io/blog/heroku/2019/10/16/importing-your-local-mysql-database-into-heroku.html) if you want to import your development data.

## References

This is a [good article](https://devcenter.heroku.com/articles/getting-started-with-rails5) on Heroku.
