---
layout: post
title: What Just Happened To Your Database In the Past 10 Minutes
category: mysql
tags: ["mysql", "rails", "sql"]
---
So I'm rapidly coming to the conclusion that Christmas is the enemy of getting things done.  While I have come up with a lot of potential topics to write about recently I don't seem to be able to get anything actually finished due to: 

* Present Shopping
* Present Wrapping
* Christmas Events (parties, choir concerts, etc)
* Christmas Baking

Alas -- at least, as my old boss, [Scott Rafer](https://twitter.com/rafer), used to say -- *these are high quality problems to have*!

A quick post today -- looking at the state of your database.  Let's say you have a table called posts and it has a field called created_at (the Rails standard way of tracking table changes) and you want to see how many things came into that table in the past 10 minutes.  Here's the sql you need:

    SELECT COUNT(*) FROM posts WHERE created_at > DATE_ADD(NOW(),INTERVAL - 10 MINUTE);

Previously I've generally looked at tables and then tried to relate what's going on to the current time and adjust in my head for the server time zone offset.  This is **much, much** better.

A really nice side effect of this is that you can simply change the interval quickly and see if your performance is linear or non-linear.  Let's say you change your interval to 5, 10 and 15 minutes and this was the result:

    MariaDB [foo_production]> SELECT COUNT(*) FROM posts WHERE created_at > DATE_ADD(NOW(),INTERVAL - 5 MINUTE);
    +----------+
    | COUNT(*) |
    +----------+
    |      468 |
    +----------+
    1 row in set (0.45 sec)

    MariaDB [foo_production]> SELECT COUNT(*) FROM posts WHERE created_at > DATE_ADD(NOW(),INTERVAL - 10 MINUTE);
    +----------+
    | COUNT(*) |
    +----------+
    |      512 |
    +----------+
    1 row in set (0.44 sec)

    MariaDB [foo_production]> SELECT COUNT(*) FROM posts WHERE created_at > DATE_ADD(NOW(),INTERVAL - 15 MINUTE);
    +----------+
    | COUNT(*) |
    +----------+
    |     1312 |
    +----------+
    1 row in set (0.45 sec)
    
What this illustrates is that while performance was non linear in the 5 to 10 minute range, it became linear again (roughly) at the 15 minute mark.  This is a nice simple way to get a *feel* if performance is overall on track.

