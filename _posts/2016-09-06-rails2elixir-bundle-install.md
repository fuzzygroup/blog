---
layout: post
title: Rails2Elixir - bundle install
category: rails2elixir
tags: ["rails2elixir", "elixir"]
---
The command bundle install tells your ruby / rails application to read the Gemfile and install or update the components in Gemfile.  The elixir equivalent to Gemfile is mix.exs and the command to update it is:

    mix deps.get
    
A sample mix.exs file looks quite different from Gemfile.  Here's an example of just the **defp deps** method where the equivalent to gems are listed:

    defp deps do
      [{:mariaex, ">= 0.0.0"},
       {:ecto, "~> 2.0"},
       {:aws, "~> 0.2.0"}]
    end

    