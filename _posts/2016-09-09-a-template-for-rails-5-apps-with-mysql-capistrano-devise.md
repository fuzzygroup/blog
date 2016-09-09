---
layout: post
title: A Template for Rails 5 Apps with MySQL, Capistrano, Devise
category: rails
tags: ["rails", "devise", "mysql"]
---
Despite my recent focus on Elixir, I still make most of my money doing Rails.  Here's a template that [Dv](http://dasari.me/) and I put together yesterday for a modern Rails 5 app:

* Devise
* Bootstrap
* MySQL
* Capistrano
* Docker (not entirely finished yet but it is a start)

{:.center}
[GitHub Template for a new Rails App](https://github.com/fuzzygroup/baseline_devise_template)

Fork it, clone it, bundle install and the like.  Enjoy.  I've done this so many times recently that I thought it was better to do it once and then use that as a baseline moving forward.

Notes on Devise

If you're trying to understand Devise and how its changed in Rails 5 then you'll need these links:

  * [https://www.sitepoint.com/devise-authentication-in-depth/](https://www.sitepoint.com/devise-authentication-in-depth/)
  * [https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication](https://launchschool.com/blog/how-to-use-devise-in-rails-for-authentication)
  * [https://github.com/plataformatec/devise](https://github.com/plataformatec/devise)

Personally I have a love / hate relationship with Devise.  It always feels hard to get started (part of the reason I made a template) but I have huge respect for the degree of outstanding great work, love and care that [Platformatec](http://plataformatec.com.br/) put into it.