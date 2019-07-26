---
layout: post
title: Development Anti Pattern - Two Objects with Almost the Same Structure
category: anti_patterns
tags: ["software_development", "anti_patterns"]
---
One of the beautiful things about greenfield development, that joyous process of starting anew on something, is that it lets you see errors that you make much more cleanly.  And this is a combination of a few things:

1.  The Forest for the Trees.  In a big code base, any errors you make aren't that visible because they are drowned out by all the other bits of code.
2. Willingness to Get It Right.  When you start a new code base, it is like starting a new love affair -- this time, you are going to get it **right**.  This time, it will be **different**.  So you are a bit more able to see errors then a lot more willing to rip apart something that is already working to make it right.

The specific example at hand is the anti pattern of two objects with almost the same structure.  Here's an example from my current side project:

    desc habits;
    +-----------------+--------------+------+-----+---------+----------------+
    | Field           | Type         | Null | Key | Default | Extra          |
    +-----------------+--------------+------+-----+---------+----------------+
    | id              | bigint(20)   | NO   | PRI | NULL    | auto_increment |
    | created_at      | datetime     | NO   |     | NULL    |                |
    | updated_at      | datetime     | NO   |     | NULL    |                |
    | name            | varchar(255) | YES  | MUL | NULL    |                |
    | hardness        | int(11)      | YES  |     | NULL    |                |
    | frequency       | int(11)      | YES  |     | NULL    |                |
    | economic_value  | int(11)      | YES  |     | NULL    |                |
    | user_id         | int(11)      | YES  | MUL | NULL    |                |
    | description     | text         | YES  |     | NULL    |                |
    | shareable       | tinyint(1)   | YES  |     | NULL    |                |
    | habit_type_id   | int(11)      | YES  | MUL | NULL    |                |
    | master_habit_id | int(11)      | YES  | MUL | NULL    |                |
    | unit_id         | int(11)      | YES  |     | NULL    |                |
    | options         | text         | YES  |     | NULL    |                |
    | has_tasks       | tinyint(1)   | YES  |     | 0       |                |
    +-----------------+--------------+------+-----+---------+----------------+
    15 rows in set (0.00 sec)

    desc habit_tasks;
    +----------------------------+--------------+------+-----+---------+----------------+
    | Field                      | Type         | Null | Key | Default | Extra          |
    +----------------------------+--------------+------+-----+---------+----------------+
    | id                         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
    | created_at                 | datetime     | NO   |     | NULL    |                |
    | updated_at                 | datetime     | NO   |     | NULL    |                |
    | habit_id                   | int(11)      | YES  | MUL | NULL    |                |
    | name                       | varchar(255) | YES  |     | NULL    |                |
    | hardness                   | int(11)      | YES  |     | NULL    |                |
    | frequency                  | int(11)      | YES  |     | NULL    |                |
    | economic_value             | float        | YES  |     | NULL    |                |
    | user_id                    | int(11)      | YES  |     | NULL    |                |
    | metric_type_id             | int(11)      | YES  |     | NULL    |                |
    | unit_id                    | int(11)      | YES  |     | NULL    |                |
    | best_general_time_for_this | varchar(255) | YES  |     | NULL    |                |
    | options                    | text         | YES  |     | NULL    |                |
    +----------------------------+--------------+------+-----+---------+----------------+
    13 rows in set (0.06 sec)
    
These are pretty close to the same and they represent an attempt to give a 1 level hierarchy (the habit_task) onto the parent object (habit).  

And the simple answer here is that what I'm actually looking for are groups not a sub-object i.e. invent a group concept an then simply reduce all the habit_task objects to habits that are grouped together.  That achieves roughly 95% of what habit_tasks did and dramatically:

* reduces code duplication (the same routine to calculate economic_value is used multiple places)
* reduces complexity overall
* gets rid of a huge wart in the display views where nesting is needed
* improves performance by not having to constantly check if a habit has tasks

The bottom line here is that whenever you have two objects with almost the same structure, start asking yourself is that really the same damn object somehow.  