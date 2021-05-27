---
layout: post
title: Learning Laravel 8 from the Rails Perspective - Part 1
date: 2021-05-25 09:32 -0400
category; laravel
tags: ["rails", "laravel", "php"]
---
So after a decade and a half of living the Rails lifestyle, I find myself with a paying Laravel project in my lap and one on which I need to make haste.  As I have always done, I'm going to blog the learning process.

## First Step: Create a Laravel Application

I'm working off a tutorial on [Shopping Carts](https://webmobtuts.com/backend-development/creating-a-shopping-cart-with-laravel/).  I'm not covering the full details of the tutorial but more illustrating the commands.

I started by creating the application:

    composer create-project laravel/laravel shopping-cart

And then updating the .env file to have my database name and database password.

## Step 2: Generate a Model and Migration

My next step was to generate a model and add fields to it:

    php artisan make:model Product -m

## Problem 1: How do You Create the Database?

After I had a project created and generated a migration, I found myself wanting to run the migration:

    php artisan migrate

**Note**: php artisan is the equivalent of **rake**.

which failed due to a missing database error:

    SQLSTATE[HY000] [1049] Unknown database 'shopping_cart' (SQL: select * from information_schema.tables where table_schema = shopping_cart and table_name = migrations and table_type = 'BASE TABLE')

     at vendor/laravel/framework/src/Illuminate/Database/Connection.php:685
       681▕         // If an exception occurs when attempting to run a query, we'll format the error
       682▕         // message to include the bindings with SQL, which will make this exception a
       683▕         // lot more helpful to the developer instead of just the database's errors.
       684▕         catch (Exception $e) {
     ➜ 685▕             throw new QueryException(
       686▕                 $query, $this->prepareBindings($bindings), $e
       687▕             );
       688▕         }
       689▕

         +33 vendor frames
     34  artisan:37
         Illuminate\Foundation\Console\Kernel::handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))

I then spent quite a bit of time looking for an artisan command that would make the database.  This I was unable to find and then I realized "Wait a minute; I [built one thing](https://laravel-news.com/your-first-laravel-application) already; let me find that tutorial" which gave me this answer:

    mysql -u root -e'create database shopping_cart_development'
    
Yep.  A raw sql command.  Surprising.  

## Problem 2: .env versus database.yml

A key rails thing is that you have databases named _development, _test, _production (or at least that is the convention).  I made the mistake of thinking that Laravel added this postfix automatically so I set the base database name to "shopping_cart" in the .env file instead of "shopping_cart_development".  This caused my initial migration command to fail.  Once I updated the .env file, I got it to work:

    php artisan migrate
    Migration table created successfully.
    Migrating: 2014_10_12_000000_create_users_table
    Migrated:  2014_10_12_000000_create_users_table (21.08ms)
    Migrating: 2014_10_12_100000_create_password_resets_table
    Migrated:  2014_10_12_100000_create_password_resets_table (17.10ms)
    Migrating: 2019_08_19_000000_create_failed_jobs_table
    Migrated:  2019_08_19_000000_create_failed_jobs_table (15.70ms)
    Migrating: 2021_05_25_132002_create_products_table
    Migrated:  2021_05_25_132002_create_products_table (8.00ms)
    
**Note**: The tables other than products came in via some sort of laravel magic.  See, y'all, magic isn't just a Rails thing!

## Step 3: A Note on Seeding and Database

In order to make the seeding command work, I had to add the line:

    use DB;

to the top of ProductsSeeder.php after the namespace line to get around this error:

    Error

     Class 'Database\Seeders\DB' not found

     at database/seeders/ProductsSeeder.php:17
        13▕      */
        14▕     public function run()
        15▕     {
        16▕         //
     ➜  17▕         DB::table('products')->insert([
        18▕                    'name' => 'Samsung Galaxy S9',
        19▕                    'description' => 'A brand new, sealed Lilac Purple Verizon Global Unlocked Galaxy S9 by Samsung. This is an upgrade. Clean ESN and activation ready.',
        20▕                    'photo' => 'https://i.ebayimg.com/00/s/ODY0WDgwMA==/z/9S4AAOSwMZRanqb7/$_35.JPG?set_id=89040003C1',
        21▕                    'price' => 698.88

         +22 vendor frames
     23  artisan:37
         Illuminate\Foundation\Console\Kernel::handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))

And, yes, it took [Stack Overflow](https://stackoverflow.com/questions/64406855/laravel-8-class-database-seeders-db-not-found) to make that clear.  My suspicion is this was a change in how baseline includes are handled in Laravel.

## Step 3: Creating Controller and Views

The next step was to generate a controller and views using:

    php artisan make:controller ProductsController

Controllers are located in:

    app/Http/Controllers

and the base controller looks like this:

    <?php
    
    namespace App\Http\Controllers;
    
    use Illuminate\Http\Request;
    use DB;
    
    class ProductsController extends Controller
    {
        //
    }
    
I added the **use DB;** line to ensure that the database could be talked to.

At this point I added some stub code to the controller from the tutorial.  And then I had the start of .blade.php files which represent the views.  

## Problem 2: Where are the Views?

Laravel made an interesting choice in the location of view files.  In a rails app, view files are stored in:

    app/views
    
In a Laravel app, views are stored NOT in app/views but instead in:

    resources/views
    
This is surprising to me given the amount of code that tends to live at the view layer.  And, yes, I know that some frown on this but as a practical matter there is always code in the view layer and, to me, that makes views part of app.  But that's just an opinion on my part.

## Step 3: Views Continued

I started with three touch commands to create the baseline view views:

    touch resources/views/layout.blade.php
    touch resources/views/products.blade.php
    touch resources/views/cart.blade.php
    
The file layout.blade.php is the equivalent of a Rails layout.html.erb file and it has a similar structure:

* An HTML header
* A yield command where the result of the http transaction is inserted
* An HTML footer

Surprising to me is that the yield commands aren't in the:

    <?php
    ?>
blocks but instead:

    <div class="container page">
        @yield('content')
    </div>
    @yield('scripts')
    
## Step 4: Routes

The next step is to go into the routes file and define three routing actions:

    Route::get('/', 'ProductsController@index');
    Route::get('cart', 'ProductsController@cart');
    Route::get('add-to-cart/{id}', 'ProductsController@addToCart');
    
This is pretty similar to a Rails Route.  What this says is:

* For an index request i.e. foo.com, respond with the index action of the ProductsController/
* For The cart request, return the cart action of the ProductsController
* For an add-to-cart action, an id value is required and that should call ProductsController, the addToCart action

The routes file is located in:

    routes/web.php
    
It is interesting to me that Lavavel has multiple default routes files:

* api.php
* channels.php
* console.php
* web.php

## Step 5: Viewing the Result

Once again an artisan command comes into play in order to make this work:

    php artisan serve
    Starting Laravel development server: http://127.0.0.1:8000
    [Tue May 25 10:33:56 2021] 127.0.0.1:50702 [200]: /favicon.ico
    [Tue May 25 10:33:59 2021] 127.0.0.1:50707 [200]: /favicon.ico
    [Tue May 25 10:34:02 2021] 127.0.0.1:50709 [200]: /favicon.ico