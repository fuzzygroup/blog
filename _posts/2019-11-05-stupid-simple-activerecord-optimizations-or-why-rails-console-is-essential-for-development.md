---
layout: post
title: Stupid Simple ActiveRecord Optimizations or Why Rails Console is Essential for Development
category: rails
tags: ["rails", "active_record", "optimization"]
---
{:.center}
![IMG_9823.jpeg](/blog/assets/IMG_9823.jpeg)

Ever since 2008 when my pairing partner at the time, Jared, pushed me to basically live in the Rails console, I've been heavily, heavily dependent on the console as an essential developer tool.  I just watched something that pointed out to me just why it is so damn important.  

Here's what I observed:

    2.6.3 :057 > m.change_pct_today_over_goal?
      Goal Load (65.2ms)  SELECT `goals`.* FROM `goals` WHERE `goals`.`habit_id` = 39 ORDER BY `goals`.`id` ASC LIMIT 1
      Habit Load (0.4ms)  SELECT `habits`.* FROM `habits` WHERE `habits`.`id` = 39 LIMIT 1
      Goal Load (0.5ms)  SELECT `goals`.* FROM `goals` WHERE `goals`.`habit_id` = 39 ORDER BY `goals`.`id` ASC LIMIT 1
      Goal Load (30.2ms)  SELECT `goals`.* FROM `goals` WHERE `goals`.`habit_id` = 39 ORDER BY `goals`.`id` ASC LIMIT 1
    true
    
I simply can't think that the fact that we're loading the goal from the database 3 times is an optimal use of computing resources.  So I dug into the code and here's what I saw:

```ruby
# original
def change_pct_today_over_goal?
  return false if self.goal.nil?
  return false if self.habit.goal.amount.nil?
  goal_amount = self.goal.amount.to_f
  actual_amount = self.amount
  
  amount_over_goal = actual_amount - goal_amount
  
  return false if amount_over_goal < 0
  return false if amount_over_goal == 0
  
  return true if (amount_over_goal / goal_amount).to_f * 100  >= 25.0
  
  return false
end
```

The first 3 lines in the method above walk database associations back to the goal.  The simple optimization is to store the goal in a local variable so it is only read once:

```ruby
# rewritten
def change_pct_today_over_goal?
  goal = self.goal
  return false if goal.nil?
  return false if goal.amount.nil?
  goal_amount = goal.amount.to_f
  actual_amount = self.amount
  
  amount_over_goal = actual_amount - goal_amount
  
  return false if amount_over_goal < 0
  return false if amount_over_goal == 0
  
  return true if (amount_over_goal / goal_amount).to_f * 100  >= 25.0
  
  return false
end
```

Now it is possible that with the right caching strategy server side, this change wouldn't be necessary but caching is always problem.  It is simply better to solve this without caching because not only will that speed things in production but it will also speed things in development.

And, yes, this would have been obvious if I had been tailing log files but the beauty of Rails console is that all this information is present if you simply pay a small bit of attention.