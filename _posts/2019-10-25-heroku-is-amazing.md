---
layout: post
title: Heroku Is Amazing or Fixing INSERT command denied to user (MySQL)
category: heroku
tags: ["rails", "heroku", "mysql"]
---
{:.center}
![sifry_london_market.jpg](/blog/assets/sifry_london_market.jpg)

{:.center}
Photo courtesy of my boss and friend, Dave Sifry who is in London right now attending MozFest; lucky guy!

## Part 1: Heroku Rocks

I've been using Heroku quite a lot recently: 

* It is currently running my side project
* I built a trial project purely to confirm that I knew how to deploy onto Heroku and then deployed it in just an hour or two
* I deployed a proof of concept app for my day gig onto it that's pretty substantial

Overall I've never had such a seamless deploy experience using Rails as I've had with Heroku.  And I when I say seamless, I mean "you can build a Rails app and deploy it in just a few hours".  Twelve plus years of Rails and I've never had such an easy time deploying things.  

I was very, very skeptical of the Heroku git push style deployment for a long, long time and I have to admit:

> I was wrong!  Amazingly wrong!

I have always come at deployment from a traditional, heavy weight model.  And to have deployment not really be an issue is just shocking.

This isn't to say that Heroku is perfect, it isn't -- but it is damn **amazing**.  Recommended.

## Part 2: This is How Cloud Computing Was Supposed to Work

Now, with the laudatory statements aside, I did hit an interesting bug / issue in Heroku today.  I use Heroku with MySQL because, well, I've put terabytes of data into MySQL over the years and it has never let me down.  Today tho I got this weirdness:

     mysql -ua_user_name -pa_passowrd a_database --host=a.rds.host.amazon.com < lib/tasks/data/db_dumps/police_crawl_development_2019-10-25.sql
     
    ERROR 1142 (42000) at line 40: INSERT command denied to user 'cbneustt0on66p30'@'208-70-45-211.bb.hrtc.net' for table 'ar_internal_metadata'

My first thought was that the database instance wasn't fully logically isolated from others and I used --ignore-table to not export ar_internal_metadata.  And, clearly, that was a stupid idea because it just failed on the next table.  I did some digging and ended up on an obscure Stack Overflow page which said something to the effect that "Heroku limits your space, perhaps you just have had your insert permissions disabled because you are out of space".  So I logged into MySQL remotely and got:

    MySQL [q0seyczrkn0dptvs]> show grants;
    +--------------------------------------------------------------------------------------------------+
    | Grants for a_user@%                                                                              |
    +--------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'cbneustt0on66p30'@'%'                                                     |
    | GRANT SELECT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES,   |
    | TRIGGER ON `something`.* TO 'a_user'@'%'                                                         |
      +------------------------------------------------------------------------------------------------+
    2 rows in set (0.04 sec)

Jinkies!  My insert permission is gone!  So I logged into the Heroku dashboard and upgraded the MySQL addin from the baseline - which only gives you 5 mb of data - to the $10 / month option which gives you a full gigabyte and then I re-ran my show grants query and got:

    MySQL [q0seyczrkn0dptvs]> show grants;
    +------------------------------------------------------------------------+
    | Grants for cbneustt0on66p30@%                                          |
    +------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'cbneustt0on66p30'@'%'                           |
    | GRANT ALL PRIVILEGES ON `q0seyczrkn0dptvs`.* TO 'cbneustt0on66p30'@'%' |
    +------------------------------------------------------------------------+
    
When we talk about cloud computing, this is how it was supposed to work -- you can get started easily and then buy facilities on the fly as you need them.  And I get that this is similar to AWS but AWS is selling a more raw level of service.  Heroku is tightly coupled into the tooling ecosystem so it just takes your application and makes it work.  With AWS I can still buy capacity dynamically but I have to work to make use of it.

In closing, I can take some issue with the crappy nature of the error message and the fact that I had to google around to figure this out but their underlying way of handling it (just take away the INSERT permission when you don't have any more space) was just plain **elegant**.

**Heroku**.  Absolutely, positively recommended.  