---
layout: post
title: Code - Data Versus Algorithms or There Is Always Another Way
category: software_engineering
tags: ["software_engineering", "ruby"]
---
{% pizzaforukraine  %}

I'm currently writing an active side project.  I describe active as something that I think about every single day and I've been at for several months.  It is still in stealth mode but at more than 4k lines of code, it is pretty damn real.  This is also the first thing I've ever built where gamification plays an important role.  One of the things that I need for the gamification is to know if a date is a holiday.  The date centric holidays are pretty easy -- Date.new(this_year, 10, 31) for halloween, just for example.  But the stickler is thanksgiving -- that 4th Thursday of the damn month.

A simple Ruby solution is to construct a date range - Nov 1 and Nov 30 and then walk up, counting the Thursdays when you go.  And I'm certain there are better / more elegant ways but I'm not a whizbang date math kinda engineer.  But this is a method which gets called for every single metric that the system captures (for just a few months of data, there are over 700 metrics for my usage alone).  So I don't want that much iteration.  I looked at the [Holidays gem](https://github.com/holidays/holidays) and considered it but I only, for now, need simple holidays.  

And then it struck me -- this is a side project, damn it.  The odds on any side project surviving for more than a year are low (although [Job Hound](https://www.jobhound.io) has now beaten the odds at about 1.5 years old).  And Data is (generally) faster than code no matter how you cut it -- so why not just hard code 5 years of Thanksgivings into the app.  I don't need a generalized solution that works for all time.  I just need a solution that is good enough to find out if there's a market for my side project.

```ruby
class DateCommon
  
  # Todo - this bites me in the ass in 2024
  THANKSGIVING_2019 = Date.new(2019, 11, 28)
  BLACK_FRIDAY_2019 = THANKSGIVING_2019 + 1.day
  THANKSGIVING_2020 = Date.new(2020, 11, 26)
  BLACK_FRIDAY_2020 = THANKSGIVING_2020 + 1.day
  THANKSGIVING_2021 = Date.new(2021, 11, 25)
  BLACK_FRIDAY_2021 = THANKSGIVING_2019 + 1.day
  THANKSGIVING_2022 = Date.new(2022, 11, 24)
  BLACK_FRIDAY_2022 = THANKSGIVING_2022 + 1.day
  THANKSGIVING_2023 = Date.new(2023, 11, 23)
  BLACK_FRIDAY_2023 = THANKSGIVING_2023 + 1.day
  
  
  def self.holiday?(date)
    date = date.to_date if date.class.is_a?(DateTime)
    date = date.parse if date.class.is_a?(String)
    
    this_year = Date.today.year
    return true if date == Date.new(this_year, 12, 25)
    return true if date == Date.new(this_year, 10, 31)
    return true if date == Date.new(this_year, 12, 31)
    return true if date == Date.new(this_year, 1, 1)
    return true if date == Date.new(this_year, 7, 4)
    return true if date == Date.new(this_year, 2, 14)
    return true if date == THANKSGIVING_2019
    return true if date == BLACK_FRIDAY_2019
    return true if date == THANKSGIVING_2020
    return true if date == BLACK_FRIDAY_2020
    return true if date == THANKSGIVING_2021
    return true if date == BLACK_FRIDAY_2021
    return true if date == THANKSGIVING_2022
    return true if date == BLACK_FRIDAY_2022
    return true if date == THANKSGIVING_2023
    return true if date == BLACK_FRIDAY_2023    

    return false
  end
end
```

And this gives me:

```
  DateCommon.holiday?(self.created_at)
```

**Note**: by using created_at, I need to call this as part of an after_create or after_save since otherwise created_at wouldn't be set.

Oh and as far as finding out when a particular Thanksgiving was, Google proved amply up to the task.  Just google for Thanksgiving 2024 and you'll see what I mean.  Sadly Google stops at 2024 which means my threshold of 5 years is probably about right.