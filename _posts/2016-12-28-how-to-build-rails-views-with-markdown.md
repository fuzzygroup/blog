---
layout: post
title: How to Build Rails views with Markdown
category: rails
tags: ["rails", "markdown", "kramdown", "hyde"]
---
So I'm starting prototyping on an all new thing and I want to be commercially successful out of the gate.  That's a bit different for me where I usually focus initially on the code.  This means thinking, from not just day 1 but hour 1, about how the customer sees things and for me that starts with two pages on the site:

* about
* faq

I would argue that for any web thing, an about page and a faq are at the core of your marketing.  And since both of these are content, I can't see the point of using straight erb or haml views when MarkDown is so damn easy.  I wouldn't use markdown for a page where there were forms or UI elements but for content?  Hell yes!

# How to Use Markdown for Rails Views

* In your Gemfile you need to call the [kramdown-rails gem](https://github.com/chrisroberts/kramdown-rails): gem 'kramdown-rails'
* Do the bundle install happy dance
* In your app/views/controller_name directory create your views with a .md extension

The kramdown-rails gem is a light wrapper around the core [kramdown gem](https://github.com/gettalong/kramdown) which does the markdown to html translation and supports using it in an Rails view context.

Just to be a good internet citizen I added the content of this answer to [StackOverflow on Rails Markdown](http://stackoverflow.com/questions/36957097/rails-4-how-i-use-the-contents-of-a-markdown-file-in-a-view/41362259#41362259).  If you have the time and like this then I'd appreciate an upvote.  Thanks!
