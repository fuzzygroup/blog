---
layout: post
title: JavaScript and CSS Magic for the Rails Front End Challenged
category: rails
tags: ["rails", "javascript", "css", "images"]
---
I am, as I have often written, front end challenged.  I grew up on the Internet writing HTML long before JavaScript and CSS and there's that old aphorism about old dogs, new tricks... Happily, the people in my nerd life, offer to teach me a trick or two from time to time and, well, [Nick](https://www.nickjanetakis.com/blog/) came thru for me this morning so I thought I'd write it all down.

The problem at hand was a landing page for a SAAS app with screenshots where it was hard to read the text in the screenshots (think a dense, information packed dashboard).  Nick said to me "those should be zoomable; just [zoom.js](http://github.com/fat/zoom.js)".  I made my usual grumbles about being front end challenged but then realized that I was basically being a **winer** -- and I hate winers, so to work!

Zoom.js is a combination of CSS and JavaScript that makes an image clickable as a zoomable overlay onto the current page.  It is basically the same as [Medium.com](https://medium.design/image-zoom-on-medium-24d146fc0c20)'s image zooming which is a brilliant implementation (thank you Brad Birdsall and the whole Medium team).  And thanks to Github user [fat](http://www.github.com/fat/) who actually did the hard work on this.

It should be noted that Zoom.js is jQuery based which means that it won't work off the bat in Rails 5.1 without the gem 'jquery-rails' line being present in Gemfile.  

**Disclaimer:** I recognize that some of this isn't perfect.  Specifically this library is clearly packaged to be installed by gulp in an automated fashion but I've never had a lot of luck with gulp hence the use below of wget / curl.

# How to Add zoom.js to a Rails Application

Please note that jQuery has been a core Rails dependency for years and years so steps 1 and 2 likely aren't needed for you.

1. Add jquery to your Rails app if it isn't present.  Add jquery-rails to Gemfile:
> gem 'jquery-rails'
2. Require jquery in your application.js:
> //= require juery
3. Add the data-action=>"zoom" to your image_tag calls for any images you want to be zoomable like this:
> <%=image_tag("screenshot_dashboard.png", :class => "img-responsive", :alt => "a dashboard view", "data-action" => "zoom")%>
4. In your terminal, change into the app/assets/stylesheets directory:
> cd app/assets/stylesheets
5. Do a wget or curl on the url for the css.  I got this url by navigating the source tree down to zoom.css and then viewing the file and clicking the raw view:
> wget https://raw.githubusercontent.com/fat/zoom.js/master/css/zoom.css
6. Do a wget or curl on the url for the js.  I got this url by navigating the source tree down to zoom.js and then viewing the file and clicking the raw view:
> https://raw.githubusercontent.com/fat/zoom.js/master/js/zoom.js
7. Add the css and js to your application layout, application.html.erb, with two lines like these (obviously you need to add angle braces around them; my blogging tool eats the text if I show them, alas):
    
<p>link href="assets/zoom.css" rel="stylesheet"</p>
    
<p>script src="assets/zoom.js"</p>
  
