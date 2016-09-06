---
layout: post
title: Rails2Elixir - rails c
category: rails2elixir
tags: ["rails2elixir", "elixir"]
---
rails c, the Rails Console, is one of those canonical things in the rails world - it launches the rails console with all your objects loaded.

The elixir equivalent to this is:

    iex -S mix
    
This compiles your project and is a great way to quickly test your code.  If the console comes up then you don't have any syntactic errors 

Just as, in the Rails world, you can run irb, you can also just run iex:

    iex

This won't compile anything and its a fast way to test basic elixir snippets.