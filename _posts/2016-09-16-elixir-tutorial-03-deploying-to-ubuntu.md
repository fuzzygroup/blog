---
layout: post
title: Elixir Tutorial 03 - Deploying to Ubuntu
category: elixir
tags: ["elixir"]
---
As discussed in [my last Elixir Tutorial post](https://fuzzygroup.github.io/blog/elixir/2016/09/15/elixir-tutorial-02-adding-redis-support-to-our-page-fetcher.html) we are trying to build a redis driven page fetcher that will:

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

If you have at all an unreliable network connection then run Tmux first so connection loss doesn't bork your install.

Please note that while your results may vary, this is not a fast install by any means.  I witnessed the erlang install take more than 40 minutes or enough time to browse the internet quite a bit, discover [timezone.io](http://www.timezone.io) and setup a whole remote organization with it.  Very cool.


# Cloning Your Project

As long as your server has access to Github then it should be a simple matter of:

* mkdir ~/elixir (to give a project root)
* cd ~/elixir
* git clone git@github.com:fuzzygroup/elixir_page_fetcher.git

Then to test your project:

* cd ~/elixir/elixir_page_fetcher
* mix deps.get
* answer Y to install the hex package manager or do mix local.hex --force as your first step
* mix test

If all goes well the code should compile and the test should run.  Here's what the whole process looked like for me:

    [foo@adl-ad-work2 /home/foo/srv/current]$ cd ~/elixir/elixir_page_fetcher/
    [foo@adl-ad-work2 /home/foo/elixir/elixir_page_fetcher]$ mix deps.get
    Could not find Hex, which is needed to build dependency :exredis
    Shall I install Hex? (if running non-interactively, use: "mix local.hex --force") [Yn] Y
    * creating /home/foo/.mix/archives/hex-0.13.0
    Running dependency resolution
    * Getting exredis (Hex package)
      Checking package (https://repo.hex.pm/tarballs/exredis-0.2.5.tar)
      Fetched package
    * Getting eredis (Hex package)
      Checking package (https://repo.hex.pm/tarballs/eredis-1.0.8.tar)
      Fetched package
    [foo@adl-ad-work2 /home/foo/elixir/elixir_page_fetcher]$ mix test
    Could not find "rebar", which is needed to build dependency :eredis
    I can install a local copy which is just used by Mix
    Shall I install rebar? (if running non-interactively, use: "mix local.rebar --force") [Yn] Y
    * creating /home/foo/.mix/rebar
    * creating /home/foo/.mix/rebar3
    ==> eredis (compile)
    Compiled src/basho_bench_driver_erldis.erl
    Compiled src/eredis.erl
    Compiled src/eredis_sub.erl
    Compiled src/basho_bench_driver_eredis.erl
    Compiled src/eredis_sub_client.erl
    Compiled src/eredis_client.erl
    Compiled src/eredis_parser.erl
    ==> exredis
    Compiling 5 files (.ex)
    Generated exredis app
    ==> page_fetcher
    Compiling 1 file (.ex)
    Generated page_fetcher app
    .

    Finished in 0.1 seconds
    1 test, 0 failures

    Randomized with seed 243121
    
# Understanding Some Elixir Ecosystem Basics

There were a number of things in the output above that may need some clarification:

* [Erlang](http://www.erlang.org/) - this is the root language which Elixir is written in.  Erlang provides a language, a virtual machine and the OTP framework which is designed for building concurrent, distributed applications.
* [Hex](http://www.hex.pm) - this is the underlying package manager for Elixir.  Think of it as Ruby Gems but improved.
* [Rebar](https://github.com/erlang/rebar3) - this is a build tool which makes it easier to build Erlang applications    

# Next Time

In the next tutorial I will, hopefully, actually get to write some working Elixir code - what I've been trying to work towards for weeks if not months.  