---
layout: post
title: And Now For Starting Again with Elixir and Phoenix Not Elm
date: 2022-04-01 11:57 -0400
category: elixir
tags: ["elixir", "phoenix"]
---
In my last blog post, I dug into Elm and while I like a number of things conceptually about Elm, the process of implementing nothing more than a maybe 8 element HTML form left me hugely frustrated and annoyed.  I also didn't like the way that Elm bundles code and display into one thing.  I may be a traditionalist perhaps but the separation of views and code really does work well in practice.  I get that Elm is a different thing but it shouldn't be this hard to just put some text and an html form on the screen.

And, so, I'm putting Elm to the side for a bit and going to experiment with using Elixir and Phoenix for my previous Laravel application.  If nothing else this should be much more straightforward as it is moving from one MVC style framework to another albeit from an OO lang (php) to a functional lang (elixir).

## Step 1: Getting Up To Date

I'm on OSX and my goal was to get to the current Elixir and Phoenix before I started,  This I found to be surprisingly problematic.  And, perhaps, it was my fault as I don't claim to be great with HomeBrew.  I started with:

    brew update
    brew install elixir@1.12
		
But no matter what I did, I couldn't get past elixir 1.11.  So my next step was to get rid of everything.

### Getting Rid of Everything

I started with:

    brew uninstall elixir
		
And then I got a warning about a shallow copy issue which told me to run:

    git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
				
		brew update
		
		brew install elixir
		
which finally resulted in:

		❯ elixir -v
		Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

		Elixir 1.13.3 (compiled with Erlang/OTP 24)

### Installing Phoenix

A bit of googling gave me this command to install the newest Phoenix:

		mix archive.install hex phx_new

## Step 2: Generating a New App

Although I've actually been to ElixirCon, things have changed a lot in a few years.  Here's the new syntax for generating an app:

    mix phx.new kit_selector3 --database mysql

Normally I'd be using postgres which is the default for Elixir but I had an existing MySQL database hence the "--database mysql".

## Step 3: Setting Database Connection Parametters

The next step is to edit the file config/dev.exs and update the database connection parameters.

## Step 4: Using an Existing Database

The default for MVC style application development is to always assume that the database is entirely new.  In this case, however, I have an existing database and schema to work with of about 10 tables.  My general approach with this case is to actually implement the migrations needed for each table.  That allows the test environment to actually match the existing database.  The general trick with this is to use a technique which amounts to "don't_create_the_table_if_it_already_exists" type of create statement.

Here's my Laravel schema for my products table:

		<?php
    
		use Illuminate\Database\Migrations\Migration;
		use Illuminate\Database\Schema\Blueprint;
		use Illuminate\Support\Facades\Schema;
    
		class CreateProductsTable extends Migration
		{
		    /**
		     * Run the migrations.
		     *
		     * @return void
		     */
		    public function up()
		    {
		        Schema::create('products', function (Blueprint $table) {
		            $table->id();
		            $table->timestamps();
		            $table->integer('product_type_id');
		            $table->integer('product_style_id');
		            $table->integer('product_design_id');
		            $table->integer('product_colorway_id');
		            $table->string('image_front_path');
		            $table->string('image_back_path');
		            $table->string('image_left_path');
		            $table->string('image_right_path');
		            $table->string('team_name');
		            $table->string('team_number');
            
            
            
		        });
		    }
    
		    /**
		     * Reverse the migrations.
		     *
		     * @return void
		     */
		    public function down()
		    {
		        Schema::dropIfExists('products');
		    }
		}
    


And here's a generate statement:

    mix phx.gen.schema Product products product_type_id:integer product_style_id:integer product_design_id:integer product_colorway_id:integer image_front_path:string image_back_path:string image_left_path:string image_right_path:string team_name:string team_number:string
		
