---
layout: post
title: AWS Tutorial 5 - Aurora RDS Issues
---
So I took the time to reload the data I described [yesterday](https://fuzzygroup.github.io/blog/2016/08/28/aws-tutorial-4-rds-data-loading-into-aurora-run-in-circles-scream-and-shout-the-oh-shite-moment.html), that we had fed into Aurora RDS, into a local MariaDB installation and I also eliminated split/cat from the equation by just using a file that had come straight from a mysql dump via an aws s3 sync operation and the results are disturbing:

    Source db (vanilla mysql on our own hardware)
    mysql> select count(*) from a_big_table;
    +----------+
    | count(*) |
    +----------+
    |  2137447 |
    +----------+

    MariaDB on our own box
    MariaDB [banks_production]> select count(*) from a_big_table;
    +----------+
    | count(*) |
    +----------+
    |  2137447 |
    +----------+

    RDS (from loading same file):
    select count(*) from a_big_table;
    +----------+
    | count(*) |
    +----------+
    |   797121 |
    +----------+
    1 row in set (0.00 sec)

That's not encouraging at all.