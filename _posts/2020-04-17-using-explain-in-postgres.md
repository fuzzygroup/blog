---
layout: post
title: Using Explain in Postgres
category: postgres
tags: ["postgres", "sql"]
---
I've been a MySQL user professionally since 1999 when I abandoned the land of Windows NT server side development due to quality abomination that was Microsoft Site Server -- "sh|t, fsck, censored, censored, censored --- if Microsoft's quality is this bad, I may as well not pay for software."  I can remember that moment with the crystal clear clarity of:

* a fog of comic book cursing that surrounded me as I worked in my attic garret like office
* a sense of my life will never be the same again (Open Source to me has had the same type of impact on my life as meeting women that I have loved and having children and discovering Ruby)

Ah yes but I digress with the lack of clarity of someone who has slept 8 hours in the past 72 but ...

Anyway - MySQL - I've been using **explain** to analyze queries in MySQL for decades i.e.

    explain SELECT foo FROM bars WHERE expression a = b

And, as of late, I've been using Postgres for many, many projects including [CovidNearMe](https://www.covidnearme.org) and my professional day job at the ADL and I've been thinking that explain doesn't work because my database client has, for the first time in my life been graphical, Postico, not a raw terminal and I was never able to make explain work in Postico.

**Note**: I just stinking tried this again and Postico has made a liar out of me.  Sigh.  Honest -- explain didn't work like yesterday when I created this blog post.  Sigh.  Sleep deprivation impacts on cognition; perhaps I should not be driving a motor vehicle today ...

So the other day when I need to analyze a query and Google told met hat EXPLAIN was actually a thing, I got out the console and did this:

    psql -U sjohnson -d covid_morbidity1_development
    psql (11.5)
    Type "help" for help.
    covid_morbidity1_development=# EXPLAIN select max(date_created_at) from locations;
                              QUERY PLAN
    ----------------------------------------------------------------------
     Aggregate  (cost=3736.90..3736.91 rows=1 width=4)
       ->  Seq Scan on locations  (cost=0.00..3525.32 rows=84632 width=4)
    (2 rows)

Now I don't use Postgres enough to really understand this but it isn't showing me that an index is **NOT** being used for the query and that's **always**, **always** bad.  So I added a simple index as per this example:

        table.index ["date_created_at"], name: "index_locations_on_date_created_at"

And now we get:

    ❯ psql -U sjohnson -d covid_morbidity1_development
    psql (11.5)
    Type "help" for help.

    covid_morbidity1_development=# EXPLAIN select max(date_created_at) from locations;
                                                                  QUERY PLAN
    ---------------------------------------------------------------------------------------------------------------------------------------
     Result  (cost=0.36..0.37 rows=1 width=4)
       InitPlan 1 (returns $0)
         ->  Limit  (cost=0.29..0.36 rows=1 width=4)
               ->  Index Only Scan Backward using index_locations_on_date_created_at on locations  (cost=0.29..5992.46 rows=84633 width=4)
                     Index Cond: (date_created_at IS NOT NULL)
    (5 rows)

What I can tell from this is that we're not dealing with a full table scan of 3736 row but instead a scan of 36 rows. 