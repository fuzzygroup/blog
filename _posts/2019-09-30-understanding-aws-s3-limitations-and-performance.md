---
layout: post
title: Understanding AWS S3 Limitations and Performance
category: aws
tags: ["aws", "s3"]
---
I'm in the process of planning out a large scale system and one of the things I find myself worrying is obvious but still complex -- **storage**.  This is a data processing system where literally tens of millions of "objects" will be flowing thru the system and one of the design criteria is the need to take any "object" and re-process it from start to finish.  And, as this data is transitory in nature, this means that we need to be able to store the original inputs in the system on an ongoing basis.

**Note**: By "object" I mean something as simple as a comment or as complex as a social media post or a web page.

Given that we have a massive quantity of objects, the question comes up as to how you store tens of millions of variable length objects.  The solution we have come to is to use the AWS S3 storage architecture but is S3 a valid choice?  

Here's the result of digging deeply into S3 as a storage solution:

* S3 divides storage into "buckets" (think directories although a bucket isn't quite a directory)
* S3 supports an unlimited number of objects per bucket
* S3 allows for a biggest object of 5 TB (not an issue for us; we're talking a few K per object)
* S3 supports 3500 puts, posts or deletes per second per bucket
* S3 supports 5000 get requests per second per bucket

At 3,500 posts (i.e. new object creations) per second, a single S3 bucket can support 3,500 * 3,600 new objects per hour or 12,600,000 (12.6 million).  Now that's a maximum and there are always reasons why maximums don't get achieved.

The implication here is that if you have different types of content then you could always use multiple buckets, one per content type in order to achieve better overall throughput.

Also for best performance on S3 operations although Amazon has reduced the need for name randomization (think use hashes for names) for best performance, this likely still makes a difference.  

## More

* **Reference**: [AWS Podcast #260](https://www.stitcher.com/podcast/amazon-web-services/aws-podcast/e/55957353?autoplay=true)
* **Reference**: [S3 and Metadata](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html)
* **Reference**: [AWS Performance and Name Randomization](https://aws.amazon.com/about-aws/whats-new/2018/07/amazon-s3-announces-increased-request-rate-performance/?nc1=h_ls&source=post_page-----aff8e10ab51a----------------------)
* Reference: [Naming S3 Objects](https://medium.com/faun/aws-s3-buckets-whats-in-a-name-aff8e10ab51a)
* **Note**: These performance numbers may have improved since my source is about a year old but I think they are still worthy numbers to benchmark with.
* **Pro Tip**: There are also lots of other excellent S3 tidbits here including that S3 bucket names are really DNS names and while you can use dots (period) characters in S3 bucket names, you really shouldn't as you will hit issues with https (I don't fully understand that).