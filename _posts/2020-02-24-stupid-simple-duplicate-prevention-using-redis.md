---
layout: post
title: Stupid Simple Duplicate Prevention Using Redis
category: redis
tags: ["redis"]
---
{:.center}
![IMG_2004.jpg](/blog/assets/IMG_2004.jpg)

So I just saw this log message popup on a SystemD service I wrote yesterday:

    Feb 24 10:27:11 ip-172-31-24-213 reddit_to_kafka[18391]: Already exists in redis so also in kafka so skipping

Sometimes you need to solve a problem without a lot of effort.  Yesterday I needed to populate a Kafka queue with data and I didn't want to worry about duplicates flowing into it.  Here's what I knew:

* My source wasn't a stream but a set of social media posts that I was monitoring
* I didn't have a database
* I didn't want the overhead of checking a database before I inserted
* Every post had an id that I knew would be unique (if I pre-pended it with the name of the source)

Whenever I have a problem like this, I reach for [Redis](https://redis.io/) almost instinctively.  My stupid, simple solution was as follows:

* create a key i.e. key = "reddit_#{message.id}"
* create a Redis object i.e. redis = Redis.new
* check if the key already exists using redis.exists(key)
* if that check returns true then do nothing
* if that check returns false then add the data and set the key (you want to do this AFTER adding the data in case the add fails; atomicity, even pseudo atomicity is a thing)

The beauty of Redis is that it installs using nothing more than:

    sudo apt-get install redis
    
And that installs a local installation of Redis -- and starts it -- that any process can easily connect to (and there are always language bindings for Redis seemingly).  This easy usability for Redis makes it invaluable for this type of task.

**Note 1**: Given the size of my input source and its frequency, I'm not even going to worry about the number of keys and the fact that this approach is pretty brain dead.  When we get a larger volume data feed, I'll circle back and fix it.  

**Note 2**: It took longer to write this up than it did to actually implement and test this.