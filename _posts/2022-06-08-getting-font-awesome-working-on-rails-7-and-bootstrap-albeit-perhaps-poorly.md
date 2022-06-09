---
layout: post
title: Getting Font Awesome Working On Rails 7 and Bootstrap albeit Perhaps Poorly
date: 2022-06-08 13:27 -0400
category: rails
tags: ["rails", "fontawesome"]
---
I am not a front end engineer -- but I'm on a project right now with heavy front end requirements.  This blog post documents how I got Font Awesome running on by application including the brands extension.  It is by no means a great way to do it and I know:

* I have more overhead than needed
* I did not take advantage of Rails 7 facilities in the best way
* This skips the gem so you lose another dependency from Gemfile
* I made this work and I sort of understand it but if you asked me to explain it, I think I'd fail the class.  Today I wanted to do nothing more than display a github icon.  And it does that.

Still this works and it is conceptually simple.

1. Download Font Awesome Locally and Decompress It.  This requires an [account](https://fontawesome.com/account) I think.
2. Move stylesheets/all.css to app/assets/stylesheets/
3. Move webfonts (directory and all) to public/ (yes public)
4. Add **//= link all.css** to manifest.js
5. In config/initializers/assets.rb add: **Rails.application.config.assets.paths << Rails.root.join("assets/webfonts")** (yes that isn't the right path but it still works; who knows???)
6. In application.html.erb you need to make one change.

This code:

    <%= stylesheet_link_tag "all"%>

Here's an example of the html to use to generate a font:

    <i class="fas fa-github"></i>
    <i class="fas fa-camera"></i>

## See Also

Here are links to what guided me along this path:

* [Font Awesome Search Engine for Icons](https://fontawesome.com/search?q=time&s=brands%2Csolid)
* [Self Hosting Documentation for Font Awesome](https://fontawesome.com/v5/docs/web/setup/host-font-awesome-yourself)
* [Thoughts on Web Fonts and Rails](https://gist.github.com/anotheruiguy/7379570)
* [Stack Overflow 1](https://stackoverflow.com/questions/70526113/how-to-use-bootstrap-icons-with-rails-7-0)
* [Font Awesome 5 Download Page](https://fontawesome.com/v5/download#v5-15-4)
* [Stack Overflow 2](https://stackoverflow.com/questions/49328750/font-awesome-5-brand-icons-not-working)
* [Font Awesome Cheatsheet](https://fontawesome.com/v5/cheatsheet/free/brands)
* [Installing ImportMap for Rails](https://github.com/rails/importmap-rails)
* [Import Maps and Font Awesome and Rails](https://pablofernandez.tech/2022/03/12/using-font-awesome-6-in-a-rails-7-project-that-uses-importmaps/)
* [Stack Overflow 3](https://stackoverflow.com/questions/71430573/can-font-awesome-be-used-with-importmaps-in-rails-7)
* [Discussion](https://discuss.rubyonrails.org/t/using-fontawesome-6-with-stimulus-rails-7/80024)
* [SVG and JS and Font Awesome](https://fontawesome.com/docs/web/use-with/rails-turbolinks)

But keep in mind that none of the above worked.
