---
layout: post
title: OSX argument list too long; Sigh
category: bash
tags: ["osx", "bash"]
---
The longer you do computing, the more you find that the same out issues come up.  I'm currently working on a machine with 16 gigs of RAM and a terabyte of SSD storage but when I list files in a directory, I still get "argument list too long".  The problem here is that I have a series of directories that collectively have 552 gigs of data in them (a crawler I wrote either worked successfully or ran amok; your opinion may vary).  

I woke up this morning and realized that I couldn't move over to my machine the zst archive I needed since it was 15 gigs in size and I had only 24 gigs total (too close to my threshold for my taste).  

I ended up coming up with this command line snippet to address this:

```bash
find . -maxdepth 1 -name '*.html' -delete
```

I had to change into each directory where these files existed and run it one by one.

If I wanted to make this recursive then I could have started in the parent directory tree with this:

```bash
find . -name '*.html' -exec rm -f {} \;
```

but that felt riskier...  Here's a relevant [Stack Overflow](https://stackoverflow.com/questions/11289551/argument-list-too-long-error-for-rm-cp-mv-commands) on this.