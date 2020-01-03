---
layout: post
title: Ruby Testing Technique - The Power and Stupidity of def foo
category: rspec
tags: ["ruby", "rails", "testing", "rspec"]
---
{:.center}
![IMG_0736.jpeg](/blog/assets/IMG_0736.jpeg)

I had an abysmal day yesterday coding on my side project.  Ok -- coding on one of my side projects.  I had one of those days where you try to do something simple and NOTHING, NOT ONE DAMN THING, WORKS.  

**Note**: Every software engineer knows this type of day.  They aren't days that you talk about with anyone in your life because you spend hours failing at something that you know is so damn simple that, if you can't make it work, you should honestly give up software engineering and go cut grass for a living.  I refer to these days, when I have them, as spirit crushers / brain emasculators. And when they occur, I find that a nap (or a snickers bar) is the best medicine.

All I was trying to do was make a simple factory work.  For those who aren't deeply immersed in the world of software testing in ruby, a factory is a software method which creates a sample object that represents the actual object so it can be tested.  Factories are used in place of actual objects, generally, because they run faster.

Here was the definition of the factory:

```ruby
FactoryBot.define do
  factory :objective do
    name {Faker::Name.first_name}
    user
    organization
    objective_type
    okr_team
    quarter
  end
end
```

All this means is:

* Create an object named objective
* Give it a name attribute that is pulled from a library called Faker using the first_name method
* Give it a relationship back to the user object
* Give it a relationship back to the organization object
* Give it a relationship back to the objective_type object
* Give it a relationship back to the okr_team object
* Give it a relationship back to the quarter object

Although this might seem complex, it is actually drop dead simple and something that I've probably done hundreds if not thousands of times.  And yet, yesterday, all I could get was some variant on this *censored* backtrace:

    ActiveRecord::RecordInvalid:
      Validation failed: Organization must exist, User can't be blank, Organization can't be blank
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/generator/base.rb:91:in `persist'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/generator/base.rb:25:in `create'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/definition.rb:82:in `block in fabricate'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/definition.rb:81:in `instance_eval'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/definition.rb:81:in `fabricate'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabricate.rb:33:in `create'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication.rb:65:in `Fabricate'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/definition.rb:120:in `block in generate_value'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/attribute.rb:41:in `instance_exec'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/attribute.rb:41:in `execute'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/attribute.rb:29:in `processed_value'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/generator/base.rb:97:in `block in process_attributes'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/generator/base.rb:96:in `each'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/generator/base.rb:96:in `process_attributes'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/generator/base.rb:6:in `build'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/generator/base.rb:20:in `create'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/definition.rb:82:in `block in fabricate'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/definition.rb:81:in `instance_eval'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication/schematic/definition.rb:81:in `fabricate'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabricate.rb:33:in `create'
    # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/fabrication-2.21.0/lib/fabrication.rb:65:in `Fabricate'
    # ./spec/controllers/objectives_controller_spec.rb:20:in `block (4 levels) in <top (required)>'
    
I blew I don't know how much time on this in the early morning hours.  This is one of the problems with solo side projects -- you don't have anyone you can ask when you hit a blocker like this.  Finally, around 6 am, I threw my hands up, muttered a few choice words and then went back to bed.  

And now, 24 hours later, I find myself having solved this and it is through, what I will always remember as "The Power of Foo".  Here is what I did:

## Step 1: Implement class and instance methods called foo on User

Like a lot of classes in a Rails project that exist to simply support the database, I didn't actually have any methods in my User class.  Now, I would assume that this means that my class was was fine -- but what if it wasn't?  So I thought to myself -- what if the problem is something that I'm just not seeing?  And so I started to add a **stupid** method called foo to my user class both at the class level and the instance level:

```ruby
def foo
  'bar'
end

def self.foo
  'BAR'
end
```

This gave me something that I could test:

```ruby
describe '#foo' do
  it 'should return foo' do
    subject = FactoryBot.create(:user)
    expect(subject.foo).to eq 'bar'
  end
end

describe '.foo' do 
  it 'should return FOO' do
    expect(User.foo).to eq 'BAR'
  end
end
```

You will notice that my output between the two methods is different - 'bar' versus 'BAR' which I did deliberately to ensure that I'm not inadvertently calling a class method versus an instance method or vice versa.  And, happily, this worked perfectly.  Now, let's bring back our Factory definition for user:

```ruby
FactoryBot.define do
  factory :objective do
    name {Faker::Name.first_name}
    user
    organization
    objective_type
    okr_team
    quarter
  end
end
```

My next step was to implement this same approach on organization.  And then on objective_type.  And then on okr_team -- and that's where I hit a problem:

    ❯ bundle exec rspec spec/models/okr_team_spec.rb

    Randomized with seed 33038

    OkrTeam
      .foo
        should return FOO
      #foo
        should return foo (FAILED - 1)

    Failures:

      1) OkrTeam#foo should return foo
         Failure/Error: subject = FactoryBot.create(:okr_team)

         NoMethodError:
           undefined method `user=' for #<OkrTeam:0x00007ff431cfca88>
           Did you mean?  user_id=
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/attribute_assigner.rb:16:in `public_send'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/attribute_assigner.rb:16:in `block (2 levels) in object'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/attribute_assigner.rb:15:in `each'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/attribute_assigner.rb:15:in `block in object'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/attribute_assigner.rb:14:in `tap'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/attribute_assigner.rb:14:in `object'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/evaluation.rb:13:in `object'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/strategy/create.rb:9:in `result'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/factory.rb:43:in `run'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/factory_runner.rb:29:in `block in run'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/factory_runner.rb:28:in `run'
         # /Users/sjohnson/.rvm/gems/ruby-2.6.5/gems/factory_bot-5.1.1/lib/factory_bot/strategy_syntax_method_registrar.rb:20:in `block in define_singular_strategy_method'
         # ./spec/models/okr_team_spec.rb:25:in `block (3 levels) in <top (required)>'

    Top 2 slowest examples (0.4025 seconds, 98.4% of total time):
      OkrTeam#foo should return foo
        0.3979 seconds ./spec/models/okr_team_spec.rb:24
      OkrTeam.foo should return FOO
        0.0046 seconds ./spec/models/okr_team_spec.rb:31

    Finished in 0.40894 seconds (files took 3.55 seconds to load)
    2 examples, 1 failure

    Failed examples:

    rspec ./spec/models/okr_team_spec.rb:24 # OkrTeam#foo should return foo

In my okr_team model, I discovered that I was missing a **belongs_to** relationship, specifically a:

    belongs_to :user
    
And that, dear reader, was sufficient to bring my whole house of software cards crashing to a pile.  I was actually fairly surprised by this; it was a dependency failure that I hadn't seen before.  My missing relationship was a consequence of my very productive [Example Data](https://fuzzyblog.io/blog/rails/2019/12/28/how-do-you-know-what-activerecord-table-has-a-user-id-attribute.html) approach to building this side project.

## The Moral of the Story

I think that from now on I'm always going to implement a useless method called def foo and def self.foo to prove that a class works -- even if it has "no code" -- as even **no code** can, curiously, have bugs.  So the real moral of the story is **TEST EVERYTHING**.