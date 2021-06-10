---
layout: post
title: Implementing a Master Template and Bootstrap in Laravel 8
date: 2021-06-10 10:19 -0400
category: laravel
tags: ["laravel", "php"]
---
This blog post continues from my Hello World tutorial and adds a master layout that you can use to add a consistent HTML structure to all pages.  This is very similar, in a Rails context, to application.html.erb. 

## Step 1: Create a layouts Directory

In your application directory, start my creating the directory:

    mkdir resources/views/layouts

## Step 2: Create a master.blade.php Layout

In your application directory, create the layout file:

    touch resources/views/layouts/master.blade.php

## Step 3: Add the HTML Boilerplate

Start by adding to the master.blade.php file, your basic HTML stuff:

```html
<html>
<head>
  <title>
  </title>
</head>
<body>
</body>
</html>
```

## Step 4: Add Yield Directives

Just as in Rails, Laravel uses a yield directive during template processing to indicate where things go.  Here is the HTML boilerplate marked up using yield directives:

```html
<html>
<head>
  <title>
    @yield('title')
  </title>
</head>
<body>
  @yield('content')
</body>
</html>
```

These yield statements indicate that two named sections of stuff, title and content, will be inserted at their respective locations.

## Adding Bootstrap

Given that we have a master template, we can also use it to add Bootstrap to our Hello World app.  Go to the [Get Bootstrap](https://www.getbootstrap.com) site, click Getting Started, and copy the main CSS url.  And add it below as follows:

```html
<html>
<head>
  <title>
    @yield('title')
  </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
  @yield('content')
</body>
</html>
```

Now we need to add the JavaScript so scroll down in the above Get Boostrap page and copy the JavaScript script tag.  And add it below as follows:

```html
<html>
<head>
  <title>
    @yield('title')
  </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
  @yield('content')
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
```
## Using the Layout

In our previous tutorial, we had a view file called hello_index.blade.php.  We are going to modify that file as follows:

```html
@extends('layouts.master')
@section('title','Home Page')
@section('content')

<div class='container'>
  <div class='row'>
    <div class='col-md-12'>
      <h1>Hello World</h1>
    </div>
  </div>
</div>

@endsection
```

And let's create a second file to use the layout in:

    touch resources/views/about.blade.php

And here are the contents for about.blade.php:

```html
@extends('layouts.master')
@section('title','About Page')
@section('content')

<div class='container'>
  <div class='row'>
    <div class='col-md-12'>
      <h1>About</h1>
    </div>
  </div>
</div>

@endsection
```

## Adding a Route for the About Page

Add the following route to web.php:

    Route::get('/about', function() {
      return view('about')
      })

Check your routes with:

    php artisan route:list
    +--------+----------+----------+------+--------------------------------------------+------------+
    | Domain | Method   | URI      | Name | Action                                     | Middleware |
    +--------+----------+----------+------+--------------------------------------------+------------+
    |        | GET|HEAD | /        |      | Closure                                    | web        |
    |        | GET|HEAD | about    |      | Closure                                    | web        |
    |        | GET|HEAD | api/user |      | Closure                                    | api        |
    |        |          |          |      |                                            | auth:api   |
    |        | GET|HEAD | hello    |      | App\Http\Controllers\HelloController@index | web        |
    +--------+----------+----------+------+--------------------------------------------+------------+

## Testing This

Start the server with:

    php artisan serve

And then visit:

    https://localhost:8000/hello
    https://localhost:8000/about

And you should see the bootstrap derived layout in place.  Do a view source or look closely at the tab title and you should see the title variable set correctly.

## Moving Bootstrap Tags from the View to the Layout

As you look at the views above you likely noticed that the container divs are in the view rather than in the layout.  This can be addressed by changing the layout as follows:

```html
<html>
<head>
  <title>
    @yield('title')
  </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
  <div class='container'>
    <div class='row'>
      <div class='col-md-12'>
        @yield('content')
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
```

You will also need to remove the container divs from each of the views.  Here's an example for about:

```html
@extends('layouts.master')
@section('title','About Us')
@section('content')

      <h1>About Us</h1>

@endsection

``` 

## Conclusion

Overall Laravel blade templates are conceptually similar to Rails html.erb templates and hopefully this tutorial helps you see how to work with them.

## See Also

* I found [this YouTube video](https://www.youtube.com/watch?v=TopRrBdrQ4M) very helpful.
* [BootStrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
