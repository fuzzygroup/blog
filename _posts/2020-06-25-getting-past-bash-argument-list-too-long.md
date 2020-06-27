---
layout: post
title: Getting Past Bash Argument list too long
category: bash
tags: ["bash", "linux"]
---
{:.center}
![IMG_3700.jpeg](/blog/assets/IMG_3700.jpeg)


Right now I have a directory with about 750,000 odd files in it and any attempt to manipulate the files results in this:

    root@ip-172-31-1-219:~/datastreamer/data# mv * /home/ubuntu/data/data
    bash: /bin/mv: Argument list too long

My first challenge was to do this:

    chown ubuntu:ubuntu *
    
And the fix for this one was actually easy:

    chown ubuntu:ubuntu .
    
By omitting the *, the bash limits on argument list don't apply -- this changes the current folder (.) and everything in it and it always works. 

The second challenge was to move the files from /root/datastreamer/data to /home/ubuntu/data/data.  Here's the solution after a bit of research:

    find /root/datastreamer/data -name '*.json' -exec mv {} /home/ubuntu/data/data \;

## Reference:

* [Unix.StackExchange](https://unix.stackexchange.com/questions/128559/solving-mv-argument-list-too-long)
* [StackOverflow](https://stackoverflow.com/questions/17188292/list-too-long-to-chmod-recursively)