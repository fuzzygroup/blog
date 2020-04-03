---
layout: post
title: Adding Chartkick to a Rails 6 App - Things I Always Forget
category: rails
tags: ["rails"]
---
{:.center}
![IMG_2666.jpeg](/blog/assets/IMG_2666.jpeg)

[Chartkick](https://chartkick.com/) is the charting engine that I've used for a bunch of years.  When you use Chartkick on a Rails 6 app, here are some gotchas:

## Gemfile

    gem 'chartkick'

## Command Line

    bundle install
    yarn add chartkick chart.js
    yarn install --check-files

## Add to application.js

    require("chartkick")
    require("chart.js")
