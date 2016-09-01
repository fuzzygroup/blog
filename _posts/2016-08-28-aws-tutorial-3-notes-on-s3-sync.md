---
layout: post
title: AWS Tutorial 3 - Notes on S3 Sync
category: aws
tags: ["aws", "mariadb", "mysql", "s3"]

---
NOTE: Please Read [Tutorial 4](https://fuzzygroup.github.io/blog/2016/08/28/aws-tutorial-4-rds-data-loading-into-aurora-run-in-circles-scream-and-shout-the-oh-shite-moment.html) Before Continuing with This One.

So in past two tutorials I've focused on moving MySQL databases to AWS via this process:

* mysqldump at the table level
* sync up to S3
* pull down on your AWS instance
* load into your db server

And this has worked very, very well for me but it hasn't been without its level of mental trauma.  Like anyone who works with data, I find the process of moving it around to be **beyond scary**.  That's where records get lost and badness happens.  Here's what I've learned about S3 and, in particular, the s3 sync command:

* *Region.*  You absolutely, positively, definitely want to make sure you s3 bucket is in the same region as your ec2 instance.  This will dramatically speed transfer rates and it is easy to get wrong.  If your AWS account is rooted in say us-east-1 and you are putting servers into us-west-2 (oregon) since its cheaper, unless you explicitly, make sure your bucket is in us-west-2, it will end up in us-east-1.  
* **Tool.**  [Panic's Transmit](https://panic.com/transmit/) is a fantastic tool for watching what is going on.  Like all Panic products it is worth paying for.
* **Names.**  Legal characters in bucket names vary from region to region.  This is weird but true.  For example you can use _ in us-east-1 but not in us-west-2 where you need to use - instead.
* **Inconsistency.**  There is weirdness in aws s3 operations that I have encountered.  I suspect that this is me not AWS but I'm still learning.  For example you can do an *aws s3 ls* without specifying the region but not a write operation like sync or cp.  However, now that I think about it, I wonder if that was me and how I configured the client rather than S3.  Not sure but it really threw me when I encountered it.
* **Dump Options.**  Here is an example of the recommend mysqldump options: *mysqldump -uroot -p db_name table_name --order-by-primary --compress > filename.sql*
* **Size.**  Files over 100 gigs are problematic.  If you have a table dump beyond 100 gigs then you need to break it up.  This can easily be done with the unix split command.  Here's how I did it:
  * mysqldump login password db table options > filename.sql 
  * Now where ever you dumped the file make a directory below it and change into that directory then type
  * split ../filename.sql 
  * this will create a ton of roughly 1 gig files in the directory named starting with an x like xaa xab xac and so on
  * configure your aws client with *aws configure* and specify the region correctly
  * create an s3 bucket like this: *aws s3api create-bucket --bucket banks-production-db*
  * Use a sync operation to move the bulk of your files to the s3 bucket like this: *aws s3 sync . s3://banks-production-db --region="us-west-2"*
  * When you have a lot of files (like a 100 plus because your dump is 120 gigs) and you use an aws s3 sync operation it seems to get confused at the end and the last handful of files will not get transfered.  Then when you exit with ctrl+c, more terrifyingly, you will get errors.  That's ok.  Figure out what file didn't get transferred and use a cp command like this:  *aws s3 cp xfc s3://banks-production-db --region="us-west-2"*
  * Once all the data is transfered shut down your sync operation (you likely have already) and login to your ec2 instance where you want the data and pull it down with a corresponding sync operation.  I'd generally recommend a new directory for clarity's sake.
  * Here's the corresponding reverse aws sync: *aws sync s3://bucket . --region="us-west-1"*
  * When its done shut off the sync client and create a new directory below where the data is and change into it.  Then give this command: *cat ../x**   Yep.  That's right you reverse a split with nothing more than cat.  This is classic Unix magic and we all now need to recite as a mantra "I'm not worthy".  *chuckle*
  * At the end you should now have a single file which you can feed into mysql itself.  If you need the original table name since all of this jiggery pokery made you forget it then you just need to view the file with less and look near the beginning for the table name.
  * A quick mysql -uroot -p db_name < path/file.sql and you'll be done
  
Note 1: I know that was a ton of steps and in 2016 it doesn't feel like this should be necessary.  It shouldn't but I find it vastly preferable to monkeying with MySQL replication.  I'm sure there either are or could be tools that make this better but I found that understanding the low level aspects of what's going on here was pretty important to my own sanity so I did it the hard way.  If this data migration fails then I'm the one who has to clean it up so I wanted to be absolutely certain that I understood it in full.

Note 2: This has been extensively tested with Amazon RDS and Aurora in specific.  No issues there; RDS rocks and Aurora is amazing.

Note 3: If you're going to use the split / cat approach make 100% certain that number of files on the source machine is equal to the number of files on the target machine (ls -l | wc -l).  If the sync operation gets stalled out you might find a file or 3 missing and the error messages are not helpful.