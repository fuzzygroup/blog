---
layout: post
title: Ruby Madness - Right Hand If Statements and Syntax Error, Unexpected end-of-input, Expecting End
category: ruby
tags: ["ruby", "debugging"]
---
{:.center}
![IMG_7793.jpeg](/blog/assets/IMG_7793.jpeg)

{:.center}
The Eagle's Nest AirBnB Cabin on the Ohio River; One of my favorite places...

Last night I was on a coding tear, that moment when the solution is just **crystal** clear.  That situation where something you've struggled with for days / weeks / months and then it all comest together.  

The result of this was a whole bunch of code stuck in a single model and then this morning when I was ready to run it across the entire dataset, I got this crap:

    ruby -c app/models/habit.rb
    app/models/habit.rb:592: syntax error, unexpected end-of-input, expecting end
    
I **censored** hate this error.  Line 592 is the end of the class and that means that the ruby parser just blithely skipped to the end and really has no useful positional information for you.  

**Note**: If you're not familiar with ruby -c, it is a syntax checker that makes sure your file is parseable.  Think of it as a poor man's lint.

My usual approach to finding this error is to cut our half the code in the file and then re-run the ruby -c process.  And then repeat that until you get this:

    ruby -c app/models/habit.rb
    Syntax OK
    
And that's how I ended up finding the error but the error was ridiculously subtle.  

Here's the error:

```ruby
def self.with_feeds
  habits_with_feeds = []
  Habit.active.each do |habit|
    habits_with_feeds << if habit.has_feed?
  end
  habits_with_feeds
end
```

And here's the corrected version of the method:

```ruby
def self.with_feeds
  habits_with_feeds = []
  Habit.active.each do |habit|
    habits_with_feeds << habit if habit.has_feed?
  end
  habits_with_feeds
end
```

Now, this is subtle, so I'm going to just call it out.  The issue was this line:

    habits_with_feeds << habit if habit.has_feed?

versus 

    habits_with_feeds << if habit.has_feed?

Clearly, to the ruby parser, the lack of something being added to the array qualifies as a missing end.  Yeah I get that but damn.   I'm personally a huge fan of right hand if statements due to the reduction of 3 lines down to 1 but this is a case where they bit me **hard**.  Sigh.  