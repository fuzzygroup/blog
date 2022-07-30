---
layout: post
title: The Ruby Safe Navigation Operator
category: ruby
tags: ["ruby"]
---
{% pizzaforukraine  %}

So I recently moved to running my Ruby code thru [RuboCop](https://github.com/rubocop-hq/rubocop) prior to each submission courtesy of the magic that is [Lefthook](https://evilmartians.com/chronicles/lefthook-knock-your-teams-code-back-into-shape).  I don't always fix everything that RuboCop detects but I tend to read thru the reports.  I'm using the "Boy Scout" approach to campsites, i.e. leave your campsite (code base) better than you found it, to at least make some of the changes each time.  

Note: To avoid the massive amount of errors that Rubocop detects via lefthook, I actually have the rubocop options in lefthook.yml commented out:

```yaml
#     rubocop:
#       tags: backend style
#       glob: "*.rb"
#       exclude: "application.rb|routes.rb"
#       run: bundle exec rubocop --force-exclusion {all_files}
```

and then I run the files individually using:

    rubocop -c .rubocop.yaml app/controllers/streaks_controller

Here was an interesting error that it just detected:

    app/controllers/streaks_controller.rb:43:7: C: Style/SafeNavigation: Use safe navigation (&.) instead of checking if an object exists before calling the method.
          s.activate if s
          ^^^^^^^^^^^^^^^

So what we have here is an ActiveRecord operation and then an if clause:

```ruby
  s = Streak.where(user_id: current_user.id, id: streak_id).first
  s.activate if s
```

The Safe Navigation operator, &, is designed to be a more concise approach to something like the try operator in that it avoids errors when a method is called on nil:

> As its name reflects, the safe navigation operator allows us to safely call a method on a object that can be nil, in the same way as try! does in ActiveSupport. In that regard, if the object is not nil, it sends the method to the object, returning nil otherwise. [Competa](https://www.competa.com/blog/ruby-safe-navigation-operator-methods/)

Using the safe navigation operator, the above code snippet can be written as:

```ruby
  s = Streak.where(user_id: current_user.id, id: streak_id).first
  s&.activate
```

This is one of those cases where I like the clarity of my original approach but the safe navigation operator does shorten up a coding paradigm that is almost everywhere in Ruby code.

## References

* [Reasons to Not Use Safe Navigation](https://www.theguild.nl/5-reasons-not-to-use-safe-navigation-operators/)
* [More on the Safe Navigation Operator](http://mitrev.net/ruby/2015/11/13/the-operator-in-ruby/)