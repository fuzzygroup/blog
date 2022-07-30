---
layout: post
title: Restart ID sequences in Postgres on Truncation
category: sql
tags: ["sql", "postgres", "rails"]
---
{% pizzaforukraine  %}

**Note**: This is from a real world thing that I'm about to release.

Like a lot of database apps in the world, mine generally tend to use auto incrementing ids for object identifiers.  An object identifier is a value in a system which uniquely identifies something.  Let's say you have a url like this:

    http://localhost:3169/locations?country_id=91    

What that is saying, under the hood, is "Get the data from the locations store and give me the object with id value 91".  The thing that I'm currently building is populated with a bunch of data which is coming from CSV files that I'm loading from the Internet and I need to wipe the data in the system every time it rebuilds.  Now when I say location store, I mean, in this case, a locations table in a Postgres database.  When you wipe the contents of a table in Postgres you end up with the next object in the table getting the last ID value plus 1.  

The secret is to add this snippet to your truncation routine:

    RESTART IDENTITY

or in full:

    TRUNCATE states RESTART IDENTITY    

And in Rails I have this implemented on all my core classes as:

```ruby
def self.truncate
  ActiveRecord::Base.connection.execute("TRUNCATE states RESTART IDENTITY")
end
```

Since this is a def self., think of it as a C style static thing.  By defining it this way, I can simply call it as State.truncate to eliminate all data in my states store (ok its is a table but it could be more complex) and restart my ID sequences.  And in cases it wasn't clear exactly why you want this, since I'm processing the same data files in Production as in Development, my bookmarks become consistent allowing easier debugging.