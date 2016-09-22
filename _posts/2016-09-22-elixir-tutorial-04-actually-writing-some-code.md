---
layout: post
title: Elixir Tutorial 04 Actually Writing Some Code For Our Page Fetcher
category: elixir
tags: ["elixir"]
---
**Note:** I'm very much figuring this out on the fly and you're going to see stuff in here where you go "He's wrong!  He's flat out wrong!" and you might be right.  Heck you likely are right but keep reading because you'll see corrections coming later in the piece.  I started to rewrite it but I thought that actually seeing the process might be useful since so many of us are at the "want to use elixir but don't know how to get there" stage.

So we're now at the point of actually writing some crude, primitive code for our page fetcher.  Here's what this needs to do:

* connect to redis
* run in an infinite loop
* pop entries off a redis queue - entries will be a | separated chunk of data consisting of an id, a type and url
* fetch the data from the internet
* write it to a table based on the type (possibly; still thinking this thru as I write this out)

# An Infinite Loop Construct in Elixir

Connecting to redis should be pretty simple so this brings us to the next step - running in an infinite loop.  Classically I'd do that as a while(true) type control structure but this is Elixir and its functional.  A bit of digging brings me to this [Stack Overflow post](http://stackoverflow.com/questions/35364511/proper-elixir-otp-way-to-structure-an-infinite-loop-task) where it makes a pretty good argument for this type of thing:

    def fetch_pages() do
      # get redis 
      # pop off redis
      # tokenize the bits from redis into variables
      # fetch the page
      # save the page
      fetch_pages()
    end
    
And that would work nicely.  Since we're dealing with tail recursion we don't have to worry about blowing up the stack.  

As I look at this again I see clearly that connecting to redis should be taking out of the loop and the redis connection passed in since otherwise we're connecting repeatedly and that would be wasteful or just plain dumb.  But before we get there let's start with a simple question -- where does our code actually go?  Right now we have a very simple structure and we want to work within lib/page_fetcher.ex.  

If you open this file you'll find a basic module structure and a def start.  Let's add a def fetch_pages do / end block above the start routine and let's just add this one line within it:

    IO.puts "Calling fetch_pages"
    
Now that's not really good enough since it would be good to know that something is changing so why don't we display the current date and time?  Another quick trip out to the Internet gives us this [page](http://stackoverflow.com/questions/28594646/getting-the-current-date-and-or-time-in-elixir) and teaches us we can get the current date and time in Unix milliseconds with :os.system_time(:milli_seconds).  Now that's an Erlang primitive but Elixir runs on top of Erlang so it can call any and all of it easily.  So our new routine becomes this:

    def fetch_pages() do
      IO.puts("The fetch_pages/0 routine has just been called at #{:os.system_time(:milli_seconds)}")
      fetch_pages()
    end
    
You'll notice that string interpolation is actually the same as Ruby - #{} within a string.  That should make adapting to Elixir a bit easier.
    
Now we want to see this actually run and the next step for that is to load the console and run it interactively.  So do the normal dance:

    iex -S mix
    
And then enter:

    PageFetcher.fetch_pages
    
And you'll see a swath of lines like these:

    The fetch_pages/0 routine has just been called at 1474506164424
    The fetch_pages/0 routine has just been called at 1474506164424
    The fetch_pages/0 routine has just been called at 1474506164425
    The fetch_pages/0 routine has just been called at 1474506164425
    The fetch_pages/0 routine has just been called at 1474506164425
    The fetch_pages/0 routine has just been called at 1474506164425
    The fetch_pages/0 routine has just been called at 1474506164425
    
# Getting Our Redis Crap Together

Now that I'm at this stage I realize that I'm so used to using Redis using the Ruby primitives I've relied on for years that I'm a bit at a loss.  And this means what it always does a trip to the [documentation](https://github.com/artemeff/exredis)!  Here's our canonical test case for redis:

* connect
* push data in
* fetch it back

If we can do that then its really all we need.  Here's the code:

    {:ok, client} = Exredis.start_link
    push_result = client |> Exredis.Api.rpush("queue", "1|table|http://")
    pop_result = client |> Exredis.Api.rpop("queue")
    
What we're seeing here, to analogize it back to Ruby again, is that Exredis is the main "object" and then Api is a set of methods chained on top of it.  Yes I know that's not what is going on under the hood but this was an analogy.  
    
Technically since we're only popping from a queue we didn't have to know how to push stuff in but its the best way to test a queue based system and it is what I've been doing since the days of memcached to test any type of queue / key value store.

If we want to write a function to connect to Redis then this is going to bring up the issue of [returning something](http://stackoverflow.com/questions/37445838/returning-values-in-elixir), our redis client, from a method.  Since there is no explicit return statement, we simply need the client to be the last thing in our method so this should do it:

    def redis() do
      {:ok, client} = Exredis.start_link
      client
    end

Ideally there should be code to make sure we actually got back a valid client, failure handling, etc but we're just not there yet.

# A Quick Foray into String Parsing

We can finally get away from StackOverflow with a dive into the Elixir Lang docs to look up how to split out a string using [Split/3](http://elixir-lang.org/docs/stable/elixir/String.html#split/3).  This gives us:

    pop_result = client |> Exredis.Api.rpop("queue")
    "1|table|http://"
    iex(9)> parts = String.split(pop_result, "|")
    ["1", "table", "http://"]

So we can just use a String.split call with a | as the delimiter and that gives us back the result.

# Summary

This is the point where I need to get back to my day job but we've actually made some progress:

* We know where to put our code
* We know how to test our code in the console
* We know how to talk to Redis
* We know how to call Erlang functions from Elixir
* We know how to parse our fetched chunk of data into a data structure

Here's the plan:

* Next time we'll try and put this all together and actually fetch the page
* Next time + 1 we'll try and store the page to the database; that'll take us into Ecto
* Next time + 2 we'll try and get this running under OTP properly