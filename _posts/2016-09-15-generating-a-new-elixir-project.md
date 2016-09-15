---
layout: post
title: Rails2Elixir - Generating a New Elixir Project
category: rails2elixir
tags: ["rails2elixir", "elixir"]
---
This is one of those things where there isn't a direct equivalent in the Rails world.  To generate a new Rails project you, of course, use: 

    rails new
    
But that brings in, well, Rails.  And all of the plethora of stuff that entails.  What if you just wanted to generate a standalone application say a page fetcher that talked to Redis and got back a url to fetch so you could store it away.  In that case you wouldn't want all of the whole Rails stack.  You might want say just redis or just rake but not everything.

As discussed previously, mix is the integrated version of rails, rake and bundler and that's what we're going to use:

    mix new page_fetcher

Now that will work but if you really want something reliable -- and if you don't, why would you bother with Elixir at all -- then you really want to add a supervision tree which makes this an OTP application.  OTP is the core Erlang libraries that related to building distributed, reliable code.  Here's how to do this:

    mix new page_fetcher --sup