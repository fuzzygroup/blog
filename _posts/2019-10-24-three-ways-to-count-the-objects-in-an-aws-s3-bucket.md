---
layout: post
title: Three Ways to Count the Objects in an AWS S3 Bucket
category: aws
tags: ["aws", "s3"]
---
{:.center}
![IMG_7776.jpeg](/blog/assets/IMG_7776.jpeg)

AWS S3, "simple storage service", is the classic AWS service.  It was the first to launch, the first one I ever used and, seemingly, lies at the very heart of almost everything AWS does.  

Given that S3 is essentially a filesystem, a logical thing is to be able to count the files in an S3 bucket.  Illustrated below are three ways.

## Method 1: aws s3 ls 

S3 is fundamentally a filesystem and you can just call ls on it.  Yep -- ls in the cloud.  **blink**

    aws s3 ls s3://adl-ohi/ --recursive --summarize | grep "Total Objects:"
    Total Objects: 444803

## Method 2: aws s3api 

And since S3 is a modern filesystem, it actually has an API that you can call. Yep -- a json api.  **blink** **blink**

    aws s3api list-objects --bucket adl-ohi --output json --query "[length(Contents[])]"
    [
        448444
    ]

## Method 3: A Python Example

Naturally you can just run code to do all this.  I started with an example from the Stack Overflow link below that was written for boto and upgraded it to boto3 (as still a Python novice, I feel pretty good about doing this successfully; I remember when Ruby went thru the same AWS v2 to v3 transition and it sucked there too).  I also learned how to dynamically introspect methods from Python objects as part of this debugging cycle.

```python
#!/usr/local/bin/python

import sys
import boto3

s3 = boto3.resource('s3')
s3bucket = s3.Bucket(sys.argv[1])
size = 0
totalCount = 0

for key in s3bucket.objects.all():
    totalCount += 1
    size += key.size

print('total size:')
print("%.3f GB" % (size*1.0/1024/1024/1024))
print('total count:')
print(totalCount)
```

which gives output like this:

    python3 scratch/count_s3.py adl-ohi
    total size:
    0.298 GB
    total count:
    486468

**Note**: I have a live upload happening on another machine so the numbers do change and that's actually fine.

## References

* [Stack Overflow on This](https://stackoverflow.com/questions/2862617/how-can-i-tell-how-many-objects-ive-stored-in-an-s3-bucket)
* [More Stack Overflow](https://stackoverflow.com/questions/30249069/listing-contents-of-a-bucket-with-boto3)
* [S3 Boto Docs](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html#S3.Client.list_objects)
* [More S3 Boto Docs](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html#client)

