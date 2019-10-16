---
layout: post
title: Importing Your Local MySQL Database Into Heroku
category: heroku
tags: ["mysql", "heroku"]
---
{:.center}
![IMG_9407.jpeg](/blog/assets/IMG_9407.jpeg)

It never fails to amaze me how poorly documented certain basic things are.  The topic today is getting your development data for something using MySQL loaded into Heroku.  This shouldn't be hard but Google certainly doesn't make it clear.  And, to be honest, Heroku certainly doesn't make it clear.  As with many things, the answer was obvious, but with Heroku being such a closed platform and having its own import tools for Postgres, I would have thought there was something other than the standard.

## Step 1 - Find Your MySQL Credentials in Heroku

You want to go to your MySQL dashboard in Heroku and find your:

* Host
* Username
* Password
* Database

Your Heroku Dashboard for MySQL can be found [here](https://dashboard.jawsdb.com/mysql/dashboard).  No, I don't know why it is called "jawsdb"; some kind of shark fetish perhaps ...

## Step 2 - Dump Your Database Locally

You need to dump your database locally with something like this:

    mysqldump -uroot -p$UIOUFEIRE change_me_now_development > ~/change_me_now_development.sql

## Step 3 - Make a Command Line to Import 

You can use a standard MySQL command line to import the database using the host parameter to comment to the Heroku hosted version over the Internet.  Here's an example:

    mysql -uYOUR_USERNAME -pYOUR_PASSWORD YOUR_DATABASE --host=YOUR_HOST < lib/tasks/data/db_dumps/change_me_now_development_2019-09-26.sql
    
Substitute the values you found in step 1 for the **YOUR** information and, of course, update the file you are importing from.

## Step 4 - Verify

After any type of database import from development to production, you really, really, **really** want to verify that all the data you sent in to the production database actually got in.  There are lots and lots of ways to do this but an easy way is to dump the data back and see if it is roughly the same size.  This can be done with the standard mysqldump tool:

    mysqldump -uYOUR_USERNAME -pYOUR_PASSWORD YOUR_DATABASE --host=YOUR_HOST > lib/tasks/data/db_dumps/change_me_now_production_2019-10-16.sql

And then a simple ls -l tells us the truth of all this:

    ls -l lib/tasks/data/db_dumps/
    total 1808
    -rw-r--r--  1 sjohnson  staff  457221 Oct 16 09:37 change_me_now_development_2019-09-26.sql
    -rw-r--r--  1 sjohnson  staff  457198 Oct 16 10:23 change_me_now_production_2019-10-16.sql
    
There is a difference of only 23 bytes between the import and the export and that's good enough for me!