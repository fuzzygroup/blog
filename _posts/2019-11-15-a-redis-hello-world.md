---
layout: post
title: A Redis Hello World in Ruby and Python
category: redis
tags: ["redis", "ruby", "python"]
---
{:.center}
![IMG_9955.jpeg](/blog/assets/IMG_9955.jpeg)

A colleague just IM'd me and asked if I have a Hello World for redis and my thought was "No but I can damn well blog one together quick as all get out" so ...

The thing to understand about Redis is that you can use it in two ways:

1. As a simple key value store, a nosql database if you like.
2. As a data structure server.  I don't do this much but I am in absolute awe of people who have internalized the Redis data model sufficiently to do this.  The reason for bringing up this point, when I'm not going to cover it is that any developer ought to keep in mind the capabilities of their tools -- and Redis is hugely capable.  And if you think that I'm full of crap with what Redis can do with you, may I direct you to [HyperLogLog](https://thoughtbot.com/blog/hyperloglogs-in-redis).  

## Hello World in Redis using Ruby

The canonical Hello World for redis is using it as a key value store.  Here's an example from Ruby:

In Gemfile:

```ruby
gem 'redis'
```

In console:

```ruby
require 'redis'

2.6.3 :005 > redis = Redis.new
#<Redis client v4.1.3 for redis://127.0.0.1:6379/0>
2.6.3 :006 > redis.set("mykey", "hello world")
"OK"
2.6.3 :007 > redis.get("mykey")
"hello world"
```

Here's the explanation:

1.  We bring in the Redis gem / class.
2. We create a Redis object.  By default Redis runs on localhost at port 6379.  Redis has a quite solid network architecture so you can have a distributed set of servers with the data fetched back from them.
3. The "set" command takes a name and a value and sets them into the underlying data store.
4. The "get" command takes just the name and fetches back the value.

## Hello World in Redis Using Python

And here is exactly the same example in Python:

In requirements.txt:

```python
redis
```

In console:

```python
>>> import redis
>>> r = redis.Redis(host='localhost', port=6379, db=0)
>>> r.set('mykey', 'hello world')
True
>>> r.get('mykey')
'hello world'
```

And you can see that pretty much the exact same explanation applies.  Redis uses a standard set of "verbs" that tend to be implemented similarly across languages.  Salvatore did a brilliant job on Redis and the simplicity of the verbs speaks to that.

## References

* [redis-rb on github](https://github.com/redis/redis-rb)
* [pypi on redis](https://pypi.org/project/redis/)