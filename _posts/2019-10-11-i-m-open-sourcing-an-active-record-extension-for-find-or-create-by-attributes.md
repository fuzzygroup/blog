---
layout: post
title: I'm Open Sourcing An Active Record Extension for find_or_create_by_attributes
category: rails
tags: ["rails", "ruby"]
---
{:.center}
![IMG_9460.jpeg](/blog/assets/IMG_9460.jpeg)

# Url
[https://github.com/fuzzygroup/ar_extension](https://github.com/fuzzygroup/ar_extension)
# Active Record Extension

This is an active record extension which adds two class methods to any ActiveRecord model:

## foo

This simply displays the text "Jam Baby Jam" to prove that it is working

## find_or_create_by_attributes

This can be used to create find or create instances of a class based on a hash of params and one or more required attributes.  Let's say that we have a class called Site.  It can be invoked in two ways:

```ruby
attributes = {
  name: "reddit",
  protocol: "https",
  domain: "reddit.com",
  url: "https://www.reddit.com/"
}

site = Site.find_or_create_by_attributes(attributes, name:)

site = Site.find_or_create_by_attributes(attributes, { name: "reddit", protocol: "http")

site = Site.find_or_create_by_attributes(attributes, [name:, protocol:])

```
## Installation Instructions

1.  Copy config/initializers/extension.rb to config/initializers in your Rails app, the config directory.
2. Copy lib/active_record_extension.rb to lib in your Rails app.

## Sidebar

This is really quite simple but I use it on almost every single project so I wanted to open source it so I can freely use it without worry about licensing.