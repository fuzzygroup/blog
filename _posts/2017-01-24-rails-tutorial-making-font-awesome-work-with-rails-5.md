---
layout: post
title: Rails Tutorial - Making Font Awesome Work with Rails 5
category: rails
tags: ["tutorial", "font_awesome", "hyde", "rails", "css"]
description: Font Awesome is a great toolkit for improving the look and feel of your app but can be tricky to use.  This tutorial shows you how.
image: http://fuzzyblog.io/blog/assets/font-awesome.png
---
{% pizzaforukraine  %}

Like a lot of back end folks I suspect I'm not alone when I look at a project like Font Awesome and go "Great Work; damn if I know how to actually use that."  I'd normally toss it over the wall to a front end guy like my buddy [Dv](http://dv2.dasari.me) but this is for my side project so I'm all alone on this one.  Since I really, really don't feel that I understand the world of front end work and CSS / SCSS very well I thought I'd write it all down for you (and myself).

# Here's what not to do

I took a number of wrong steps:

* I watched this [video](https://www.youtube.com/watch?v=RC_jIGABW-E) and it is really good -- except for the specific steps he gave me didn't work.  I really don't understand why and it might have been me.
* I used the [font-awesome-sass gem](https://github.com/FortAwesome/font-awesome-sass) and it too failed me hard.
* Don't follow the Stack Overflow post [here](http://stackoverflow.com/questions/37581599/rails-assets-is-having-issues-with-my-fonts).

In all of the above cases I got the error **No route matches [GET] "/assets/fontawesome-webfont.ttf"** and I just couldn't get past it.  The Stack Overflow post might have ultimately gotten me there but it did take me to a different gem -- font-awesome-rails discussed in the next section.

You should note that I don't meant to malign any of the urls in the above material -- I'm not a css / front end guy by any means.  All I did was some simple googles and the processes I was taken through ultimately didn't work and I blew over an hour of development time to find that out.

# Here's What To Do

What you actually need is to do the following:

1.  Install the [font-awesome-rails](https://github.com/bokmann/font-awesome-rails) gem.  Just add **gem "font-awesome-rails"** to your Gemfile and then do the bundle install dance.
2.  In your application.css.scss file add the line: **@import "font-awesome";**
3.  Stop and start your rails server.
4.  Add to a test .html.erb view file this line**: fa_icon "camera-retro" ** (you'll probably need to enclose that in output tags using %= and angle braces)
5.  Render that test .html.erb view file in your browser and you should see a camera icon.  What this is doing behind the scenes is outputting this html: <i class="fa fa-camera-retro"></i>

# Useful Resources

Here are some important urls:

* [The Icon Search Page for Font Awesome](http://fontawesome.io/icons/) - Use this to search for the icon you need.  This is the most useful page on their site.
* [Font Awesome Home Page](http://fontawesome.io/)
* [Font Awesome Rails Gem](https://github.com/bokmann/font-awesome-rails) - 
* [The Font Awesome Github Project](https://github.com/FortAwesome/Font-Awesome)
* [The Cheat Sheet](http://fontawesome.io/cheatsheet/)
* [Useful Example of Font Awesome at the HTML Level](http://stackoverflow.com/questions/12468359/using-font-awesome-icon-for-bullet-points-with-a-single-list-item-element)
* [Example of Using the Search Icon](http://fontawesome.io/icon/search/)
* [The General Examples Page](http://fontawesome.io/examples/)
* [The Getting Started Page](http://fontawesome.io/get-started/)
* [Another Way to Search for an Icon](http://glyphsearch.com/?query=x)
