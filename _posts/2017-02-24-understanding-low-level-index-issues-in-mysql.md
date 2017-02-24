---
layout: post
title: Understanding Low Level Index Issues in MySQL and Rails
category: rails
tags: ["mysql", "index", "performance", "rails"]
description: Migrations in Rails don't always get things right.  Here's a step by step analysis of performance problems on a table with 313 million rows and how to address it.
image: http://fuzzyblog.io/blog/assets/rails.png
---
# The Problem

I had a weird thing recently -- a table with 313 million rows had 30+ second queries on a unique index -- that's way, way too long.  Here's how I went about troubleshooting this. 

A shout out of thanks to [Ganesh](https://github.com/itsgg) and to [Winston](https://github.com/wakproductions) who both helped out.  Notable mention to Ganesh who actually figured out the core issue; I'm really just the scribe here.

# Viewing MySQL Indexes

Any performance problem always starts with an explain on the query:

```BASH
explain select * from line_items where company_id=37 and document_identifier = 'RCON2170' and period = '2008-12-31'\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: line_items
         type: ALL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: 314459869
        Extra: Using where
```

Given that I **know** that there's an index I found this *puzzling*.  The next step was to use a FORCE INDEX syntax on the query to ensure that this isn't an optimizer issue:

> select * from line_items FORCE INDEX (index_line_items_fin_document_identifier_period) where company_id=37 and document_identifier = 'RCON2170' and period = '2008-12-31'

And that gave the same disappointing performance.  Pity. Using FORCE INDEX would have sucked but it would have been an easy fix at least.  Onward!

This is where Ganesh rose to the challenge and recommended using SHOW INDEXES FROM table_name.  I haven't used that in years and that's likely a bad, bad, bad thing on my part (sorry).  Here's what that gave us:

> SHOW INDEX FROM line_items\G

```BASH

MariaDB [data_production]> SHOW INDEX FROM line_items\G
*************************** 1. row ***************************
        Table: line_items
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: id
    Collation: A
  Cardinality: 313591995
     Sub_part: NULL
       Packed: NULL
         Null:
   Index_type: BTREE
      Comment:
Index_comment:

*************************** 2. row ***************************
        Table: line_items
   Non_unique: 0
     Key_name: index_line_items_fin_document_identifier_period
 Seq_in_index: 1
  Column_name: company_id
    Collation: A
  Cardinality: 200
     Sub_part: NULL
       Packed: NULL
         Null: YES
   Index_type: BTREE
      Comment:
Index_comment:

*************************** 3. row ***************************
        Table: line_items
   Non_unique: 0
     Key_name: index_line_items_fin_document_identifier_period
 Seq_in_index: 2
  Column_name: document_identifier
    Collation: A
  Cardinality: 200
     Sub_part: NULL
       Packed: NULL
         Null: YES
   Index_type: BTREE
      Comment:
Index_comment:

*************************** 4. row ***************************
        Table: line_items
   Non_unique: 0
     Key_name: index_line_items_fin_document_identifier_period
 Seq_in_index: 3
  Column_name: period
    Collation: A
  Cardinality: 200
     Sub_part: NULL
       Packed: NULL
         Null: YES
   Index_type: BTREE
      Comment:
Index_comment:
4 rows in set (0.01 sec)

```

The very, very curious thing is that we see **3 copies** of the index!  And you may notice that the cardinality of the index is incredibly low -- 200 versus the 313591995 cardinality of the primary key index.

[Cardinality](https://www.ibm.com/developerworks/data/library/techarticle/dm-1309cardinal/) is one of those key database concepts that most of us never have to worry about -- essentially it is a measure of uniqueness in the index.  Indices perform better when they are unique and this is way, way, way too low -- particularly for a unique index which incorporates 3 columns.  The actual cardinality here should equal that of the primary key index since this is a unique index.  

# Understanding How Indexes Get Corrupted

This is the kind of thing that should NEVER happen so what went wrong?  Here's where you have to guess a bit since we lack enough history to recreate things exactly.  Here's what I think happened:

1.  We had this running on a 100GB partition where the database was roughly 54 gb and, yes, most of that space was dedicated to this one table.  
2.  An ALTER TABLE (via a Rails migration) started the index creation and then it failed part way through due to a lack of disc space.  
3.  And since it likely took a long time to run the ALTER TABLE, the timestamp for the migration was NEVER inserted into the schema_migrations table (deploy timeout).  
4.  This meant the next time that a deploy happened, the ALTER TABLE was run again.  And again.  And again until the timestamp finally made it into the schema_migrations table (even though technically the index was never fully created).

# Fixing All This

The solution to fixing this was actually pretty simple and had four parts:

1. Run an alter table statement which **deleted** the original bad migration: **ALTER TABLE line_items DROP INDEX index_line_items_fin_document_identifier_period;**.
2. Delete the time stamp for the migration from the table schema_versions: **DELETE FROM schema\_migrations WHERE version=20161115210810;**.
3. Do a full deploy which will cause the migration to run again.  Given that this is a multi hour migration, the chance of your SSH connectivity staying up long enough to complete is slim.  Just know that and accept that.
4. Manually insert the timestamp back into the schema_migrations table: **INSERT INTO schema_migrations (version) VALUES (20161115210810);**.

**Note 1:** A better way to do this, that I just thought of, is to **NOT** do this as a deploy but instead manually scp the migration to the server (in fact it should be in db/migrate it should be there), delete the timestamp from schema_migrations and then run db:migrate directly on the server.  This would avoid step 4 entirely.  

**Note 2:** Very **long running** migrations are generally best run directly on the server without a deploy (in my not so humble opinion).  I used to do this all the time in my AppData hey day but I haven't had to in ages so it took a while to remember it.

**Note 3:** If you don't like doing an scp of a migration file then deploy to one node in your cluster of servers that is NOT a db role.  That prevents the migration from running automatically and then you can log in via ssh and start the migration manually.  Migrations **only** run automatically when you have at least one machine identified as a db role being deployed to.

