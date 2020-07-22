---
layout: post
title: AWS SQS Pro Tip - Lower Your Costs By Batching Up Data
category: aws
tags: ["aws", "sqs", "data_pipeline"]
---
{:.center}
![IMG_3826.jpeg](/blog/assets/IMG_3826.jpeg)


This one is a short one but a good one.  I've been using SQS (disclaimer -- I love SQS) lately for a large scale data pipeline.  We are processing literally billions of small JSON blobs and in our cost modeling, we initially came up with an estimate that made SQS something that we couldn't use because of the number of JSON blobs.  And then one of our people, thank you Don Neufeld, came up with the idea of **batching** up the JSON blobs and having SQS give us a batch that we could process.

And while this did complicate our queue processing a bit, it made SQS cost effective.  Here were the key things:

1. When we initially loaded the queue, we measured each blob's length and then built an array of blobs until we were just below the maximum packet size, 256_000 bytes.
2. We then serialized the array into JSON and gave that JSON to SQS.
3. Our routine which read things back off the queue looked something like this:

```python
messages = sqs_client.receive_message(QueueUrl=input_queue.url, MaxNumberOfMessages=MAX_QUEUE_MESSAGES)
if 'Messages' in messages: # when the queue is exhausted, the response dict contains no 'Messages' key
    for message in messages['Messages']: # 'Messages' is a list
        message_bodies = json.loads(message['Body'])
        for json_str in message_bodies:
```

Yes this was a bit more overhead but it has worked tremendously well and let us take full advantage of SQS without running up a huge bill.  Recommended.