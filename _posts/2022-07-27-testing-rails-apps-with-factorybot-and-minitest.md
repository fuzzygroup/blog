---
layout: post
title: Testing Rails Apps with FactoryBot and MiniTest
date: 2022-07-27 06:58 -0400
category: rails
tags: ["rails", "testing"]
---
{:.center}
![Pizza](/blog/assets/pfu/DSC01119.JPG)

{:.center}
Pizza courtesy of Pizza for Ukraine!

{:.center}
[Donate Now to Pizza for Ukraine](https://www.pizzaforukraine.com/)


This blog post looks at testing rails apps with [FactoryBot](https://github.com/thoughtbot/factory_bot_rails) and MiniTest -- the default test framework which ships with Rails.  It does not use RSpec and RSpec is NOT required for use with FactoryBot.

**Note**: I believe that MiniTest is the name of the standard rails testing framework.  Oddly I've had issues confirming that so if I'm wrong please feel free to tell me.

## Creating a Factory

A factory is a pluralized file just as is a fixture.  Factories live, generally, in the test/factories/ directory.  Let's say that you were modeling swimming pools.  You might have this factory:

```ruby
FactoryBot.define do
  factory :pool do
    user 
    water_chemistry_type
    name { "Swimming Pool" }
    pool_type { "pool"}
    length {38}
    width {18}
    units { "feet"}
    volume_units {"gallons"}
    shallow_end_depth { 3}
    deep_end_depth {7.67}
  end    
end
```

What the above code says:

1. Define a factory named :pool
2. Reference two other models - user and water_chemistry_type
3. Have a bunch of attributes that define the pool

## Creating Two Specific Factories

The power of something like FactoryBot comes, however, not when we have a single instance of anything but when we have multiple instances that we can use to test different scenarios.  

Let's say that I have both a pool and a hot tub.  Those have commonalities but also differences.  We can model those difference as *traits*.

```ruby
FactoryBot.define do
  factory :pool do
    user 
    water_chemistry_type
    trait :swimming_pool do 
      name { "Swimming Pool" }
      pool_type { "pool"}
      length {38}
      width {18}
      units { "feet"}
      volume_units {"gallons"}
      shallow_end_depth { 3}
      deep_end_depth {7.67}
    end
    trait :hot_tub do
      name {"Hot Tub"}
      pool_type  {"hot_tub"}      
      length { 6 }
      width { 6 }
      units { "feet"}
      volume_units { "gallons" }
      depth { 3 }    
    end
  end  
end
```

What this does is:

1. Create a pool factory 
2. With two common attributes - user and water_chemistry_type
3. Add a trait named "swimming" pool which defines the attributes for a swimming pool.
4. Add a trait named "hot_tub" which defines the attributes for a hot tub

## A General Suggestion for all Models

In the recent past (or future; perhaps that blog post hasn't come out yet), I noted that Rails applications are like finely tuned Swiss watches -- they are literally that precise a collection of **mechanisms**.  What I have found is that if you want to test effectively inside a Rails app, you need to first guarantee that you don't have problems elsewhere such as:

* fixtures
* foreign key dependencies
* any of a hundred other things

What I always recommend is that you instrument your classes with two methods that should NEVER be able to fail:

```ruby
def self.foo
  "bar"
end

def foo
  "bar"
end
```

And then you have a matching set of tests like this:

```ruby
test "it should return bar when foo is called for a pool" do
  pool = FactoryBot.create(:pool)
  assert_equal pool.foo, "bar"
end

test "It should return bar when called on a class method" do
  assert_equal Pool.foo, "bar"
end
```

What testing many, many hundreds of thousands of lines of Rails code has taught me is that if the above two tests work then you can safely test your Rails app without crazy weirdness.

## Testing an Instance Method with a Factory

Here is a simple example of testing an instance method with a factory:

```ruby
test "it should return bar when foo is called for a pool" do
  pool = FactoryBot.create(:pool)
  assert_equal pool.calculate_volume, 21000
end
```

## Testing a Class Method with a Factory

This subheading is basically here for symmetry -- you generally wouldn't test a class method with a factory since the class method should be running without the instance data.

You could, however, take the object that results from a FactoryBot factory and use it just as you use any Rails app as it will respond to dot methods just as everything else does.

## Avoiding Foreign Key Errors

To [avoid foreign key errors](https://stackoverflow.com/questions/71054865/tips-for-debugging-fixture-foreign-key-errors-in-rails) you can do this:

    cat config/application.rb
    require_relative "boot"

    require "rails/all"

    # Require the gems listed in Gemfile, including any gems
    # you've limited to :test, :development, or :production.
    Bundler.require(*Rails.groups)

    require "jumpstart"

    #module PoolWizard
    module JumpstartApp
      class Application < Rails::Application
        # Initialize configuration defaults for originally generated Rails version.
        config.load_defaults 7.0
        
        ...
        
        config.active_record.verify_foreign_keys_for_fixtures = false
      end
    end
    

Whether this is good or bad is left as an exercise for the programmer.  I will comment, however, that this error message:

    rails test test/models/pool_test.rb:47

    E

    Error:
    PoolTest#test_it_should_return_bar_when_foo_is_called_for_a_pool:
    RuntimeError: Foreign key violations found in your fixture data. Ensure you aren't referring to labels that don't exist on associations.
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/fixtures.rb:633:in `block in insert'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/fixtures.rb:621:in `each'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/fixtures.rb:621:in `insert'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/fixtures.rb:607:in `read_and_insert'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/fixtures.rb:567:in `create_fixtures'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/test_fixtures.rb:271:in `load_fixtures'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/test_fixtures.rb:125:in `setup_fixtures'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activerecord-7.0.3.1/lib/active_record/test_fixtures.rb:10:in `before_setup'
        /Users/sjohnson/.rvm/gems/ruby-3.1.2/gems/activesupport-7.0.3.1/lib/active_support/testing/setup_and_teardown.rb:40:in `before_setup'

which not only tells you nothing about the error at hand but also backtraces into fixtures -- when you aren't using fixtures -- is utter balderdash and should be burned at the stake after first being stoned and then drowned.  A pox upon it -- is it any wonder that I simply routed it to /dev/null ? 

## See Also

* You should also see [my recent post on Testing](https://fuzzyblog.io/blog/rails/2022/06/05/back-to-rails-test-putting-rspec-in-the-rear-view-test-examples.html).
* [FactoryBot cheat sheet](https://devhints.io/factory_bot)