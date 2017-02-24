---
layout: post
title: Advice on Complex Caching Schemes
category: software_engineering
tags: ["software_engineering", "caching", "aws"]
description: Complex caching schemes always seem to be problematic.  Here I profile a client's conversation with me down to 458 words.
image: http://fuzzyblog.io/blog/assets/elasticache.png
---
It is reputed to have been said:

> There are only two hard things in Computer Science: cache invalidation and naming things. [Link](https://martinfowler.com/bliki/TwoHardThings.html)

Personally I'd generalize this to:

> There are only two hard things in Computer Science: caching things and naming things. (Me/Today)

Or the JWZ variant:

> I had a performance problem so I implemented a cache.  Now I had two problems.  (Me/Today | [JWZ Variant](http://regex.info/blog/2006-09-15/247))

I recently spoke with a client that wanted to implement a fairly complex scheme for caching the results of API operations.  They had a memcached implementation using [AWS ElastiCache](https://aws.amazon.com/elasticache/) and wanted to extend this to CloudFront.  My advice was simple: 

> Hell No!

Any kind of cache is always **finicky** and **hard to debug**.  The more complexity in your caching architecture, the absolutely harder it is to debug and the less likely it is to work reliably.  I've implemented a lot of caches over the years and I've tried to be trickier and tricker and, generally, when I bothered to track cache hits, the trickier ones never seemed to work quite right.  Part of it may have been logic errors and part of it may been misunderstanding how caches get called in this new crazy multi core world but I think my point stands -- *complex caching schemes are hard to get right*. 

Here was my advice to the client:

1.  Use [memcached](https://memcached.org/) solely (as part of ElastiCache); don't bring in cloudfront.  Memcached has that brilliantly simple, automagical cache invalidation where you a) set when the object is available until allowing it to just disappear *automatically* and b) if enough other objects crowd it out, it is expired using a FIFO architecture.  Those two properties make the cache invalidation issues pretty much disappear.
2.  Take the incoming API call params and a) put them in a hash, b) call hash.to_json to get a stringified version, c) call a SHA1 routine on that stringified version.  That gives you a dirt simple cache key that you can store into memcached.
3.  If their implementation of ElastiCache allows having multiple caches then set up a new cache for this new data and separate it logically from the current cache as this is high volume but low value.
4.  If their implementation of ElastiCache doesn't allow multiple caches then simply increase the size of the current cache.  Your goal here is to ensure that this new cache (which is on low value data) doesn't crowd out the current cache citizens (which are higher value data).
5.  Look into their current implementation of ElastiCache and see if they have any metrics on cache hit ratio and the like.

That's 458 words on caching and I could honestly write a book on it but I think I'll stop here.

**Sidebar 1**: (Not part of the 458 words).  If you never watched Brad Danga's video on Live Journal architecture then I absolutely recommend it unfortunately it seems to have expired from YouTube and the best I can do are the [slides](http://danga.com/words/2005_oscon/oscon-2005.pdf) (my favorite version) / [More Slides](http://danga.com/words/).  Brad is my favorite Internet Architect and if he had a baseball card, well, I'd treasure it.  Recommended.

**Sidebar 2**: (Not part of the 458 words).  If you haven't used ElastiCache then I highly recommend it.  It is truly the simplest way you'll ever setup caching infrastructure.  AWS really knocked it out of the park on this one. 
