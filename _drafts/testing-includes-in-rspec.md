---
layout: post
title: Testing Includes in RSpec
category: rspec
tags: ["rails", "rspec", "testing", "ruby"]
---
When you do software testing with a tool like RSpec, TestUnit or MiniTest, the obvious thing to test is the code itself.  So you write a method and then you write the lines of test coverage that are needed.  It won't work the first time so you iterate -- again and again until it works and then the client says something like: 

"We want everything tested"

And you start considering the meta structure of the class you're working on and you realize that you need to test an *include directive* like:

> include DefaultThingInfo

Now that's actually interesting -- because there is **no code** to test.  Now you could argue that an include is an inherent property of the class and since the inclusion itself happens at the Ruby level, you **don't need** to test it at all.  And I've worked with engineers in the past who were credible in making that argument but code bases are *living*, *ever changing* beasts.  And people do make mistakes -- I've seen all kinds of times where an engineer fat fingers the keyboard, a line is accidentally deleted or commented out and when you have something as important as an include directive, well, all kinds of badness can happen.

One approach to testing this would be to look at the underlying mechanics of DefaultThingInfo and see how it works and then test that -- essentially testing its effects.  The problem here is:

* those effects could change
* something else in the system could interfere
* we might not really understand those effects

What we really want to do is test that this actually injecting the right stuff into the code and that's going to require looking into the code's meta stuff.  Let's say that this class is named MyStuff.  We can go into Rails Console and look at its methods with:

2.3.1 :002 > (MyStuff.methods - Object.methods).sort

Now that's going to return, for me, 503 methods and I really, really don't want to read all of them so let's chain in a .grep call

2.3.1 :002 > (MyThing.methods - Object.methods).grep(/Thing/i)
[
    [0] thing_class() DefaultThingInfo
]

We can then check the call method thing_class for its return value and use it in our test.  Let's say that it returns "ThingInfo".

So now our RSpec test becomes something like:

    it "should include DefaultThingInfo" do
      expect(MyClass.think_class).to eq "ThingInfo"
    end

The combination of Class.methods - Object.methods with a .grep call chained onto it is incredibly powerful.  Ever since I learned this, years ago, I've been far more likely to experiment in rails console than I am to look things up.
    
    
