---
layout: post
title: Learning Phoenix from Sonny
---

Quick Links:
* [Phoenix](http://www.phoenixframework.org)
* [Elixir](http://elixir-lang.org)
* [Phoenix Book](https://pragprog.com/book/phoenix/programming-phoenix)

Below are my roughly stream of consciousness notes from [Sonny Scrogson's Taking off With Phoenix](https://github.com/scrogson/taking-off-with-phoenix/) class.

**This will be updated periodically through out the day.**

Layers:

  * your code
  * erlang / elixir
  * OTP
  * Kernel & STDLIB
  * ERTS
  * Operating System
  
There are other flavors of languages on top of erlang:

  * lua
  * lisp
  * prolog
  
ME: where do migrations live: priv/repo
  
Erlang VM

  * scheduler #1 - run queue
  * scheduler #2 - run queue
  * scheduler #3 - run queue
  
1 thread is run for every core on the machine (each scheduler above has a thread assigned to it)  

Processes

  * lightweight units of concurrency
  * maintain state via recursion
  * communication via message passing
  
Process

  * Stack   Heap
  * Mailbox
  * Links & Monitors (when you link to a process of the process dies then you die too) (and alert me when a process dies)
  * Garbage Collector  
  
Isolated & Concurrent

  * Crashes are isolated
  * Data is isolated (GC per process)
  * Load balances on IO and CPU (efficient on multicore)
  
OTP 

  * framework that makes it easy to deal with faults, concurrency and distribution
  
GenServers, Supervisors, Processes, Oh My!

  * GenServers are generic servers
  * supervisor - a process like any other that runs code specific to watching other processes
  
Phoenix is a framework for building modern web apps, API backends and distributed systems.  Written in Elixir, you get beautiful syntax, productive tooling and a fast and efficient runtime (thanks to the BEAM)      

Phoenix is an OTP application that provides functionality to your OTP application

  * mvc framework
  * familiar to those with experience in other web frames - rails, django
  * channels for implementing soft real time features
  * easy to test
  * not a lot of mocks in elixir
  * not objects with data; just data structures you feed into functions
  * no compromise - high productivity and high performance
  * Don't just port ruby to Elixir; Think Different
  * Performance - at times 17x faster than rails
  * no stop the world garbage collection
  
Equivalencies

  * plug = rack (ruby) = ring (clojure) = adapter for web servers ; currently supported is Cowboy
  
Getting Stuff Built from Scratch
  
  * Install the archive https://github.com/phoenixframework/archives : goto bottom and click on it and get the url from the raw (actually get the url from the download button )
  * mix archive.install https://github.com/phoenixframework/archives/blob/master/phoenix_new.ez?raw=true  
  * mix help | grep phoenix
  * github.com/phoenixframework/phoenix/installer
  * mix help phoenix.new
  * mix phoenix.server
  
  Processing by Workshop.PageController.index/2 
  
  /2 is the "ARITY OF THE FUNCTION" arity = number of arguments that the function accepts
  
  iex -S Mix <=== Rails Console
  
  Mix.env <== Rails.env
  
  config/config.exs = master config file
  
  dev.exs
  prod.exs
  
  deps - where your components
  
  2 top level directories - lib, web  The web directory is likely to go to lib down the road
  
  This is a list of two tuples:
  
  ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
   "ecto.reset": ["ecto.drop", "ecto.setup"],
   "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
   
   toople  <== correct pronunciation is toople
   
   tuple 
   
   
   elem {:key, "value"}, 0
   :key
   
   elem {:key, "value"}, 1
   "value"
   
   [{:key, "value"}] <== keyword list
   
   [{:key, "value"}]
   
   ["key":, "value"]  <== the : makes it an atom.  THE : MUST GO AT THE END 
   
   ["key.value":, "value"] <== the . would change things to a method send so you have to 
   
   
   keyword lists are preferred over maps because you can omit the braces for the last argument
   
   keyword lists can have the same key multiple times ; maps you cannot
   
   maps are easier to pattern match on so used more
   
   
   **COFFEE BREAK**
   
   
