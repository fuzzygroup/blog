---
layout: post
title: Rails2Elixir - rake db:migrate
category: rails2elixir
tags: ["rails2elixir", "elixir"]
---
In the Rails world, rake db:migrate stands for "migrate the database and execute the latest migrations".  In the Elixir world the **mix** command fills the role that rake used to.  The equivalent in the Elixir world is:

    mix ecto.migrate
