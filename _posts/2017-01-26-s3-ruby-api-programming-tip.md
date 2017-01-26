---
layout: post
title: S3 Ruby Api Programming Tip
category: aws
tags: ["aws", "ruby", "s3"]
description: Here's a quick tip on programming to the AWS S3 api with Ruby and the aws-sdk gem.
image: http://fuzzyblog.io/blog/assets/ruby_aws_s3.png
---
![ruby_aws_s3.png](/blog/assets/ruby_aws_s3.png)

So I find myself dealing with a backup to a data center that I am decommissioning and while the ultimate backup solution is going to involve hard drives onto which about 6 terabytes of MySQL tables are stored, I want to get at least a sizable portion of this into the cloud as soon as possible.

Given my [public advocacy position](http://fuzzyblog.io/blog/aws.html) in favor of AWS, S3 is clearly the cloud storage that I'm going to use.  I've spent the better part of the past two weeks writing a backup tool, with Nick's able assistance, that can:

* take a large database
* decompose it into tables
* dump each table
* split the tables into manageable size using split
* gzip those split files
* move those split files up to s3
* delete its working data as it goes since we only have a fraction of the disc space needed to do this in large (about 10% of the 3 tb for our largest database)

Its currently standing at 570 lines of moderately elegant ruby code and its been an interesting exercise in really getting to know how to use the aws-sdk gem and its S3 functionality.

Here's a quick overview of the steps in using the S3 gem with Ruby under Linux. You should note that all of this has been done in the context of a command line tool under straight ruby.  I suspect its directly portable to Rails but I haven't tested that.

1.  Start by installing the AWS cli with: **sudo apt-get install awscli**
2.  Configure your credentials with: **aws configure**.  This writes a ~/.aws/credentials file that the ruby gem knows how to read.  And that's brilliant because the credentials then are NOT stored in your code and can't be leaked through a repo becoming public.
3.  Since you're missing Rails and the dynamic include structure, you have to do load the gem with these two statements: **gem 'aws-sdk'; require 'aws-sdk'; **
4.  You have to create an s3 instance with a command like this: **@s3 = Aws::S3::Resource.new(region:'us-west-2')**

Here is the official documentation on the [s3 instance](http://docs.aws.amazon.com/sdkforruby/api/Aws/S3/Object.html).

After that you can call methods like this:

> obj = @s3.bucket(bucket).object(name_in_s3)

As long as the variables bucket and name_in_s3 are set this will return back to you an instance that you can work with.  The mistake that I made was trying to get the size of an object with .content_length when the underlying data had not yet been transferred up to S3.  I was testing the existence of the object with:

> if obj

after I had created the object and I assumed that it was ensuring that the object already existed.  In fact what I needed to do was this:

> remote_size = obj.content_length if obj.exists?

The reason for this is apparent if you *think* about it.  You have to build the object in order to transfer data to it so you're going to have an actual object before you even transfer the data.  This reminds me so, very very vividly of [Spolsky on Leaky Abstractions](https://www.joelonsoftware.com/2002/11/11/the-law-of-leaky-abstractions/) and his 2002 rant on why you don't abstract long running network operations and try and make them be exactly the same as fast running local operations.  