---
layout: post
title: Implementing Safe ActiveRecord Like Queries for Rails
category: rails
tags: ["rails", "activerecord"]
---
In any SQL based database, a like query is generally an SQL injection attack waiting to happen because the underlying sql statement looks like this:

```sql
SELECT id FROM posts WHERE name LIKE '%foo%'
```

**Note**: A 30 year old thank you goes out to InfoWorld and [Joe Celko](https://www.amazon.com/Joe-Celkos-SQL-Smarties-Programming/dp/0123820227) who beat into his reader's brains the concept of capitalizing SQL statements for better legibility.  Thank you Joe.

A seemingly solid [StackOverflow post](https://stackoverflow.com/questions/26094430/safe-activerecord-like-query) gives this recommendation:

```ruby
title = Model.arel_table[:title]
Model.where(title.matches("%#{query}%"))
```

Please note that Model needs to be replaced with the name of your table.  Let's say that our table was named Metric and we have a normal simple_form object for Metric coming into our Rails app with a parameter named q and we have a real world Rails app with a limit clause and pagination.  

Here's how this would look:

```ruby
@q = params[:metric][:q]
note = Metric.arel_table[:note]
@metrics = current_user.metrics.where(note.matches("%#{@q}%")).order("date_created_at desc").limit(@limit).page(params[:page])
```

So:

* @q represents the incoming query
* note represents the field in our Metrics table that we want to search agains
* @metrics is the collection of data returned by the search and the where clause is "note.matches("%#{@q}%")" to find any instances of the term @q within the note field