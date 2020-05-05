---
layout: post
title: How to Find the Latest Version of a File on OSX Using mdfind
category: osx
tags: ["osx"]
---
{:.center}
![IMG_3178.jpeg](/blog/assets/IMG_3178.jpeg)

I recently wanted to find the latest version of a library I wrote and I started by using mdfind:

    mdfind -name select_page_parser.rb
    
I then added xargs per this article:

    mdfind -name select_page_parser.rb -0 | xargs -0 ls -t