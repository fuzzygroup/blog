---
layout: post
title: Rails2Elixir - rails g migration something_to_change
category: rails2elixir
tags: ["rails2elixir", "elixir"]
---
In the Rails world, rails g migration something_to_change means  db:migrate stands for "migrate the database and execute the latest migrations".  In the Elixir world the **mix** command fills the role that the rake and rails executables used to.  The equivalent in the Elixir world is:
    
    mix ecto.gen.migration something_to_change
