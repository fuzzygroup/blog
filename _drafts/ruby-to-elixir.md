---
layout: page
title: Ruby to Elixir
category: elixir
tags: ["elixir", "elixir => ruby"]
---


What | Ruby / Rails | Elixir / Phoenix | Source | Notes |
| --- | --- | --- | --- |
ruby web server | bundle exec rails s | mix phoenix.server | phoenix book | iex -S mix phoenix.server (launch console w/ server running) |
load console / repl | bundle exec rails c | iex -S mix |
create migration | bundle exec rails g model User | mix ecto.gen.migration create_users | 
run migrations | bundle exec rake db:migrate | mix ecto.migrate | 
Rails.root in Phoenix | YourAppName.Endpoint.config(:root) | [Go](http://ugisozols.com/rails-root-equivalent-in-phoenix/) | |
Where migrations live | /db/migrate | 
