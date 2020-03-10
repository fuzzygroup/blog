---
layout: post
title: Casting in Python and Redis
category: python
tags: ["python", "redis"]
---
I recently had this situation in [Python and Redis](https://redislabs.com/lp/python-redis/):

    redis.lpush(kafka_topic_name, current_filename)
    redis.exceptions.ResponseError: WRONGTYPE Operation against a key holding the wrong kind of value

So I did my normal deal of debugging by adding:

    import pdb

and then a:

    pdb.set_trace()

before the lpush call and I tried it manually by typing out *redis.lpush(kafka_topic_name, current_filename) ENTER* and it, naturally, worked fine.  *Grumble*. What I finally ended up doing is wrapping a str() call as follows:

    redis.lpush(str(kafka_topic_name), (current_filename))
    
And that let things work correctly.  In talking with another Python programmer, we came to the conclusion that Python's auto casting of things between [byte literals and strings](https://stackoverflow.com/questions/6269765/what-does-the-b-character-do-in-front-of-a-string-literal) was the culprit.  Wrapping a str() call around both the list name and the list value solved things nicely.

**Note**: I figured this out by moving from a **lpush** operation on Redis to a **sadd** operation and then retrieving back a single entry which showed me the Python b prefix: 

    b'/Users/sjohnson/Sync/fuzzygroup/adl/ohi_kafka/experts-all/data/twitter/25400bcd1142564b4476c178935bd736.json'
    

## Also - Don't Forget About Unicode

I dug into this further and a least part of this issue for string conversion from Python byte ranges into actual strings is that you need to use a 

    current_filename.decode("utf-8")

call because the Python byte range has no idea what the encoding was.  Now I will admit that I'm surprised that Python didn't realize "Ok we're reading data from the filesystem's dir() operation" and it is OS-X so the encoding must be XYZ (utf-8 I would think).  Here's an example of this:

    >>> import sys
    >>> sys.stdout.encoding
    'UTF-8'

And since my coworker on this project uses Linux, I guess I need to embed that into my application (note - it isn't 100% clear to me that sys.stdout.encoding is the same as the encoding of the filesystem's directory output; there is also the  sys.setdefaultencoding('utf-8') call).

See Also:

* [Stack Overflow 1](https://stackoverflow.com/questions/27848037/python-unicodedecodeerror-while-listing-directory)
* [Stack Overflow 2](https://stackoverflow.com/questions/606191/convert-bytes-to-a-string)
* [Related Python Bug Report](https://bugs.python.org/issue17860)

## Sidebar: Deleting a Redis List

As you might imagine, this type of error led me to creating a number of redis lists with bad data. There isn't an explicit delete command in Redis which gives two work arounds:

* Iterate over the list and simply pop everything off; at the end the list goes away
* [Rename the list](https://www.redisgreen.net/blog/deleting-large-lists/)