---
layout: post
title: Learning Phoenix from Sonny
category: elixir
tags: ["elixir", "elixirconf", "phoenix"]
---

# Overview
Below are my roughly stream of consciousness notes from [Sonny Scrogson's Taking off With Phoenix](https://github.com/scrogson/taking-off-with-phoenix/) class.  Sonny did a fantastic job on this class and he is to be absolutely commended for it.  Any errors below, and I know they exist, are mine not his.  He earned every bit of the applause he got.  Thanks to [Esteban](https://co.linkedin.com/in/esbanarango/en) for pushing me to post this publicly.  Some notes were omitted due to markdown conflicts; I'll get them up when I can.

# Update

My version of the class repo is here: [https://github.com/fuzzygroup/taking-off-with-phoenix](https://github.com/fuzzygroup/taking-off-with-phoenix)  I put JSJ in the code where there was something I thought important enough to remember.  Bear in mind that I'm still new to Elixir.

I added screenshots at the bottom for all of the screen shots showing errors / surprising things.  When you see big blanks that means that nothing was output.


# Quick Links:
* [Phoenix](http://www.phoenixframework.org)
* [Elixir](http://elixir-lang.org)
* [Phoenix Book](https://pragprog.com/book/phoenix/programming-phoenix)

# Examples of Mix Commands

Mix is the equvalent of bundler, the rails executable and rake:

* mix help \| grep phoenix.gen
* mix phoenix.gen.html User users name email inserted_at --no-model
* mix phoenix.gen.html Post posts title body:text user_id:references:users
* mix ecto.migrate
* mix phoenix.gen.json Post posts title body:text user_id:references:users
* iex -S mix
* mix help \| grep ecto
* mix ecto                 # Prints Ecto help information
* mix ecto.create          # Creates the repository storage
* mix ecto.drop            # Drops the repository storage
* mix ecto.dump            # Dumps the repository database structure
* mix ecto.gen.migration   # Generates a new migration for the repo
* mix ecto.gen.repo        # Generates a new repository
* mix ecto.load            # Loads previously dumped database structure
* mix ecto.migrate         # Runs the repository migrations
* mix ecto.migrations      # Displays the repository migration status
* mix ecto.rollback        # Rolls back the repository migrations
* mix ecto.gen.migration create_users
* iex -S mix Phoenix.server <== runs your application in console which gives you access to the running application


# Things I Learned

* where do migrations live: priv/repo

## Equivalencies to the Rails / Ruby World

* plug = rack (ruby) = ring (clojure) = adapter for web servers ; currently supported is Cowboy
* iex -S Mix <=== Rails Console
* Mix.env <== Rails.env
* config/config.exs = master config file
* dev.exs <== environment files like in config/deploy
* prod.exs <== environment files like in config/deploy
* deps - where your components; think vendor/gems

  



## Layers:

  * your code
  * erlang / elixir
  * OTP
  * Kernel & STDLIB
  * ERTS
  * Operating System
  
## Surprising
  
There are other flavors of languages on top of erlang:

  * lua
  * lisp
  * prolog
  
## Erlang VM

  * scheduler #1 - run queue
  * scheduler #2 - run queue
  * scheduler #3 - run queue
  
1 thread is run for every core on the machine (each scheduler above has a thread assigned to it)  

## Processes

  * lightweight units of concurrency
  * maintain state via recursion
  * communication via message passing
  
## Process

  * Stack   Heap
  * Mailbox
  * Links & Monitors (when you link to a process of the process dies then you die too) (and alert me when a process dies)
  * Garbage Collector  
  
## Isolated & Concurrent

  * Crashes are isolated
  * Data is isolated (GC per process)
  * Load balances on IO and CPU (efficient on multicore)
  
## OTP 

  * framework that makes it easy to deal with faults, concurrency and distribution
  * Where I want to build crawlers likely
  
## GenServers, Supervisors, Processes, Oh My!

  * GenServers are generic servers
  * supervisor - a process like any other that runs code specific to watching other processes
  
## Phoenix  
  
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
  
  
# Getting Stuff Built from Scratch
  
  * Install the archive https://github.com/phoenixframework/archives : goto bottom and click on it and get the url from the raw (actually get the url from the download button )
  * mix archive.install https://github.com/phoenixframework/archives/blob/master/phoenix_new.ez?raw=true  
  * mix help | grep phoenix
  * github.com/phoenixframework/phoenix/installer
  * mix help phoenix.new
  * mix phoenix.server
  
## Misc  
  
  Processing by Workshop.PageController.index/2 
  
  /2 is the "ARITY OF THE FUNCTION" arity = number of arguments that the function accepts
  
  
  2 top level directories - lib, web  The web directory is likely to go to lib down the road
  
  This is a list of two tuples:
  
  ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
   "ecto.reset": ["ecto.drop", "ecto.setup"],
   "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
   
   toople  <== correct pronunciation is toople (according to Sonny at least)
   
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
   
   (A few examples omitted here due to escaping issues; there's irony in that due to Tom Preston Warner's ruby orientation)
   **COFFEE BREAK**
   
# Building blocks
   
   (get from photo)
   
   
## Plug
   
   https://github.com/elixir-lang/plug
   
   At the core of phoenix
   
   a specification for constructing composable modules to build web applications.  Plugs are reusable modules or functions built to this specification
   
   Plugs can be written to handle almost anything form authentication to paramenter preprocessing and rendering
   
   Provides adapters to http servers which will ultimately deliver content to users
   
## Plug Specification
   
   * function plugs  - just a function 
   * modules plugs
   
### Function Plugs
   
* A function plug is any function that recieves a connection and a set of options and returns a connection.  Its type signatiure must be:
* (Plug.Conn.t, Plug.opts) :: Plug.conn.t
* Gets an empty list by default if no options]
   
### Function Plug Example

    def json_header_plug(conn, opts) do
      conn 
      |> put_resp_content_type("application/json")
    end
    
    Most of the applications I build now are like this - functions which transform state bit by bit
   
### Module Plugs   

A module plug is an extension of the function plug.  It is a module that must export:

* init/1 - takes a set of options and initializes it
* call/2 - takes the connection and options, returns the connections

The result report by init/1 is passed as a second argument to call/2

#### Module Plug Example

  defmodule JSONHeaderPlug do 
    import Plug.Conn
  
    def init(opts), do: opts
  
    def call(conn, _opts) do
      conn
      |> put_resp_content_type("application/json")
    end
  end
  
####  plug.conn is huge (look it up)

* missed it
  
####  Request Fields

* missed it


#### Fetchable Fields

* missed it


#### Response Fields

* missed it

#### Connection Fields

* missed it

### Plugs in Phoenix

* Endpoint
* Router
* Controllers

#### Endpoint

Endpoint is boundary of the app.  Where all requests flow (slide transition too fast)

#### Endpoint

plug Plug.Parsers, 
  parsers: [:urlencoded, :multipart, :json],
  pass: ["*/*"],
  json_decoder: Poison
  
...

#### Router

Provides a bunch of macors for generating routes that dispatch to specific controllers and actions.  Those macros are named after HTTP verbs.

defmodule Myapp.Router do 
  use Myapp.Web, :router

  scope "/", Myapp do
    get "/", PageController, :index
    resources "/rooms", RoomController do
    resources "/users", UserController
    end
  end
end  

####Router

this 

get "/", PageController, :index

compiles to this (showing full function definition)

defp match(conn, "GET", [], _) do
  conn
  |> Plug.conn.put_private(:phoenix_pipelines, [:browser])
  |> Plug.conn
  ...(omitted)
  
  
end

#### Router

mix task

mix phoenix.routes  

page_path get / 

### Pipelines

connection
|> endpoint
|> router
|> controller
|> send_resp


Router Pipelines

pipeline :browser do
  plug :accepts, ["html"]
  plug :fetch_session
  plug :fetch_flash
  plg
end

Now into the workshop!

# Ecto

mix help | grep ecto

* mix ecto                 # Prints Ecto help information
* mix ecto.create          # Creates the repository storage
* mix ecto.drop            # Drops the repository storage
* mix ecto.dump            # Dumps the repository database structure
* mix ecto.gen.migration   # Generates a new migration for the repo
* mix ecto.gen.repo        # Generates a new repository
* mix ecto.load            # Loads previously dumped database structure
* mix ecto.migrate         # Runs the repository migrations
* mix ecto.migrations      # Displays the repository migration status
* mix ecto.rollback        # Rolls back the repository migrations

mix ecto.gen.migration create_users

priv is an ERLANG thing and represents "files private to the application"

mix ecto.migrate

Repo is the ecto repository

Repo is in charge of sending the queries to the db

There could be a 1 week course on using ecto


Web is where all our phoenix specific stuff goes

model right now are business logic and WILL BE MOVING but for now are in web

In the future will be more small apps that are composed up to bigger apps

"dunder" means "__" (its short for double underscore)

in mix.exs you define the name Workshop (initial name to the directory structure)

Ecto does not have call backs

# Immutable Immutable Immutable !!!

Remember everything is immutable

%Ecto.Changeset{}
    #Ecto.Changeset<action: nil, changes: %{}, errors: [], data: nil, valid?: false>


    Workshop.User.changeset(%Workshop.User{})
    #Ecto.Changeset<action: nil, changes: %{},
     errors: [name: {"can't be blank", []}, email: {"can't be blank", []},
      password: {"can't be blank", []},
      password_confirmation: {"can't be blank", []}], data: #Workshop.User<>,
     valid?: false>
     
      Workshop.User.changeset(%Workshop.User{email: "foo@bar.com"})
     #Ecto.Changeset<action: nil, changes: %{},
      errors: [name: {"can't be blank", []}, password: {"can't be blank", []},
       password_confirmation: {"can't be blank", []}], data: #Workshop.User<>,
      valid?: false>
      
      h v (help on v)
      
      c = v(2)  (get the 2nd previous thing out of the history)
      
      
      if true, do: 1, else: 2
      
      if true do 
        1
      else
        2
      end
      
      quote do: 1 + 1
      {:+, [context: Elixir, import: Kernel], [1, 1]}   <== this is the AST internal to elixir (3 element tuple)
      
      quote do: if true, do: 1, else: 2
      
      {:if, [context: Elixir, import: Kernel], [true, [do: 1, else: 2]]}




https://hexdocs.pm/ecto/Ecto.html


Goal is that your web interface is separate from your domain logic

## Storage != Database

ETS = Erlang Table System

http://erlang.org/doc/man/ets.html


You can use ecto to handle data validations that ARE NOT a db

Wrap the form in an ecto changeset to allow signup for an ejabberd system

## View


view is a module that renders the template

~E is equivalent to .html_safe but it goes before not after

IT IS ALL ABOUT DATA STRUCTURES NOT GETTERS / SETTERS !!!!

## Changeset

Workshop.User.changeset


Workshop.Repo.get_by([email: "fuzzygroup@gmail.com"])

# Screenshots

This was the progress of error messages we all saw as we went thru the training.

{:.center}
![taking_on_phoenix_screen_01.png](/blog/assets/taking_on_phoenix_screen_01.png)

{:.center}
![taking_on_phoenix_screen_02.png](/blog/assets/taking_on_phoenix_screen_02.png)

{:.center}
![taking_on_phoenix_screen_03.png](/blog/assets/taking_on_phoenix_screen_03.png)

{:.center}
![taking_on_phoenix_screen_04.png](/blog/assets/taking_on_phoenix_screen_04.png)

{:.center}
![taking_on_phoenix_screen_05.png](/blog/assets/taking_on_phoenix_screen_05.png)

{:.center}
![taking_on_phoenix_screen_06.png](/blog/assets/taking_on_phoenix_screen_06.png)

{:.center}
![taking_on_phoenix_screen_07.png](/blog/assets/taking_on_phoenix_screen_07.png)

{:.center}
![taking_on_phoenix_screen_08.png](/blog/assets/taking_on_phoenix_screen_08.png)

{:.center}
![taking_on_phoenix_screen_09.png](/blog/assets/taking_on_phoenix_screen_09.png)

{:.center}
![taking_on_phoenix_screen_10.png](/blog/assets/taking_on_phoenix_screen_10.png)

{:.center}
![taking_on_phoenix_screen_11.png](/blog/assets/taking_on_phoenix_screen_11.png)

{:.center}
![taking_on_phoenix_screen_12.png](/blog/assets/taking_on_phoenix_screen_12.png)

{:.center}
![taking_on_phoenix_screen_13.png](/blog/assets/taking_on_phoenix_screen_13.png)

{:.center}
![taking_on_phoenix_screen_14.png](/blog/assets/taking_on_phoenix_screen_14.png)

{:.center}
![taking_on_phoenix_screen_15.png](/blog/assets/taking_on_phoenix_screen_15.png)

{:.center}
![taking_on_phoenix_screen_16.png](/blog/assets/taking_on_phoenix_screen_16.png)

{:.center}
![taking_on_phoenix_screen_17.png](/blog/assets/taking_on_phoenix_screen_17.png)

{:.center}
![taking_on_phoenix_screen_18.png](/blog/assets/taking_on_phoenix_screen_18.png)

{:.center}
![taking_on_phoenix_screen_19.png](/blog/assets/taking_on_phoenix_screen_19.png)