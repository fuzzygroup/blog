---
layout: post
title: Redis Quick Tip - Purge All Data and Save All Data
category: redis
tags: ["redis", "docker"]
---
[Redis](redis-quick-tip-purge-all-data.md) is a memory backed, key value store, non-sql database / in memory data structure store that plays a crucial role in just about any Internet app.  Often you need to purge all the information in Redis.  Here's an easy command line way to do this:

> redis-cli flushall

Thanks to [Stack Overflow](https://stackoverflow.com/questions/6851909/how-do-i-delete-everything-in-redis) for providing the answer.

Now the inverse of flush all is to force a save to disk and you do this with:

> redis-cli save

Thanks to my friend [Nick Janetakis](http://www.nickjanetakis.com/blog/) for answering this for me via chat.

Now if you were running a docker based system managed with Docker Compose and you wanted to wrap these in shell scripts you deploy with your system then you might have something like this (adjust for your own system):

Save to dredisflush

    #!/bin/bash
    
    echo "This will flush all redis data on this subsystem" 
    
    read -p "Press enter to continue"

    docker-compose -f docker-compose.production.yml web exec -T redis-cli flushall
    
Save to dredissave

    #!/bin/bash
    
    echo "This will flush all redis data on this subsystem" 
    
    read -p "Press enter to continue"

    docker-compose -f docker-compose.production.yml web exec -T redis-cli save