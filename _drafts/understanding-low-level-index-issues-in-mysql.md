---
layout: post
title: Understanding Low Level Index Issues in MySQL
category: mysql
tags: ["mysql", "index", "performance", "rails"]
---
# The Problem - 

I had a weird thing recently -- a table with 313 million rows with 30+ second queries on a unique index -- that's way, way too long.  Here's how I went about troubleshooting this.  A shout out of thanks to [Ganesh](https://github.com/itsgg) and to [Winston](https://github.com/wakproductions) who both helped out.  Notable mention to Ganesh who actually figured out the core issue; I'm really just the scribe here.

# Viewing MySQL Indexes

Any performance problem always starts with an explain on the query:

```BASH
explain select * from ffiec_line_items where financial_institution_id=37 and mdrm = 'RCON2170' and period = '2008-12-31'\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: ffiec_line_items
         type: ALL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: 314459869
        Extra: Using where
```

Given that I **know** that there's an index I found this puzzling.  The next step was to use a FORCE INDEX syntax on the query to ensure that this isn't an optimizer issue:

> select * from ffiec_line_items FORCE INDEX (index_ffiec_line_items_fin_mdrm_period) where financial_institution_id=37 and mdrm = 'RCON2170' and period = '2008-12-31'

And that gave the same disappointing performance.  Pity. 

This is where Ganesh rose to the challenge and recommended using SHOW INDEXES FROM table_name.  Here's what that gave us:

> SHOW INDEX FROM ffiec_line_items\G

```BASH

MariaDB [regdata_production]> SHOW INDEX FROM ffiec_line_items\G
*************************** 1. row ***************************
        Table: ffiec_line_items
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
        Table: ffiec_line_items
   Non_unique: 0
     Key_name: index_ffiec_line_items_fin_mdrm_period
 Seq_in_index: 1
  Column_name: financial_institution_id
    Collation: A
  Cardinality: 200
     Sub_part: NULL
       Packed: NULL
         Null: YES
   Index_type: BTREE
      Comment:
Index_comment:
*************************** 3. row ***************************
        Table: ffiec_line_items
   Non_unique: 0
     Key_name: index_ffiec_line_items_fin_mdrm_period
 Seq_in_index: 2
  Column_name: mdrm
    Collation: A
  Cardinality: 200
     Sub_part: NULL
       Packed: NULL
         Null: YES
   Index_type: BTREE
      Comment:
Index_comment:
*************************** 4. row ***************************
        Table: ffiec_line_items
   Non_unique: 0
     Key_name: index_ffiec_line_items_fin_mdrm_period
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

The very, very curious thing is that we see **4 copies** of the index!  And you may notice that the cardinality of the index is incredibly low -- 200 versus the 313591995 cardinality of the primary key index.

Cardinality is one of those key database concepts that most of us never have to worry about -- essentially it is a measure of uniqueness in the index.  Indices perform better when they are unique and this is way, way, way too low -- particularly for a unique index which incorporates 3 columns.  The actual cardinality here should approach (or equal) that of the primary key index.  From a purely technical perspective it should be equal but, sometimes, these things don't work out exactly.

# Understanding How Indexes Get Corrupted

This is the kind of thing that should NEVER happen so what went wrong?  We had this running on a 100GB partition where the database was roughly 54 gb and, yes, most of that space was dedicated to this one table.  So my personal theory as to what went wrong is an ALTER TABLE (via a Rails migration) started the index creation and then it failed part way through due to a lack of disc space.  And since it likely took a long time to run the ALTER TABLE, the timestamp for the migration was NEVER inserted into the schema_migrations table.  This meant the next time that a deploy happened, the ALTER TABLE was run again.  And again.  And again until the timestamp finally made it into the schema_migrations table (even though technically the index was never created).

# Fixing All This

The solution to fixing this was actually pretty simple and had four parts:

1. Run an alter table statement which **deleted** the original bad migration: **ALTER TABLE ffiec_line_items DROP INDEX index_ffiec_line_items_fin_mdrm_period;**.
2. Delete the time stamp for the migration from the table schema_versions: **DELETE FROM schema\_migrations WHERE version=20161115210810;**.
3. Do a full deploy which will cause the migration to run again.  Given that this is a multi hour migration, the chance of your SSH connectivity staying up long enough to complete is slim.  Just know that and accept that.
4. Manually insert the timestamp back into the schema_migrations table: **INSERT INTO schema_migrations (version) VALUES (20161115210810);**.

**Note:** A better way to do this is to NOT do this as a deploy but instead manually scp the migration to the server (actually it should be there) and then run db:migrate directly on the server.  This would avoid step 4 entirely.

20161115210810_add_index_institution_id_period_mdrm_to_ffiec_line_item

class AddIndexInstitutionIdPeriodMDRMToFFIECLineItem < ActiveRecord::Migration[5.0]
  def change
    add_index :ffiec_line_items,
              [:financial_institution_id, :mdrm, :period],
              unique: true,
              name: :index_ffiec_line_items_fin_mdrm_period
  end
end


  
