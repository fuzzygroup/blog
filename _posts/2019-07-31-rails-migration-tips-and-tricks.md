---
layout: post
title: Rails Migration Tips and Tricks
category: rails
tags: ['rails', 'migration', 'db', 'database']
---
A migration is the Rails facility which alters a database's structure.  Migrations are an essential aspect of all database development with Rails and they generally work quite well with the default command: 

    bundle exec rake db:migrate

-or-

    bundle exec rails db:migrate

That command will cause Rails to execute all pending migrations.  A pending migration is one where the timestamp on the migration is **not** stored in the table schema_migrations.  

The trick with migrations is understanding how to manipulate them, replay them, etc when they fail.  

## The Hard Way - The schema_migrations Table

Let's start with the hard way - manipulating schema_migrations table directly.  Let's say that you need to re-run the last 2 migrations.  Here's what you need to do:

Start by getting the timestamps of the last two migrations.  You can do this with an ls -ltr db/migrations and pick them out of what might be a giant list of migrations (my current work project has 858 migrations) -- and this can, well, **suck**.  You can also be smart about it and use tail to get just the last few (default 8 on OSX) migrations.

    ls -ltr db/migrate | tail
    -rw-r--r--  1 sjohnson  staff   201 Jul 18 04:44 20190717234458_create_units.rb
    -rw-r--r--  1 sjohnson  staff   120 Jul 18 04:44 20190717235922_add_unit_id_to_habits.rb
    -rw-r--r--@ 1 sjohnson  staff   154 Jul 18 04:44 20190718000145_add_unit_id_to_habit_tasks.rb
    -rw-r--r--@ 1 sjohnson  staff   129 Jul 18 04:44 20190718075945_add_unit_preferences_json_to_users.rb
    -rw-r--r--@ 1 sjohnson  staff   154 Jul 18 04:44 20190718080511_add_unit_type_to_units.rb
    -rw-r--r--@ 1 sjohnson  staff   131 Jul 18 09:28 20190718110444_fix_stupidity_with_float_val.rb
    -rw-r--r--  1 sjohnson  staff   164 Jul 18 13:33 20190718133051_add_options_to_habits.rb
    -rw-r--r--@ 1 sjohnson  staff   151 Jul 25 15:48 20190725100535_add_has_loggable_tasks_to_habits.rb
    -rw-r--r--@ 1 sjohnson  staff   257 Jul 26 15:21 20190726191446_add_plan_id_to_habits.rb
    -rw-r--r--@ 1 sjohnson  staff   523 Jul 27 03:29 20190726133807_create_plans.rb

Now you can delete from schema_migrations using a database console or by using ActiveRecord in the Rails console so either:

    delete from schema_migrations where version in (20190726133807, 20190726191446);
    
-or- in a Rails console:

    ActiveRecord::Base.connection.execute("delete from schema_migrations where version in (20190726133807, 20190726191446)")

Now you would also need to undo any changes your migrations might have partially implemented.  If this was table creation then this is a relatively simple "drop table foo" statement but if it was an index creation or something harder, you need to selectively alter individual tables.  And even a hard core SQL guy like myself generally doesn't want to do that.  So let's look at the easier options.

## The Easy Way

Happily Rails provides some additional facilities for this allowing you to rollback the last migration or an individual migration.

    rake db:rollback

gets rid of the last migration.  I do NOT, however, ever recommend that you do this.  I'm currently working on an active side project where pull requests are flowing and even when you might think that you know what the last migration **you created** was, you may not realize that another developer slipped a migration in and *whammo*, "Houston we have a problem".

My recommendation is to always specify the version with:

    rake db:migrate:down VERSION=20190726133807

This is absolute and will only affect the migration in question.  Given that I'm a big damn fan of always understanding the state of my persistent storage, it isn't surprising that I recommend this.

## See Also

All of this can be easily referenced:

* [Stack Overflow](https://stackoverflow.com/questions/4352848/how-to-rollback-just-one-step-using-rake-dbmigrate/21119193)
* [Core Rails Docs on Migrations](http://guides.rubyonrails.org/migrations.html#running-migrations)