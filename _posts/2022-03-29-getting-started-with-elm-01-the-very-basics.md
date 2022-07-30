---
layout: post
title: Getting Started with Elm 01 - The Very Basics
date: 2022-03-29 08:58 -0400
category: elm
tags: ["elm"]
---
{% pizzaforukraine  %}

Elm is an interesting new front end language technology based on a functional language that generates JavaScript transparently and has a focus on great documentation and ease of learning.  [A good starting point is the Guide](https://guide.elm-lang.org/install/elm.html).

In this blog post, I'm going to walk through the initial steps.  Along the way I'll draw some comparisons to things like Rails or Laravel.  My goal in all this is re-implementing a recent project I built with a JavaScript front end and a Laravel back end.  I'll us the same Laravel back end to see how Elm stacks up.

## Installation

There is an installer for Elm [here](https://guide.elm-lang.org/install/elm.html) which installs the language and binds it to the elm terminal command.

## Sidebar: Trying Out Elm

There is an excellent online console for trying out Elm here: [https://elm-lang.org/try](https://elm-lang.org/try)

## Building a Project

I keep all my projects organized by their language type so I have a directory structure like:

~/code/elm

Within the elm directory you want to start by creating a project directory.  Mine is named kit_selector3:

    cd ~/code/elm
		mkdir kit_selector3

Once you have a project directory built then you want to to use the init command:

    elm init
		
Please note that this is very unlike Rails or Laravel which build the project directory when you use their equivalent of elm init (rails new kit_selector3 or composer create-project laravel/laravel kit_selector3).

This builds the bare minimum skeleton for an elm project which looks like this:

		.
		├── elm-stuff
		│   └── 0.19.1
		│       ├── Main.elmi
		│       ├── Main.elmo
		│       ├── d.dat
		│       ├── i.dat
		│       ├── lock
		│       └── o.dat
		├── elm.json
		└── src
		
The file elm.json is there to handle component installation.  

## Let's Add Bootstrap Support

Given that it is the 21st century and virtually anything we build needs to work nicely on a mobile phone, I generally start everything these days with Bootstrap.  Happily there is a [Bootstrap component for elm](http://elm-bootstrap.info/getting-started).  We can argue about CSS grids and such but Bootstrap, well, just plain works.  Here's how we get Bootstrap added to our "application" (right now there is so little that I kind of hesitate to call it an application).

    elm install rundis/elm-bootstrap
		
That's going to add the elm bootstrap component into elm.json.  If you were to look under the hood of elm.json (generally not recommended) then you'd find this new entry under dependencies as the last line:

    "dependencies": {
        "direct": {
            "elm/browser": "1.0.2",
            "elm/core": "1.0.5",
            "elm/html": "1.0.0",
            "rundis/elm-bootstrap": "5.2.0"
        },
				
With that added, we can now use bootstrap and this is going to expose just how very different elm is from, well, everything.  The first step is to create the Main.elm file in the src directory:

    touch src/Main.elm
		
Open Main.elm in your editor and modify it as follows:

		module Main exposing (main)

		import Html exposing (..)
		import Bootstrap.CDN as CDN
		import Bootstrap.Grid as Grid


		main =
		    Grid.container []
		        [ CDN.stylesheet -- creates an inline style node with the Bootstrap CSS
		        , Grid.row []
		            [ Grid.col []
		                [ text "Some content for my view here..."]
		            ]

		        ]
						
I don't claim to understand this particularly well but let's walk through it so I can make mistakes that a future blog post will laugh at.  I'll break it down line by line.

    module Main exposing (main).  
		
This is likely an overall namespace for the application.
 
    import Html exposing (..)
 
 This imports the overall Html component and exposes all elements.  If we just wanted to use certain elements then we could use something like: 
 
    import Html exposing (Html, button, div, text)
		
I find it curious that the top level Html element is there but not the body containing element.

    import Bootstrap.Grid as Grid
		
This pulls in the bootstrap grid element and sets it to the grid namespace.

    main =
		
I'm guessing that starts the use of the main namespace.

    Grid.container []
		
Here we see that indentation likely is semantic like Python (or just good convention; need to figure that out).  Not sure what the braces mean.

    [ Grid.col []
		                [ text "Some content for my view here..."]
		            ]
								
This clearly adds a column and then outputs a text node underneath it stating "Some content ...".

The indented style of the output and the lack of ending tags reminds me a lot of the Ruby HAML templating language.

## Viewing Your Result

To view your result, you use the reactor command:

    elm reactor
		
and that brings up http://localhost:8000/.  What you initially see is a filesystem viewer on your application and then if you click into src/Main.elm you can find your bootstrap application (and, yes, it really doesn't look like very much at present).

## Conclusion

This was very much a getting started post.  It really is too early for me to have any specific conclusions about elm but in my next post, I'll deconstruct the views for an existing Laravel application and move them over to elm.  I'll also have to figure out how to construct a back end api which replaces the normal template driven implicit rendering cycle common to an MVC style web application.