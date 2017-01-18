---
layout: post
title: Porting Your MySQL Database to Amazon AWS - RDS or Your Own Db Server
---
Amazon RDS Aurora - db.t2.medium - aurora: $0.082 - 1.968 - 718.32 / year (THIS OMITS STORAGE)
Amazon RDS MariaDB - db.t2.micro - micro maria $0.017 - 0.408 - 148.92 / year
Amazon Your Own Instance - 

$717.03 / MONTH for 3.3 tb of t2.medium aurora at 5% utilization

PageDataPro - 573G
gPlusData - 115G
AppDataPro - 2.5T

RDS Storage costs for 3.3T

$328 for Maria DB for 3.3TB
$390 for RDS Aurora for 3.3 TB

Usage doesn't make that much difference - 1 hour per day usage takes the price from 390 down to 332

http://calculator.s3.amazonaws.com/index.html

More expensive to leave it in S3 then put it in a functional db server

It is actually $365 per month if we put up our own DB server just to host 3.3 tb of databases

https://blog.cloudability.com/aws-s3-understanding-cloud-storage-costs-to-save/



here is a Reset All button in the upper left of the calculator.  $77.61 for 3.3 tb of data in S3
sounds about right, i got $75.9 with a calculator based on their latest pricing docs
and $13.2 for glacier
cool.  thx.
infrequence is about half of the standard price
*nt
still a lot cheaper over time do the HD unless you do glacier, then $150ish for a year isn't too bad

327 to have it in a 5% utilization db 
328.74 to have 3.3 TB of mysql storage in a t2.medium

Learnings:
* the instance type doesn't matter that much for RDS at least at the low end
* storage is very expensive
* utilization doesn't matter much


https://aws.amazon.com/ec2/pricing/on-demand/

https://aws.amazon.com/rds/pricing/


[1/17/17, 10:58:23 AM] J. Scott Johnson: we need about 3.3 tb of storage to do this and even with a bare bones instance on RDS - 717 / month | $718 on our own instance.
[1/17/17, 11:05:25 AM] J. Scott Johnson: It is actually $365 per month if we put up our own DB server just to host 3.3 tb of databases
[1/17/17, 11:06:25 AM] J. Scott Johnson: Given that there is no backups / no redundancy w/ our own server RDS is likely a better choice; just wondering if it is worth it at all.
[1/17/17, 11:08:45 AM] J. Scott Johnson: $77.61 / month if we just leave 3.3 TB of data in the S3 folders.  Cheapest thing would be to backup the data to S3, load it to RDS to confirm the validity fo the backups and hten discard the RDS instance.
[1/17/17, 11:13:13 AM] J. Scott Johnson: $45 / month if S3 access is “infrequent”  no clue what that means or how to do it.