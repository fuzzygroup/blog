---
layout: post
title: Rails Form Technique - Using collection_select with Open Structs
category: rails
tags: ["rails", "open_struct"]
---
{:.center}
![IMG_0741.jpeg](/blog/assets/IMG_0741.jpeg)

I've written about Open Structs before:

* [Sorting](https://fuzzyblog.io/blog/ruby/2017/01/16/ruby-how-to-sort-an-open-struct.html)
* [Responding to Method Calls](https://fuzzyblog.io/blog/ruby/2020/02/09/when-you-need-a-ruby-data-structure-that-responds-to-method-calls-use-openstruct.html)

To review, an Open Struct is a hash like data structure that responds to dot methods (i.e. .id or .name).  I use these in a lot of different places and I just finished using them for a form [collection_select](https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_select) operation.  

The Rails collection_select form helper is really designed to work with database objects that you need to make pick lists from.  The canonical usage is like this:

```ruby
<%= form.label :project_id %>
<%= form.collection_select :project_id, current_user.projects.all, :id, :name %>
```

The expression current_user.projects.all is a list of all projects as an iterable ActiveRecord collection and what collection_select does under the hood is loop over the collection and call the .id and .name methods (.id is the value in the collection and .name is what's displayed).  And this works **great** -- until what you have to select isn't a database collection.  And that, dear reader, is where open structs come out to play!

Here's what I just did:

## Controller Side

```ruby
@contexts = []
@contexts << OpenStruct.new(id: "web_browser_on_computer", name: "Web Browser (Desktop Computer)")
@contexts << OpenStruct.new(id: "mobile_app", name: "Mobile App")
```

This defines an array of open struct objects.  And an array is an iterable collection just like the database collection so this implementation, despite being an entirely different underlying data structure, works just like the ActiveRecord collection based version.

## View Side

And here's the view side:

```ruby
<%= form.label :context %>
<%= form.collection_select :context, @contexts, :id, :name %>
```

## Appearance

Here's how this looks by default and then when dropped down:

{:.center}
![collection_select_open_struct01.png](/blog/assets/collection_select_open_struct01.png)

{:.center}
![collection_select_open_struct02.png](/blog/assets/collection_select_open_struct02.png)




