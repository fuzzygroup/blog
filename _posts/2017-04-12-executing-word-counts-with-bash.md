---
layout: post
title: Executing Word Counts with Bash
category: bash
tags: ["bash", "linux", "shell"]
description: Stringing together cat, wc, xargs and expr gives a word count tool and a calculation of the printed pages.
---
I'm in the process of starting a new writing project and I wanted to make the process of getting metrics easier so I rolled together this bash script:

    #!/bin/bash
    echo "Word Count:"
    cat *.md | wc -w
    echo "Page Count:"
    cat *.md | wc -w | xargs -I{} expr {} / 250
    
If you're looking to do this yourself then these commands all go into a single text file and a chmod +x command on the file makes it executable.  

Here's the output of this script:

    ./wordcount
    Word Count:
        3827
    Page Count:
    15
    
The interesting tool here is **expr** which is a command line math tool.  The 250 is a metric that I use for the number of words per printed page.  I know in the modern era that a printed page is perhaps a bit of an anachronism but I find it very comforting to know that I wrote 15 pages today (which is what I actually turned out today).
    
What this does is:

* take a collection of markdown files 
* count all the words in the collection of markdown files
* count all the words in the markdown files and then feed that value into xargs which then feeds the value into expr and divides it by 250

# Cross References:

Here are the places where I sourced some of these techniques:

* [Executing word counts using cat and wc](cat *work* | wc -w)
* [An example using using Xargs to feed into expr](http://stackoverflow.com/questions/13182070/best-way-to-divide-in-bash-using-pipes)