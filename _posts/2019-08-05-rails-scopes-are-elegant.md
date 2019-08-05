---
layout: post
title: Rails Scopes are Elegant
category: rails
tags: ["rails", "database"]
---
This post is obvious to any advanced Rails user (hell even any middling Rails user) but I know there are some readers who aren't that sophisticated so here goes. 

A scope is a Rails database query that operates much like a class method only it is much, much simpler to define.  Here's a class method that finds the active elements in a table called habits:

    def active
      Habit.where(active: true)
    end
    
Now that's not bad but a Rails scope looks like this:

    scope :active, -> { where(active: true) }
    
But the real benefit here is that scopes are **chainable** so they can be inserted into an overall "query pipeline" where you can easily extend things.  In my case I had a site listing habits and I realized that habits needed a state of active (if it was true it should be displayed and if it was false then it shouldn't be).  Here was my initial view code:

    <%plan.habits.each do |habit|%>
      <li><%=link_to(habit.name, habit_path(habit))%></li>
    <% end %>
    
Once I had the scope defined then all I had to do was this:

    <%plan.habits.active.each do |habit|%>
      <li><%=link_to(habit.name, habit_path(habit))%></li>
    <% end %>
    
And **blammo** I had an active list of habits.  

Now let's carry the example further and let's say that you want a list of habits sorted by name. You can define a scope called ordered_by_name like this:

    scope :order_by_name, -> { order("name ASC")}

and the scope into your view like this:

    <%plan.habits.active.order_by_name.each do |habit|%>
      <li><%=link_to(habit.name, habit_path(habit))%></li>
    <% end %>    

And it will be sorted by name, easy peasy.  Now I've used scopes for **years** (prior to their current syntax actually) but their elegance has never struck me in quite the same way.  Perhaps it is just Monday ...

## More on Rails Scopes:
* [api.rubyonrails.org](https://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html)
* [Scopes or Class Methods](https://www.justinweiss.com/articles/should-you-use-scopes-or-class-methods/)
* [Named Scopes](https://medium.com/le-wagon/what-are-named-scopes-and-how-to-use-them-rails-5-5a0444d8b759)