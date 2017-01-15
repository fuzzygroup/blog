---
layout: post
title: CS Tutorial 016 SQL Injection
---
# SQL Injection

Hey Student, 

SQL Injection can be confusing to understand but it is actually very, very simple.  Let's think about a simple web page which lets you search for something.  At the html level, this web page is going to look something like this:

    <html>
    <head>
    <title>Search</title>
    </head>
    <body>
    <form action="/search.php">
    <p>What do you want to search for?</p>
    <input type="text" name="q">
    <input type="submit">
    </form>
    </body>
    </html>
    
As you can see, what we've got here is a form with one input element called q and a submit button.  When the submit button is pressed, an HTTP get request is sent back to the server and given the back end url /search.php.

Let's consider this in the context of a PHP application.  If you were going to process this server side then you will have a variable called $_REQUEST["q"].  Now you might 