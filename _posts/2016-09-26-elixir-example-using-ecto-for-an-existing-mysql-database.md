---
layout: post
title: Elixir Example Using Ecto for An Existing MySQL Database
category: elixir
tags: ["elixir", "ecto", "mysql"]
---
My Elixir progress has slowed a bit as of late and the cause has mostly been Ecto.  I've been having a hard time wrapping my head around Ecto and I suspect the issue is over a decade of constant ActiveRecord usage.  So this morning I decided to read other blog posts and try and execute on them.  I settled on this one:

[http://geoffreylessel.com/2016/using-ecto-with-an-existing-mysql-database/](http://geoffreylessel.com/2016/using-ecto-with-an-existing-mysql-database/)

since it seemed to be exactly what I needed - wrap an Ecto interface around an existing database.  Unfortunately the author hadn't published everything and some of the details he glossed over were exactly what tripped me up.  Happily he was very responsive to email and while you should absolutely read his piece, here are the bare minimum steps to build this.  This application uses a Formula 1 racing database as a source of data to query.

Obviously adjust all the path statements and passwords and username to match your system.

# Download the Data

The source data can be downloaded from [here](http://ergast.com/mrd/db/).

# Create a Database

Use this:

    mysql -uroot -p -A
    create database f1_history

Load the data using:

    mysql -uroot -p f1_history < ~/Downloads/f1db.sql

# Build the App

You want to build a basic app with a supervisor tree as follows:

    mix new f1_history --sup

# Edit mix.exs

Here are the dependencies you need for deps.get:

    defp deps do
      [
        {:ecto, "~> 2.0"},
        {:mariaex, "~> 0.7"}
      ]
    end

# Edit config.exs

The config.exs file defines how you connect to the repo and should look as follows:

    config :f1_history, F1History.Repo,
      adapter: Ecto.Adapters.MySQL,
      database: "f1",
      username: "root",
      password: "",
      hostname: "localhost"
  
    config :f1_history, ecto_repos: [F1History.Repo]


# Edit f1_history.exs

Here is what f1_history.exs should look like.  This was the root of my issues:

    defmodule F1History do
      use Application
  
      def start(_type, _args) do
          import Supervisor.Spec, warn: false

          children = [
            supervisor(F1History.Repo, [])
          ]

          opts = [strategy: :one_for_one, name: F1History.Supervisor]
          Supervisor.start_link(children, opts)
      end
  
    end
    
Note that F1History.Repo needs to be one of the supervisor's children. This is critically important.

# Edit race.ex

The file race.ex defines a race "object" that we will be querying. Here's what that file looks like:

    defmodule F1History.Race do
      use Ecto.Schema

      @primary_key {:raceId, :id, autogenerate: true}
  
      schema "races" do
        field :year, :integer
        field :round, :integer
        field :circuitId, :integer
        field :name, :string
        field :date, Ecto.Date
        field :time, Ecto.Time
        field :url, :string
      end
    end
    
# Edit repo.ex

The file repo.ex needs to live in lib and looks like this:

    defmodule F1History.Repo do
      use Ecto.Repo,
      otp_app: :f1_history
    end    

# Ecto Actually Working

Go into console with iex -S mix and enter a query like the following:

    iex(1)> import Ecto.Query
    Ecto.Query
    iex(2)> F1History.Repo.one from race in F1History.Race, limit: 1

You should see something like this:

    12:53:09.469 [debug] QUERY OK source="races" db=39.4ms decode=0.1ms queue=0.1ms
    SELECT r0.`raceId`, r0.`year`, r0.`round`, r0.`circuitId`, r0.`name`, r0.`date`, r0.`time`, r0.`url` FROM `races` AS r0 LIMIT 1 []
    %F1History.Race{__meta__: #Ecto.Schema.Metadata<:loaded, "races">, circuitId: 1,
     date: #Ecto.Date<2009-03-29>, name: "Australian Grand Prix", raceId: 1,
     round: 1, time: #Ecto.Time<06:00:00>,
     url: "http://en.wikipedia.org/wiki/2009_Australian_Grand_Prix", year: 2009}
 
 
# Get The Whole Thing

A full git repo of everthing is [here](https://github.com/fuzzygroup/f1_history).