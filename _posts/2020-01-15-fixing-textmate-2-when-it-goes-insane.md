---
layout: post
title: Fixing TextMate 2 When It Goes Insane
category: textmate
tags: ["textmate"]
---
{% pizzaforukraine  %}

If you find that TextMate won't start up or if it does that you can't type and it won't respond to commands then this is a sign that TextMate's startup data has gotten hosed.  What you need to do is:

1. Locate where TextMate [stores its unsaved documents](https://fuzzyblog.io/blog/text/2017/10/08/forensic-computing-1-finding-textmate-untitled-documents.html).  For me this is ls -l /Users/sjohnson/Library/Application\ Support/TextMate/Session/
2. Change to this directory using cd.
3. Create a new directory in this location such as temp1.
4. Do a mv of everything into the new directory.
5. Kill off the TextMate process.
6. Relaunch it.

Here's what the end result of this should be:

     ls -l /Users/sjohnson/Library/Application\ Support/TextMate/Session/ 
    total 536
    -rw-r--r--   1 sjohnson  staff  90428 Jan 16 04:19 Info.plist
    drwxr-xr-x  74 sjohnson  staff   2368 Dec 10 09:40 temp1
    -rw-r--r--@  1 sjohnson  staff      4 Dec 26 10:51 untitled 10.txt
    -rw-r--r--@  1 sjohnson  staff   6921 Dec 26 11:31 untitled 11.txt
    -rw-r--r--@  1 sjohnson  staff     79 Dec 26 14:19 untitled 12.txt
    -rw-r--r--@  1 sjohnson  staff    647 Dec 27 08:07 untitled 13.txt
    -rw-r--r--@  1 sjohnson  staff    741 Dec 30 12:21 untitled 14.txt
    -rw-r--r--@  1 sjohnson  staff    226 Dec 30 14:09 untitled 15.txt
    -rw-r--r--@  1 sjohnson  staff     85 Dec 30 14:08 untitled 16.txt
    -rw-r--r--@  1 sjohnson  staff    635 Dec 30 21:03 untitled 17.txt
    -rw-r--r--@  1 sjohnson  staff    776 Jan  7 05:22 untitled 18.txt
    -rw-r--r--@  1 sjohnson  staff   5125 Jan  7 05:28 untitled 19.txt
    -rw-r--r--@  1 sjohnson  staff    803 Dec 12 23:30 untitled 2.txt
    -rw-r--r--@  1 sjohnson  staff   1949 Jan  7 13:05 untitled 20.txt
    -rw-r--r--@  1 sjohnson  staff   5367 Jan  7 13:20 untitled 21.txt
    -rw-r--r--@  1 sjohnson  staff    326 Jan  7 15:24 untitled 22.txt
    -rw-r--r--@  1 sjohnson  staff     16 Jan  8 01:43 untitled 23.txt
    -rw-r--r--@  1 sjohnson  staff     44 Jan  9 14:22 untitled 24.txt
    -rw-r--r--@  1 sjohnson  staff   3635 Jan 10 00:28 untitled 25.txt
    -rw-r--r--@  1 sjohnson  staff      8 Jan 10 15:10 untitled 26.txt
    -rw-r--r--@  1 sjohnson  staff   7245 Jan 10 17:26 untitled 27.txt
    -rw-r--r--@  1 sjohnson  staff    277 Jan 11 05:22 untitled 28.txt
    -rw-r--r--@  1 sjohnson  staff    497 Jan 12 06:03 untitled 29.txt
    -rw-r--r--@  1 sjohnson  staff    244 Dec 18 18:25 untitled 3.txt
    -rw-r--r--@  1 sjohnson  staff    672 Jan 13 20:25 untitled 30.txt
    -rw-r--r--@  1 sjohnson  staff  10420 Jan 14 07:12 untitled 31.txt
    -rw-r--r--@  1 sjohnson  staff     30 Jan 14 20:10 untitled 32.txt
    -rw-r--r--@  1 sjohnson  staff     36 Jan 14 22:19 untitled 33.txt
    -rw-r--r--@  1 sjohnson  staff    645 Jan 14 22:43 untitled 34.txt
    -rw-r--r--@  1 sjohnson  staff   1377 Jan 15 04:12 untitled 35.txt
    -rw-r--r--@  1 sjohnson  staff    732 Jan 15 04:08 untitled 36.txt
    -rw-r--r--@  1 sjohnson  staff    443 Jan 15 07:04 untitled 37.txt
    -rw-r--r--@  1 sjohnson  staff   2273 Jan 15 08:21 untitled 38.txt
    -rw-r--r--@  1 sjohnson  staff    187 Dec 17 06:48 untitled 4.txt
    -rw-r--r--@  1 sjohnson  staff   1045 Dec 20 06:50 untitled 5.txt
    -rw-r--r--@  1 sjohnson  staff     19 Dec 20 15:21 untitled 6.txt
    -rw-r--r--@  1 sjohnson  staff    842 Dec 21 03:32 untitled 7.txt
    -rw-r--r--@  1 sjohnson  staff     79 Dec 23 11:11 untitled 8.txt
    -rw-r--r--@  1 sjohnson  staff     31 Dec 23 16:50 untitled 9.txt
    -rw-r--r--@  1 sjohnson  staff    375 Dec 10 17:22 untitled.txt
    
    
The file Info.plist is an xml registrry 