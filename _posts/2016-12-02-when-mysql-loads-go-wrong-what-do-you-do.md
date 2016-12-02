---
layout: post
title: When MySQL Loads Go Wrong - What Do You Do?
category: mysql
tags: ["mysql"]
---
This piece is the natural follow on to my [Adventures in Partition Resizing](https://fuzzygroup.github.io/blog/aws/2016/11/26/fear-and-loathing-in-awsville-or-adventures-in-partition-resizing.html) epic.  At this point our systems still aren't fully back up yet and, well, it tastes like ashes.  Like a lot of hard core techies I tend to internalize the state of my system and when its not right, well, things suck for me.  

The current state of things is that out of 187 tables that needed to be migrated over, we're down to the last one -- big number 187 and nothing appears to be happening.  All I see at the console is the same thing I've seen for over 24 hours:

    ubuntu@ip-172-31-43-176:~$ mysql -uappdata -pSOMEPASSWORD foo_production < /mnt/old2/foo2016_m2s.sql

And it just sits there.  Sigh.  Figuring out the next logical step means that you need to wrap your head around the quirky aspects of the MySQL load architecture.  Happily this isn't the first time for me so here goes.

# Step 1 - SHOW FULL PROCESS LIST;

When you have a large table coming in the command line like this, well, MySQL gets seriously weird.  You can't select a row to see the status.  The best you can do is a SHOW FULL PROCESS LIST which makes the system go nuts.  Seriously - try it sometime.  What you get is an enormous SQL dump showing what's being loaded and since it scrolls by at like 90 miles per hour, well, that's not helpful.  Here's a little trick tho:

    pager less;
    SHOW FULL PROCESS LIST\G

And this will give you something like this:

    *************************** 1. row ***************************
          Id: 257
        User: appdata
        Host: localhost
          db: foo_production
     Command: Query
        Time: 0
       State: update
        Info: INSERT INTO `foo2016_q1s` VALUES (240213,'2016-03-16 21:14:57','2016-
        
Given that there 927,040 records in this table what this has shown us is that after 36 hours or so we're only 1/4 of the way thru.  Press ESC and run SHOW FULL PROCESS LIST a few times to make sure that id value keeps changing to get confirmation that the load is continuing.

The only problem is that what I just wrote above may **NOT** be reliable -- emphasis on the **NOT**.  Here's what I just got when I ran it again:

    Id: 257
        User: appdata
        Host: localhost
          db: banks_production
     Command: Query
        Time: 0
       State: update
        Info: INSERT INTO `foo2016_q1s` VALUES (406347,'

There's no way that roughly 200K records went in while I was writing two paragraphs so what we now know is that SHOW FULL PROCESS LIST tells you that the load is proceeding but it may be **utterly useless** as a monitoring tool.  Deep, Deep Sigh.

# Step 2 - DESC foo2016_m2s

The next logical step is to check the schema to make sure nothing weird is going on.  This can be done with:

    DESC foo2016_m2s;
    
In MySQL checking the schema tells you nothing about the index structures so you can check those with:

    SHOW CREATE TABLE foo2016_m2s;
    
My guess is that you won't learn anything from these operations but this is step by step, high value debugging so you check everything.

# Step 3 - Options

The logical next step would be to:

* stop the load
* delete the last record as it might not be complete
* find the last id (thank heavens that ids are sequential)
* re-dump from the original source table from the last record + 1 forward
* re-import

If, Great Ghu Help Us, we find that stopping the load means that there isn't any data in the table then the next step would be:

* Export from the original source in say 100K record chunks
* Import the first one and see what happens
* Import the next one and see what happens
* Think carefully if we want to proceed sequentially or move to loading files in parallel; if the issue is bad data somewhere in a load file then parallel is a bad, bad, bad idea.
    
# Step 4 - Patience

Happily, whilst writing this screed, I looked up and noticed "oh hell -- it finished!".  And that's the happiest of all results.  Hopefully what this post illustrates is how to tackle long running load processes even if I didn't have to act on any of them.