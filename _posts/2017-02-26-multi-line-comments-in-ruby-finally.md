---
layout: post
title: Multi Line Comments in Ruby - Finally
category: ruby
tags: ["ruby", "rails"]
description: I've wanted multi line comments in Ruby since, well, forever.  Sure this is /* and */ but it still works.
---
{% pizzaforukraine  %}

I've wanted multi line comments in Ruby forever and I just, thanks to [this Stack Overflow post](http://stackoverflow.com/questions/2989762/multi-line-comments-in-ruby), found out that they exist thanks to =begin and =end:

```ruby
=begin

A long comment
that spans two
lines

=end
```

Here's a practical example where I'm keeping an example of how to run an instance method on a class in an easy to use copy and paste fashion (copy it and just drop it in Rails console).

```ruby
=begin

url = "https://www.etsy.com/listing/253953555/tacos-tshirt-perfect-for-tacos-lover?ref=finds_l"
parser = Page.new(url)
parser.parse

=end
```

I'm a fan of keeping code snippets around for easy copy and paste so you can get back to stuff quickly and multi-line comments make that so, so much easier.  Sure, I'd prefer /* and */, but, honestly, this will make me happy.  Matz made a choice to not have multi-line comments and while I don't personally agree, long ago, I tied my 
