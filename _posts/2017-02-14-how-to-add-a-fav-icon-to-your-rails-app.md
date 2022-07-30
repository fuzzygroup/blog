---
layout: post
title: Rails in 10 Minutes - How to Add a Fav Icon to Your Rails App
category: rails
tags: ["rails", "hyde", "design", "user_interface", "ui", "rails_in_10_minutes"]
description: Adding a favicon to your Rails app means that people can use a link to your app by an easy to remember icon not just a name when they add it to their browser link bar.
image: http://fuzzyblog.io/blog/assets/browser_link_bar.png
---
{% pizzaforukraine  %}

I am a huge, huge believer in what are called "favicons".  These are the tiny icons that your web application declares to the world:

> "here's a visual representation of **this site** to use when someone creates a bookmark link to me on their browser link bar"

I know that sounds perhaps beyond nerdy but that's what they do.  I use a LOT of web sites and rely on them constantly so what I do is drag links from them to my browser link bar and when a fav icon exists it means I can use just an icon instead of text.  Here is, for right now, what my browser link bar looks like:

![browser_link_bar](/blog/assets/browser_link_bar.png)

Here's how to add a favicon to your Rails app.

1.  Come up with a favicon in either .ico or .png format.  I can't tell you which is better but I know that both of these work.
2.  Place that icon file in app/assets/images
3.  In your application.html.erb template in app/views/layouts you want to add this html snippet:

```ruby 
<%= favicon_link_tag asset_path('favicon.png'), :rel => 'icon', :type =>  'image/png' %>
```
or

```ruby 
<%= favicon_link_tag asset_path('farmer.ico'), :rel => 'icon', :type => "image/x-icon" %>
```

Do *add* / *commit* / *push* / *deploy* dance and check in production

**Note 1:** Once upon a time you had to always name these favicon.ico but that's no longer necessary as your html tells the browser what to look for.

**Note 2:** [Helpful Stack Overflow post I cribbed from](http://stackoverflow.com/questions/13827325/correct-mime-type-for-favicon-ico).

    

