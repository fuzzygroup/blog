---
layout: post
title: Fixing FactoryBot Validation Name Has Already Been Taken Controller Test or Spec Errors
date: 2022-06-10 08:41 -0400
---
So, last night, whilst pulling vampire hours on writing tests -- always, always, always a bad idea -- I encountered multiple variants on this bug:

    ❯ bundle exec rails test test/controllers/links_controller_test.rb:44
    Running 7 tests in a single process (parallelization threshold is 50)
    Run options: --seed 21798
    
    # Running:
    
    E
    
    Error:
    LinksControllerTest#test_should_get_edit:
    ActiveRecord::RecordInvalid: Validation failed: Name has already been taken
        test/controllers/links_controller_test.rb:47:in `block in <class:LinksControllerTest>'        

This was particularly vexing because while the object in question did have a name attribute, it did not have name validations:

```ruby
#########################################################################
#
# validations
#
#########################################################################

validates_presence_of :project_id
validates_presence_of :team_id
validates_presence_of :account_id
validates_presence_of :link_type_id

```

There are a number of people on the internet that have this issue including [this stack overflow post](https://stackoverflow.com/questions/30927459/rspec-validation-failed-name-has-already-been-taken).  What I noticed as I researched this is that I only saw it in controller tests.  Also my model tests continued to function correctly without any validation issues.  I had initially discovered this while working on my RodAuth testing deep dive and back burnered it until I got past that particularly nasty kettle of fix.  

I was working with two objects, link and project and project only through an association.  So my Factory for link looked like this:

```ruby
FactoryBot.define do
  factory :link do
    url { "https://www.example.com/?time=#{Time.now.to_i}" }
    name { "Cartazzi App on development #{Time.now.to_i}" }
    active { true }
    association :account
    association :team
    association :project
    association :link_type
  end
end
```

You will notice the insane use of Time.now.to_i to try and generate more distinct data.  This was an attempt to see if maybe some kind of hidden validation was present (it is ruby and everything is dynamic; who knows where a monkey patch might lie).  But, as the problem persisted, I ruled out a data side issue.

One of the suggestions was to install database_cleaner and initiate it around each test.  And while I did install it and make some efforts, unsuccessful I think, in that direction, I did notice a change in my error message (and, no, I don't know what change made the message vary):

    ❯ bundle exec rails test test/controllers/links_controller_test.rb:45
    Running 7 tests in a single process (parallelization threshold is 50)
    Run options: --seed 17557
    
    # Running:
    
    E
    
    Error:
    LinksControllerTest#test_should_get_edit:
    ActiveRecord::RecordInvalid: Validation failed: Project type must exist
        test/controllers/links_controller_test.rb:48:in `block in <class:LinksControllerTest>'

Now I do have a project_type attribute but it is on the project model and not on the link model.  Still project is coming in from an association -- I wonder if I have project_type as an association on project?

```ruby
FactoryBot.define do
  factory :project do
    name { "Cartazzi" }
    association :account
    association :team
  end  
end
```

So a quick change:

```ruby
FactoryBot.define do
  factory :project do
    name { "Cartazzi" }
    association :account
    association :team
    assocation :project_type
  end  
end
```

And then, like magic, the failure is gone.