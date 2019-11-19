---
layout: post
title: Adding Decimal Types to Rails Migrations
category: rails
tags: ["rails", "mysql"]
---
{:.center}
![IMG_9619.jpeg](/blog/assets/IMG_9619.jpeg)

Like so many other things this falls into the category of "I'll do it 100 more times before I die and I can never remember it so may as well blog it".  A migration adds a column to a table in a database managed by Rails.  In this case I had a table which needed to manage multiple types of data all front ended by an amount method that dynamically figures out why field to fetch back the data from.  This gave me a column structure like this:

* int_val (for integers)
* float_val (for floats like a measurement)

And I needed to add money as a value to this table.  Now, yes, I could simply store money in the float_val field but that's a bad practice to start doing because, well, rounding.  Even if it really doesn't matter in the app, it is a bad practice to train yourself on.  

From having done this in the past, I know I need a decimal of the format (something, 2).  This is referred to as the 'scale' and the 'precision' (the number of digits to the right of the decimal place).  So if we have decimal(8,2), that means you can store:

    123,456.78
    
So your maximum value would be 999,999.99 (just under a million dollars; now say that in a [Dr. Evil intonation](https://www.youtube.com/watch?v=l91ISfcuzDw)).  

Now writing a migration with precision and scale isn't hard but I always want to do this to allow for placing the column in the right place (it makes my tables 'near' and, yes, I'm just that nerdy).  Here's my migration:

    bundle exec rails g migration add_decimal_to_metrics
          invoke  active_record
          create    db/migrate/20191118100314_add_decimal_to_metrics.rb

```ruby
class AddDecimalToMetrics < ActiveRecord::Migration[6.0]
  def change
    add_column :metrics, :decimal_val, :decimal, precision: 8, scale: 2, after: :float_val
  end
end
```

## References

* [Stack Overflow on Scale and Precision](https://stackoverflow.com/questions/5452653/datatype-decimal6-2).
* [Mitrev on Migrations](http://mitrev.net/rails/2015/04/19/rails-migration-generator-specifying-precision-and-scale/)

