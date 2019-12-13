---
layout: post
title: Using Xargs to Get Past Argument List Too Long
category: linux
tags: ["linux"]
---
{:.center}
![IMG_9162.jpeg](/blog/assets/IMG_9162.jpeg)

This one is a quick one.  I have about 25,000 files in a directory that I need to grep across.  I tried:

    grep '"class":0' *.json | more
    zsh: argument list too long: grep

That's a problem because when the argument list is too long, nothing can happen.  The solution here is a combination of find and xargs, specifically:

    find . -name '*.json' | xargs grep '"class":0'

Here's the output from this:

    ./davidson-data-266118b4178f11ea80474c3275928de7.json:{"count":3,"hate_speech":3,"offensive_speech":0,"neither":0,"class":0,"tweet":"\"@JPantsdotcom @Todd__Kincannon @the__realtony I'm partial
    
You should be able to use an approach like this:

    find -name '*.json' -exec grep '"class":0' 
    
but the embedded grep in find doesn't accept that and fails with this error:

    find: illegal option -- n
    usage: find [-H | -L | -P] [-EXdsx] [-f path] path ... [expression]
           find [-H | -L | -P] [-EXdsx] -f path [path ...] [expression]
           
The closest that I can get to make this work is:

    find . -name '*.json' -exec grep 'class' {} +
    
and that's not an exact match so, sigh.  

If we return to the original approach and add a -l option flag then we can list only filenames:

    find . -name '*.json' | xargs grep -l '"class":0'
    
## See Also

* [Stack Overflow on Xargs](https://askubuntu.com/questions/833128/what-does-xargs-grep-do)
* [Stack Overflow on Grep](https://stackoverflow.com/questions/6637882/how-can-i-use-grep-to-show-just-filenames-on-linux)
* [Argument List Too Long](https://unix.stackexchange.com/questions/128559/solving-mv-argument-list-too-long)