You should see output like this:

		===> Compiling telemetry
		===> Rebar3 detected a lock file from a newer version. It will be loaded in compatibility mode, but important information may be missing or lost. It is recommended to upgrade Rebar3.
		===> Compiling telemetry_poller
		===> Rebar3 detected a lock file from a newer version. It will be loaded in compatibility mode, but important information may be missing or lost. It is recommended to upgrade Rebar3.
		===> Compiling cowboy_telemetry
		==> phoenix_live_dashboard
		Compiling 40 files (.ex)
		Generated phoenix_live_dashboard app
		==> swoosh
		Compiling 38 files (.ex)
		Generated swoosh app
		==> phoenix_ecto
		Compiling 7 files (.ex)
		Generated phoenix_ecto app
		==> kit_selector3
		* creating lib/kit_selector3/product.ex
		* creating priv/repo/migrations/20220402134750_create_products.exs

		Remember to update your repository by running migrations:

		    $ mix ecto.migrate
				
Your generated migration is here:

    priv/repo/migrations/20220402134750_create_products.exs
		
and the migration looks as follows:

		defmodule KitSelector3.Repo.Migrations.CreateProducts do
		  use Ecto.Migration

		  def change do
		    create table(:products) do
		      add :product_type_id, :integer
		      add :product_style_id, :integer
		      add :product_design_id, :integer
		      add :product_colorway_id, :integer
		      add :image_front_path, :string
		      add :image_back_path, :string
		      add :image_left_path, :string
		      add :image_right_path, :string
		      add :team_name, :string
		      add :team_number, :string

		      timestamps()
		    end
		  end
		end
		
