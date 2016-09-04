---
layout: post
title: MySQL - How Do You Know Your Data Load Worked?
category: mysql
tags: ["mysql"]
---

This post outlines my strategy of how to verify a multi terabyte data load across hundreds of different tables from database 1 (source) to database 2 (target).

There are three metrics that we can track:

* dump file size
* row count
* sampled row data

Each of these is discussed below.  

# Dump File Size

Given that all of our databases are simply too large to transfer as a single entity, we're going to have to go with a table by table dump strategy.  This gives us one basic metric on the load process -- the dump file on source needs to be the same size as the dump file on target.  

# Row Count

After the data is loaded from source to target the row count should be identical and that's simple to verify with a SELECT COUNT(*) FROM table query.  

# Sampled Row Data

If we've verified the dump file size and the row count, it would be easy to assume that everything loaded correctly but do we really know?  One way to address this is thru sampling.  What we can do is apply a hash function on the contents of an entire row.  If we're using the same hash function on both source and target and on the same rows (i.e. row 1315789 on source and row 1315789 on target) then we should get the same result.  And if we did this consistently -- say first row, last row and then say 1,000 randomly chosen rows for every table, we should have a fairly high degree of certainty that source and target are in sync.

# High Degree of Certainty

I used that term very deliberately and I recognize that its a mealy mouthed way of saying "well I'm not entirely sure that source and target on the same" and that's true.  Once you move to a certain scale 
