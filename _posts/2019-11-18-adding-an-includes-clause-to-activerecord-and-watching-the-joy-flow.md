---
layout: post
title: Adding an Includes Clause to ActiveRecord and Watching the Joy Flow
category: rails
tags: ["rails", "activerecord", "performance"]
---
{:.center}
![IMG_9986.jpeg](/blog/assets/IMG_9986.jpeg)

I've written in the past about watching your SQL queries stream by in the Rails console and how seeing, well, stupidity / things that look wrong can help guide you to things you need to find.  Here's an example I witnessed recently:

    habit = Habit.find(2)
    habit.total_this_month
    
    Metric Load (2.5ms) SELECT metrics.date_created_at, metrics.int_val, metrics.float_val, metrics.metric_type_id FROM metrics WHERE metrics.habit_id = 2 AND (date_created_at >= '2019-11-01') AND (date_created_at <= '2019-11-30')
    MetricType Load (3.3ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (38.1ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (17.0ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (40.3ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (2.7ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (1.3ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (3.2ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (5.2ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (252.9ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (11.2ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (7.4ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    MetricType Load (1.6ms) SELECT metric_types.* FROM metric_types WHERE metric_types.id = 1 LIMIT 1
    
According to the bug tracker where I logged, this it was logged 5 days ago (so on November 12).  And if you could the number of metric_type queries above, the total is 12.  This is date ordered stuff so it is pretty obvious that what's happening is that metric_type query is getting executed once per day.
  
Here's the definition of the total_this_month method:

```ruby
def total_this_month
  today = Date.current
  date_start = DateCommon.first_date_of_month(today)
  date_end = DateCommon.last_date_of_month(date_start)    
  total_from_date_to_date(date_start, date_end)    
end
```

And here's the total_from_date_to_date method:

```ruby
def total_from_date_to_date(date_start, date_end)
  self.metrics.select(Metric::TOTAL_FIELDS).where(["date_created_at >= ?", date_start]).where(["date_created_at <= ?", date_end]).map(&:amount).compact.sum
end
```

This type of issue is referred to as an [N+1 query problem](https://semaphoreci.com/blog/2017/08/09/faster-rails-eliminating-n-plus-one-queries.html) where each query leads to another query.  The solution here is to use the :includes option on the query to bring in the metric_types table as part of this.

And here's the fix

```ruby
def total_from_date_to_date(date_start, date_end)
  self.metrics.select(Metric::TOTAL_FIELDS).where(["date_created_at >= ?", date_start]).where(["date_created_at <= ?", date_end]).includes(:metric_type).map(&:amount).compact.sum
end
```

Just adding a simple .includes(:metric_type) clause to the where statement fixes this and makes that data available to the underlying .compact.sum operation.  And, yes, to fix a performance problem this easily really does make the joy flow for a developer.  