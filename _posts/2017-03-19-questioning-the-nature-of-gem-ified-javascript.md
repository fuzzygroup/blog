---
layout: post
title: Questioning the Nature of Gem'ified JavaScript
category: rails
tags: ["rails", "javascript", "d3"]
description: Messing about with Rails and d3 makes me question the very nature of gems that wrap JavaScript libraries.
---
In 2017 you can't be doing web development and not at least be doing some JavaScript.  I bloody well hate JavaScript and even I'm dipping my toe into the JS water.  Way, way, way back in the mid 90s I got very badly burned by JavaScript compatibility issues and I've never looked back but it is time.  So I've been mucking about with d3 and it has been a hellish weekend indeed.  When I learn a new technology I like to start with the simplest possible example so I started with the [Overfitted Rails / D3 example](http://www.overfitted.com/blog/?p=302) because its only about 10 files total.  And this example works perfectly in Rails 4.2.  Kudos to the author.  Now while it works perfectly in Rails 4.2, it entirely fails to render the world's simplest bar graph in [Rails 5](https://github.com/fuzzygroup/rails5_d3_seed) and nothing I do makes it work.  This has the feel of some type of "Rails Magic" that changes from 4 to 5 so something that was implicit is now explicit and Ghu only knows what the *censored* it is.  I've put probably 3+ hours into making this example work and I'm now at the point of wanting to take a hammer to a Macbook -- clearly time to move on.  

The saddest part of all this is that the author of the overfitted example is clearly a bright, bright guy as based on his [Stack Overflow profile](http://stackoverflow.com/users/1583239/qwwqwwq) - top 12%, better than [me](http://stackoverflow.com/users/409644/fuzzygroup) certainly but there's no obvious way to contact him and no comments on his blog so, sigh...

My next stopping point on this d3 quest was [Greg Park's Adding a Live D3 Visualization to Rails](http://gregpark.io/blog/live-d3-rails-plot/).  This is a lot more complex than Overfitted but all the bits are there and [there's a full repo](https://github.com/gregoryjpark/live-d3-example).  So the first step was a quick fork so I could remove the postgres dependency.  An install showed that everything worked in Rails 4.  The moment of truth was to try it in [Rails 5](https://github.com/fuzzygroup/live-d3-example) -- and it worked brilliantly!  Thank you Greg!

I'm not a JS expert in any way -- it would more more accurate to say "I'm a self professed JavaScript hater who feels he has no alternative but to try and use it (finally)" so my first thought was "Why not use the [d3rails gem](https://github.com/iblue/d3-rails)".  Given that I had this in git, the path was clear:

* take my rails 5 exmaple
* make a branch
* delete the vendor/javascripts/d3.js file
* update gemfile and add d3-rails
* bundle install
* try the app and see if the graphs display

And, what do you know, the result was the same as my [Font Awesome issues recently](http://fuzzyblog.io/blog/css/2017/03/16/when-your-font-awesome-etsy-icon-doesn-t-display.html) -- the graphs didn't display.  This is really making me question gems that wrap JavaScript libraries.  I would be certain that the problem here is that something changed in d3 and d3-rails isn't current enough so something is broken.  But given that I've now hit this twice in the same week, it feels like either a CDN or vendor/assets/javascripts is the right approach for JavaScript inclusion.  Our historical method of wrapping JavaScript into gems for "inclusion" into the rails ecosystem is really feeling broken right now.  Thoughts?