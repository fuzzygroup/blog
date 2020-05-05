---
layout: post
title: How to Find the Latest Version of a File on OSX Using mdfind
category: osx
tags: ["osx"]
---
<<<<<<< HEAD
{:.center}
![IMG_3178.jpeg](/blog/assets/IMG_3178.jpeg)

=======
>>>>>>> 4cbbc577cf49ce99e5aaf8b73f0396e50651d3a9
I recently wanted to find the latest version of a library I wrote and I started by using mdfind:

    mdfind -name select_page_parser.rb
    
I then added xargs per this article:

    mdfind -name select_page_parser.rb -0 | xargs -0 ls -t