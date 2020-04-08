---
layout: post
title: The Two AWS RDS Postgres Errors I Always Make
category: aws
tags: ["aws", "rds"]
---
{:.center}
![IMG_2997.jpg](/blog/assets/IMG_2997.jpg)

You know that awful feeling of **personal stupidity** when you consistently make the same mistake time after time?  Well my approach to addressing that is to document said mistakes, here, each time I make them. Sometimes I take the approach of admitting to them and sometimes I take the approach of just writing them as a blog post.

There are two errors, nay three, I make almost every single time I create an RDS postgres instance and I thought "maybe it is time to write them down and (hopefully) curse less" the next time.  

**Note**: I wrote this as a text post with pictures below so that the quick answers appear first before a whole bunch of screenshots.

## Error 1: Not Creating the Database When you Create the Database Server

When you create a "database" on RDS you are actually creating a database server on which you **then** create the database itself.  Now the core issue here is that AWS makes it very hard, at least when you are making a Postgres database to create that database later.  I'm sure there is a way but, yesterday, in a few hours of messing with this, I never found it.  What I had to do was drop my database server and walk through the creation process again, finally finding it nested away in an expandable section of the user interface.  

When you are walking through the "Create Database" form, there is a final section called "Additional Configuration".   If you expand this then the very first option is "Initial Database Name" along with the *helpful* message:

> If you do not specify a database name, Amazon RDS does not create a database.

Groan.  Keep in mind that this whole feature starts on a web page titled "Create Database" (but the default is to NOT create a database).  

## Error 2: Not Putting the Database Server in the Same VPC

Generally speaking most of us tend to use a single VPC (virtual private cloud) for our AWS boxes.  Despite this it is not guaranteed that your database server ends up in the same VPC as your other boxes unless you explicitly specify this.

## Error 3: Not Putting the Database in the Same Security Group

This one is just as significant as Error #1 -- unless you have your database in the same security group as your other boxes, it can't be easily accessed (if accessed at all).  Make sure that you delete the default security group and then put the security group that you use for your other boxes (the ones that need to access the database) here.

**Note**: I use a highly simplistic approach to AWS security groups.  If you find the paragraph above laughable, well, yes.

## Screenshots from the AWS RDS Creation Process

Shown below are a handful of screenshots from this process.

{:.center}
![aws_rds_01.png](/blog/assets/aws_rds_01.png)

{:.center}
![aws_rds_02_vpc.png](/blog/assets/aws_rds_02_vpc.png)

{:.center}
![aws_rds_03_security_group.png](/blog/assets/aws_rds_03_security_group.png)

{:.center}
![aws_rds_04_additional_configuration_01.png](/blog/assets/aws_rds_04_additional_configuration_01.png)

{:.center}
![aws_rds_05_additional_configuration_02_database_name.png](/blog/assets/aws_rds_05_additional_configuration_02_database_name.png)









