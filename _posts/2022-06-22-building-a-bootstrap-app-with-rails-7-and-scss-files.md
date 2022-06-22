---
layout: post
title: Building a Bootstrap App with Rails 7 and SCSS Files
date: 2022-06-22 02:12 -0400
category: rails
tags: ["rails", "bootstrap", "sass", "scss"]
---
As is too often the case, I find that the initial aspect of getting a modern app (Bootstrap, Tailwind, React) initially setup to be the most **frustrating** aspect of Rails.  Given that I like to spin up new apps pretty regularly, well, I spend a lot of time being frustrated with an old man's grumbling of:

> It didn't used to be this hard.

No it wasn't this hard.  And while I still don't really understand asset compilation, I did recently put together a new app where I pulled in SCSS files using variables from a different app and I can start to see it.

This blog post walks through a Rails 7 app using .scss files.

## Step 1: Rails New

Here's your Rails 7 new command to generate a new app with Bootstrap:

    rails new scss_test1 --css bootstrap

Yep.  That's it.  Whoa!!!  There are also options to use Tailwind.  I found this technique in the Saeloun article linked below and I will be forever grateful; seriously -- *thank you*.

## Step 2: Add the Sassc-Rails Gem

I believe this Gem is needed as sassc support is officially deprecated.  But I might be wrong about this; front end stuff changes with every Rails release so if I'm wrong, well, sigh.

    gem "sassc-rails"

## Step 3: Copy In Your SCSS Files

If you are pulling in SCSS files then you need to copy them into your:

    app/assets/stylesheets 

directory.  They can exist elsewhere but that directory is for stylesheets so differing on this point confuses me.

## Modify Your Include Directives

This is the tricky bit and where you simply have to experiment.  The thing to understand is that asset compilation is just that -- compilation.If you're old school enough that you understand the analogy of your stylesheet files becoming akin to a make file with all the **dark magic** that entails, perhaps that helps.  In your stylesheets directory there will be an initial stylesheet file, for me, it was application_bootstrap.scss and then I had copied in a number of other stylesheet files like palette.scss, landing.scss, customized_bootstrap.scss and so on.  In my core application_bootstrap.scss was this:

    // system level; installed by rails
    @import 'bootstrap/scss/bootstrap';
    @import 'bootstrap-icons/font/bootstrap-icons';

Disclaimer: I added the comment to help my understand where things came from.

I then modified it to look like this:

    @import './customized_bootstrap.scss';
     
    // system level; installed by rails
    @import 'bootstrap/scss/bootstrap';
    @import 'bootstrap-icons/font/bootstrap-icons';
    
    @import 'palette.scss';
    @import 'landing.scss';    

Please note that the order matters -- this really is a make file and what you are doing is dealing with dependencies.  As an example there are are variables defined in some files that need to be imported before other files.  In my customized_bootstrap.scss file, which I pulled in from elsewhere and another CSS engine (vite), I had to make a bunch of changes like this:

    /**
     *  import the necessary Bootstrap files 
     */
    @import "../node_modules/bootstrap/scss/functions";
    @import "../node_modules/bootstrap/scss/mixins";
    @import '../node_modules/bootstrap/scss/variables';
    @import "../node_modules/bootstrap/scss/utilities";
    
    //@import "./node_modules/bootstrap/scss/_functions.scss";
    //@import "node_modules/bootstrap/scss/functions.scss";
    //@import "//node_modules/bootstrap/scss/variables";
    //@import "//node_modules/bootstrap/scss/utilities";

The commented out items where the initial state.

I also had to do this:

    @import "//landing";

I don't understand the use of // versus ,/  But it is all just path references and we are developers -- we can get this.  This was purely the desperate machinations of a developer with Stack Overflow access and the desire to make something work with an old app on the left and a new app on the right refreshing constantly until the two sites where in visual parity.  Typing this triggered a Quantum Leap memory "Hoping against hope that the next refresh would be the last".

## Conclusion

I won't claim to fully understand the asset pipeline but this is the closest I've gotten to understanding it.  In particular the analogy of a makefile for CSS very much helped me grok this.

## See Also

* [The Saeloun article](https://blog.saeloun.com/2021/11/17/rails-7-added-css-app-generator.html)
* [Useful Reddit Thread](https://www.reddit.com/r/rails/comments/pk7x5j/any_clue_what_with_cssscss_imports_in_rails_7/)
* [Stack Overflow 1](https://stackoverflow.com/questions/71231622/idiomatic-sass-processing-in-rails-7)
* [Asset Pipeline Overview](https://guides.rubyonrails.org/asset_pipeline.html)
* [Stack Overflow 2](https://stackoverflow.com/questions/68909199/invalid-css-value-error-while-customizing-bootstrap-5-colors-with-sass-3)
* [Bootstrap RFS](https://github.com/twbs/rfs/tree/v9.0.3#installation)
* [Stack Overflow 3](https://stackoverflow.com/questions/66642300/error-undefined-variable-in-rails-sass-compilation)