The trick here is to change the table creation from create table to:

		create_if_not_exists table(:thing)

 I found this trick in an [Elixir Forum post](https://elixirforum.com/t/best-practice-integrating-phoenix-with-existing-database/43341/6).  This needs to be done before the migration is executed with:
 
     mix ecto.migrate
		 
Now in my case, I failed to save my changed migration (the one with create_if_not_exists) before I ran the migrate command and I got this:

		❯ mix ecto.migrate
		Compiling 15 files (.ex)
		Generated kit_selector3 app

		09:51:50.157 [info]  == Running 20220402134750 KitSelector3.Repo.Migrations.CreateProducts.change/0 forward

		09:51:50.162 [info]  create table products
		** (MyXQL.Error) (1050) (ER_TABLE_EXISTS_ERROR) Table 'products' already exists
		    (ecto_sql 3.7.2) lib/ecto/adapters/sql.ex:760: Ecto.Adapters.SQL.raise_sql_call_error/1
		    (elixir 1.13.3) lib/enum.ex:1593: Enum."-map/2-lists^map/1-0-"/2
		    (ecto_sql 3.7.2) lib/ecto/adapters/sql.ex:852: Ecto.Adapters.SQL.execute_ddl/4
		    (ecto_sql 3.7.2) lib/ecto/migration/runner.ex:343: Ecto.Migration.Runner.log_and_execute_ddl/3
		    (ecto_sql 3.7.2) lib/ecto/migration/runner.ex:117: anonymous fn/6 in Ecto.Migration.Runner.flush/0
		    (elixir 1.13.3) lib/enum.ex:2396: Enum."-reduce/3-lists^foldl/2-0-"/3
		    (ecto_sql 3.7.2) lib/ecto/migration/runner.ex:116: Ecto.Migration.Runner.flush/0
		    (stdlib 3.17.1) timer.erl:166: :timer.tc/1
				
The take away here is that migrations will NOT overwrite existing tables.  That's the exact right design choice for Phoenix to have made and I'm glad to see it.

Saving the migration file and trying again gave:

		mix ecto.migrate
    
		09:59:44.609 [info]  == Running 20220402134750 KitSelector3.Repo.Migrations.CreateProducts.change/0 forward
    
		09:59:44.614 [info]  create table if not exists products
    
		09:59:44.616 [info]  == Migrated 20220402134750 in 0.0s
		
I then implemented migrations for the remaining tables.

## Generating Just a Controller 

The application I'm converting from Laravel to Elixir has a mildly unusual structure:

* There is one main controller, KitSelector
* It renders a view
* It isn't really a restful / CRUD style application
* A form is displayed, an order is created and then JavaScript sends it to Shopify

This means that I need to generate a non-restful controller without a ton of the default views.  This is something easily done in Rails but less easily done in Elixir.  Googling for answers didn't prove to be tremendously useful so this led to trial and error style experimentation.  Here was my first result:

		mix phx.gen.html KitSelector Cat cats --no-schema --no-context
		* creating lib/kit_selector3_web/controllers/cat_controller.ex
		* creating lib/kit_selector3_web/templates/cat/edit.html.heex
		* creating lib/kit_selector3_web/templates/cat/form.html.heex
		* creating lib/kit_selector3_web/templates/cat/index.html.heex
		* creating lib/kit_selector3_web/templates/cat/new.html.heex
		* creating lib/kit_selector3_web/templates/cat/show.html.heex
		* creating lib/kit_selector3_web/views/cat_view.ex
		* creating test/kit_selector3_web/controllers/cat_controller_test.exs

		Add the resource to your browser scope in lib/kit_selector3_web/router.ex:

		    resources "/cats", CatController
				
Yes I know that I don't have any Cat or cats in my application but I didn't find the online help, well, helpful:

		mix phx.gen.html --help
		** (Mix) Invalid arguments
    
		mix phx.gen.html, phx.gen.json, phx.gen.live, and phx.gen.context
		expect a context module name, followed by singular and plural names
		of the generated resource, ending with any number of attributes.
		For example:
    
		    mix phx.gen.html Accounts User users name:string
		    mix phx.gen.json Accounts User users name:string
		    mix phx.gen.live Accounts User users name:string
		    mix phx.gen.context Accounts User users name:string
    
		The context serves as the API boundary for the given resource.
		Multiple resources may belong to a context and a resource may be
		split over distinct contexts (such as Accounts.User and Payments.User).
		
Looking at the generated files led me to try this command:

    mix phx.gen.html KitSelector KitSelector kit_selector --no-schema --no-context
		
which had this result:


		** (Mix) The context and schema should have different names

		mix phx.gen.html, phx.gen.json, phx.gen.live, and phx.gen.context
		expect a context module name, followed by singular and plural names
		of the generated resource, ending with any number of attributes.
		For example:

		    mix phx.gen.html Accounts User users name:string
		    mix phx.gen.json Accounts User users name:string
		    mix phx.gen.live Accounts User users name:string
		    mix phx.gen.context Accounts User users name:string

		The context serves as the API boundary for the given resource.
		Multiple resources may belong to a context and a resource may be
		split over distinct contexts (such as Accounts.User and Payments.User).
		
Another try led to this:

    mix phx.gen.html General KitSelector kit_selector --no-schema --no-context
		
which had this result:

		mix phx.gen.html General KitSelector kit_selector --no-schema --no-context
		* creating lib/kit_selector3_web/controllers/kit_selector_controller.ex
		* creating lib/kit_selector3_web/templates/kit_selector/edit.html.heex
		* creating lib/kit_selector3_web/templates/kit_selector/form.html.heex
		* creating lib/kit_selector3_web/templates/kit_selector/index.html.heex
		* creating lib/kit_selector3_web/templates/kit_selector/new.html.heex
		* creating lib/kit_selector3_web/templates/kit_selector/show.html.heex
		* creating lib/kit_selector3_web/views/kit_selector_view.ex
		* creating test/kit_selector3_web/controllers/kit_selector_controller_test.exs

		Add the resource to your browser scope in lib/kit_selector3_web/router.ex:

		    resources "/kit_selector", KitSelectorController
				
Overall this feels pretty close to right and the views that aren't index.html.heex can simply be deleted with rm statements similar to:

    rm lib/kit_selector3_web/templates/kit_selector/edit.html.heex
		
although I actually chose to leave them in place.  Yes they are cruft but they may illustrate view techniques that I'll need to use.

Unfortunately when I went to test the application by starting the server, I got this result:

		mix phx.server
		Compiling 3 files (.ex)
		warning: variable "f" is unused (if the variable is not meant to be used, prefix it with an underscore)
		  lib/kit_selector3_web/templates/kit_selector/form.html.heex:1: KitSelector3Web.KitSelectorView."form.html"/1


		== Compilation error in file lib/kit_selector3_web/controllers/kit_selector_controller.ex ==
		** (CompileError) lib/kit_selector3_web/controllers/kit_selector_controller.ex:13: KitSelector3.General.KitSelector.__struct__/1 is undefined, cannot expand struct KitSelector3.General.KitSelector. Make sure the struct name is correct. If the struct name exists and is correct but it still cannot be found, you likely have cyclic module usage in your code
		
And that's where real life constraints got in the way of fun code explorations.