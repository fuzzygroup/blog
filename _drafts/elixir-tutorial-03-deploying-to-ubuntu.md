---
layout: post
title: Elixir Tutorial 03 - Deploying to Ubuntu
category: elixir
tags: ["elixir"]
---
As discussed in my last Elixir Tutorial post we are trying to build a redis driven page fetcher that will:

* connect to redis
* pop a tuple of information that identifies what to fetch including a url
* will fetch the page from the internet
* will save the html to a database table for processing

Given that Elixir is new to me (and arguably most people), the question of how to get this running on a server is actually a big deal.  Getting stuff running on a server is what is called deployment and deploying code can be tricky.  It literally took years before I was comfortable with the state of Ruby deployment and it is only relatively recently that I would posit that Capistrano is actually good.  So given the relatively embryonic state of Elixir, what are our deployment options:

1. git clone to a server and adjust settings manually as needed
2. build to a container and push
3. use a CI tool like [this approach](http://elviovicosa.com/blog/2016/07/13/deploying-elixir-releases.html)
4. [e-deliver](https://github.com/boldpoker/edeliver)
5. [distillery](https://github.com/bitwalker/distillery)

For this tutorial, I'm going to do a straight git clone to make sure I understand how an Elixir app is structured and then I'll likely move to either distillery or e-deliver in a later tutorial.  

# Getting Elixir Installed Server Side

I'm working on an Ubuntu 14.04 trusty box for this.  Here are the steps from  [elixir-lang](http://elixir-lang.org/install.html):

* wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
* sudo apt-get update
* sudo apt-get install esl-erlang
* sudo apt-get install elixir

Please note that while your results may vary, this is not a fast install by any means.  I witnessed the erlang install take more than 40 minutes or enough time to browse the internet quite a bit, discover [timezone.io](http://www.timezone.io) and setup a whole remote organization with it.  Very cool.

# Cloning Your Project

As long as your server has access to Github then it should be a simple matter of:

* mkdir ~/elixir (to give a project root)
* cd ~/elixir
* git clone git@github.com:fuzzygroup/elixir_page_fetcher.git

