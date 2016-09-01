---
layout: post
title: AWS Tutorial 4 - RDS Data Loading into Aurora Run In Circles Scream and Shout - The Oh Shite Moment
category: aws
tags: ["aws", "rds", "mysql", "aurora"]

---
If you've read tutorial [1](https://fuzzygroup.github.io/blog/2016/08/23/aws-exporting-a-large-mysql-instance-to-aws.html), [2](https://fuzzygroup.github.io/blog/2016/08/24/aws-tutorial-2-importing-a-large-mysql-instance-from-s3.html) or [3](https://fuzzygroup.github.io/blog/2016/08/28/aws-tutorial-3-notes-on-s3-sync.html) then you absolutely need to read this one.  

What I've been doing is generating mysqldump load files on a normal MySQL instance and then feeding them into an [Amazon RDS](https://aws.amazon.com/rds/) hosted Aurora db.  Normally I'm beyond conservative with the storage layer of anything I build but this time I went for the gusto and used something new - [Amazon Aurora](https://aws.amazon.com/rds/aurora/).

What I've just discovered is terribly, terribly troubling.  I'm encountering silent load failures where data I've exported is in the dump files but NOT in Aurora after the load.  I discovered this one time thru an error message and other than that I haven't seen an error message but I am missing data. 

Now given the convoluted gyrations with split, sync and cat to recombine, it would be easy to assume that the issue is mine but I only used split / cat on two tables of data and there are issues with at least 3 tables so one of the tables did NOT use split / cat.  Here's an example:

    source:
    select count(*) from large_table;
    +----------+
    | count(*) |
    +----------+
    | 72994268 |
    +----------+
    1 row in set (1 min 28.98 sec)

    aurora:
    select count(*) from large_table;
    +----------+
    | count(*) |
    +----------+
    | 43012074 |
    +----------+
    1 row in set (30.66 sec)

And this was one of the non split files.  The files done with split are worse.

I have an ec2 instance configured as a high performance db server so I'm loading one of the offending files into to see if I can eliminate Aurora as the issue. 

And I'm not going to definitely say that the issue is Aurora.  I've prematurely pointed the finger in the past and that's not fair.  What I do think is fair is to say the following:
* Do not assume that because an import succeeded that all your data is there
* Absolutely verify row counts from source to destination
* I don't know that row counts indicate success; I think you need a checksum of sql statements from source to destination but that's a much harder problem

More later if / when I understand this.