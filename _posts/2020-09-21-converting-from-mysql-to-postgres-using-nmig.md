---
layout: post
title: Converting from MySQL to Postgres using NMIG
date: 2020-09-21 20:11 -0400
category: mysql
tags: ["mysql", "postgres"]
---
{% pizzaforukraine  %}

{:.center}
![IMG_9563.jpeg](/blog/assets/IMG_9563.jpeg)

Historically I've been a MySQL advocate but I've recently been quite impressed with Postgres.  This leaves me in the position of needing to migrate several MySQL databases over to Postgres -or- run two database engines in production.  And, clearly, it is far more desirable to run only a single production database server.

I recently found the [NPM tool NMIG](https://github.com/AnatolyUss/nmig) and used it to successfully convert a MySQL database over to Postgres quickly and easily -- once I got past the initial installation process.  

## Installing and Using NMIG

Here's what you need to do to use NMIG.

**Pro Tip 2**: Go into your source database before you start the conversion and do a count on any table with a large number of records.  This gives you a checksum on the overall process (NMIG has great logs but I always prefer *belt and suspenders* when it comes to working with valuable data).

1. On your machine you need to have a version of NPM installed that is version 10 or later.
2. Git clone the NMIG repo to a directory on your computer.
3. Change into that directory.
4. Edit the file config/config.json and set the credentials for your **source** and **target**.
5. Make a directory named **nmig_logs**.
6. Run **npm install** to install all the dependencies.
7. Run **npm run build** to convert the code from TypeScript to JavaScript.
8. Run the process with a syntax like this: npm start -- --conf-dir='/Users/sjohnson/Sync/coding/my_x_is_y/nmig/config' --logs-dir='/Users/sjohnson/Sync/coding/my_x_is_y/nmig/nmig_logs'

**Note**: Obviously you need to update your directories as needed.

**Pro Tip 2**: Go into your target database after the conversion and do a count on the same table and compare the results with the above.