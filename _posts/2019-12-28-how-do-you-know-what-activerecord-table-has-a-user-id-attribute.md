---
layout: post
title: How Do You Know What ActiveRecord Table Has a user_id Attribute?
category: rails
tags: ["rails", "active_record", "metaprogramming", "jumpstart"]
---
{:.center}
![IMG_0903.jpeg](/blog/assets/IMG_0903.jpeg)

Even though I'm a firm, firm believer in agile, I've recently been experimenting with a throwback to waterfall style development and it very quickly left me with a fully featured data structure of tables and relationships modeled as **example data**.  What I did is very rapidly write a series of migrations and then populate them to represent a sample "installation".  My goal with this approach was to play to my strengths -- data modeling -- and avoid getting tied down in user interface stuff (my weakness).

This was a very, very interesting approach and what I found was that I got much further along the lines of the "guts" of an application simply because I never got discouraged by:

> Oh Shite -- I know this should look good but I'm too much of a hoser to make it look good; I guess I'll put it aside and go watch TV

The downside to this is that I never bothered setting up the normal associations that you do when you write a migration; I simply thought about this application in terms of the example data:

* the users who would be using the system
* the data objects that they would create
* how the data objects would interact with each other

One of the things that I noticed when I started filling in the basics like "belongs_to :user" was that I kept constantly jumping between the class I was working on and the schema file.  Finally it hit me -- what I needed was a method that I could execute in the console that would tell me what classes had a user_id attribute.  And so I wrote a class called DataObject (for an ActiveRecord class which stores data) and a method .has_user_id.  What I was looking for was output that looked like this:


    > DataObject.has_user_id
    Initiative
    Yes - has a user_id field
    KeyResultOwner
    Yes - has a user_id field
    KeyResult
    Yes - has a user_id field
    ObjectiveOwner
    Yes - has a user_id field
    ObjectiveType
    Objective
    Yes - has a user_id field
    OkrTeamMember
    Yes - has a user_id field
    OkrTeam
    Yes - has a user_id field
    OrganizationGroup
    Organization
    Quarter
    ResponsibilityRole
    State
    Yes - has a user_id field
    User

Here's the entirety of the DataObject class:

```ruby
class DataObject
  def self.all
    [Initiative, KeyResultOwner, KeyResult, ObjectiveOwner, ObjectiveType, Objective, OkrTeamMember, OkrTeam, OrganizationGroup, Organization, Quarter, ResponsibilityRole, State, User]
  end
  
  # DataObject.has_user_id
  def self.has_user_id
    DataObject.all.each do |klass|
      puts klass.name
      inst = klass.new
      if inst.respond_to?(:user_id)
        puts "Yes - has a user_id field"
      end
    end
    nil
  end
end
```

You'll notice the self.all class method returns a list of classes specific to my application.  These are the classes that actually make up the business logic.  I needed to NOT pull all classes in the application because I built this on top of a new framework, JumpStart Pro (see next section). JumpStart Pro has a bunch of its own classes for things like Credit Cards, Charges, etc.  I only wanted to focus on the classes that I implemented; hence the .all method.

In order to use this, all I need to do is go into a console, which I **always, always** have open anyway (Thanks Jared) and then type DataObject.has_user_id and I'll get a print out similar to the above list.  Using this I was able to much more easily move from class to class and add in my *belongs_to user* relationships.

**Note**: It took about 3 to 4 times longer to write this blog post than it did to write this class.

## Sidebar: GoRails JumpStart

Given that my weakest skill is user interface, I chose, right from the start, to build this on top of [GoRails' JumpStart Pro](https://jumpstartrails.com/) product which is a framework for building Rails app and giving you a solid set of underpinnings for a SAAS app.  I've been ridiculously happy so far with JumpStart Pro.  Here's an example of the high quality user interface I've seen from it:

{:.center}
![okrsnow01_edited.png](/blog/assets/okrsnow01_edited.png)

{:.center}
![okrsnow02_calendar.png](/blog/assets/okrsnow02_calendar.png)

This last image, the drop down calendar, I did zero work to get that to appear.  All I did was change the field type from a text field to a date field:

```html
  <div class="form-group">
    <%= form.label :date_end_at %>
    <%= form.date_field :date_end_at, placeholder: "When Do You Need to Complete This?", autofocus: true, class: "form-control" %>
  </div>
```

I will fully admit that I don't actually know if this drop down comes from JumpStart Pro or from Rails 6 and the new form with style forms but, **damn** is it sexy as hell to get a drop down calendar without ever doing a damn thing.  Here's what I said to my wife as I discovered this in the car on the way home from seeing Trans Siberian Orchestra:

> Man that's sexy.  I think I'm more than a bit hard ...

JumpStart Pro -- Absolutely recommended.