---
layout: post
title: Elixir Tutorial 02 - Adding Redis Support to our Page Fetcher
category: elixir
tags: ["elixir"]
---
In my [last elixir post](https://fuzzygroup.github.io/blog/rails2elixir/2016/09/15/generating-a-new-elixir-project.html) I documented how to generate a standalone Elixir project for a page fetcher.  Technically that would have been Elixir Tutorial 01 but I'm too tired right now to go back and rename it since this is my middle of the night, can't sleep coding time while on vacation.

Let's start with a description of what we're planning to build.  What is a page fetcher?

> A page fetcher is a bit of software that pulls content (pages) from the Internet and stores them some where for processing by something else.

So what do we actually need:

1.  A bit of software that runs reliably 
2.  And doesn't require writing low level libraries as we're just not there yet with our Elixir skills
3.  And pulls content from Redis that describes what to fetch
4.  And fetches a page off from a url
5.  And stores it away for processing.  Likely in a database or some such place

That doesn't sound so hard, does it?  Here's the [redis library](https://github.com/artemeff/exredis) we're going to use.  Let's start by adding redis support to what we generated last time.  

Change into your working directory.  For me that is:
    
    cd ~/me/fuzzygroup/elixir/page_fetcher

Now run mix test to make sure everything is still working:

    mix test    
    
Open the file mix.exs in your editor and add the following:

    {:exredis, ">= 0.2.4"}
    
This needs to go between the [] in the defp deps routine.  Think of it this way -- you are updating Gemfile.  That's all this is.  Only its a more reliable Gemfile without the cruft and crap of bundler.  I love you Ruby but good lord the packaging infrastructure lately blows monkey chunks.  Not a day goes by that I don't hit some Gemfile / bundler crap.

Now run mix test again:

    mix test
    
And you're going to see a failure like this:

    sjohnson@ScottJohnsonMacbookAir:~/me/fuzzygroup/elixir/page_fetcher$ mix test
    Unchecked dependencies for environment test:
    * exredis (Hex package)
      the dependency is not available, run "mix deps.get"
    ** (Mix) Can't continue due to errors on dependencies

So you're going to do what I think of as the *deps dance* and type:

    mix deps.get
    
And you'll see something like this:

    A new Hex version is available (0.13.0), please update with `mix local.hex`
    Running dependency resolution
    Dependency resolution completed
      eredis: 1.0.8
      exredis: 0.2.5
    * Getting exredis (Hex package)
      Checking package (https://repo.hex.pm/tarballs/exredis-0.2.5.tar)
      Fetched package
    * Getting eredis (Hex package)
      Checking package (https://repo.hex.pm/tarballs/eredis-1.0.8.tar)
      Fetched package    
      
Your mileage may vary with respect to the "please update ..." stuff.  Please bear in mind that Hex isn't perfect at present.  I've see issues but they are few and far between at least in my experience.

The next step up is to modify your project to talk to your Redis server.  Do that by modifying config/config.exs with your server params.  Here are mine:

    config :exredis,
      host: "127.0.0.1",
      port: 6379,
      password: "",
      db: 0,
      reconnect: :no_reconnect,
      max_queue: :infinity

Since we're connecting on 127.0.0.1 you need to run this on the same machine where your redis server lives or adjust the ip address.  

As always when you change anything run your test suite which will compile your code and show you any errors.  Here's what mine looks like:

    mix test
    ==> eredis (compile)
    Compiled src/eredis_sub.erl
    Compiled src/eredis_parser.erl
    Compiled src/eredis_sub_client.erl
    Compiled src/basho_bench_driver_erldis.erl
    Compiled src/eredis.erl
    Compiled src/basho_bench_driver_eredis.erl
    Compiled src/eredis_client.erl
    ==> exredis
    Compiling 5 files (.ex)
    Generated exredis app
    ==> page_fetcher
    Compiling 1 file (.ex)
    Generated page_fetcher app
    .

    Finished in 0.05 seconds
    1 test, 0 failures

    Randomized with seed 697093    
    
So at this point we have an elixir application with a supervision tree for reliability and a redis client.  Given that I'm a strong believer in "deploy early; deploy often", I'll handle getting all this deployed onto an Ubuntu server.  After that I'll tackle getting this to run continuously popping things from the redis queue.

All code can be found here: [https://github.com/fuzzygroup/elixir_page_fetcher](https://github.com/fuzzygroup/elixir_page_fetcher)