---
layout: post
title: The Silver Searcher
tags: ["search", "grep", "ack", "ag", "silver_searcher"]
category: search
---
I had a project die about two months ago and I've been involved in a bit of resurrection work recently.  This was related to my comments on [code rot](https://fuzzygroup.github.io/blog/rails/2016/12/06/code-rot-is-very-very-real.html).  Happily, with the assistance of [Dv](http://dasari.me) and [Nick](http://www.nickjanetakis.com) for different aspects, we're once again indexing and functioning correctly.  Today I'm going to talk about a basic search tool, [The Silver Searcher](https://github.com/ggreer/the_silver_searcher), also known as ag and that's how I'll refer to it mostly.

This blog post is written as a basic, example based tutorial since that type of information seems to be entirely missing from [ag's home page](http://geoff.greer.fm/ag/) and github page.  ag is a fantastic tool but its usage isn't always apparent.

ag, the silver searcher's command line invocation, is a search tool similar to grep or ack only: 

* better
* faster
* able to leap tall buildings in a single bound! (just kidding but it feels that way)

ag is a fantastic tool and its strong enough that I've just added it to my standard ansible playbook for all my servers so I will always have it available.  Recommended

# Installation

ag can be installed on a mac using homebrew:

    brew install the_silver_searcher
    
Or on Ubuntu using:

    apt-get install silversearcher-ag

# Usage

ag operates by searching in the current directory and below using a very simple syntax:

    ag WHAT_YOU_WANT_TO_FIND
    
replace WHAT_YOU_WANT_TO_FIND with, well, what you're looking for.  Here's an example 

    ag NUM_THREADS=10

In this case I was struggling to find documentation that I knew I had written down but I had changed boxes, re-organized directories and so on.  By simply opening a Terminal window to my home directory i.e. ~ and then typing ag NUM_THREADS=10 I was able to find all documents containing this.

## Understanding How ag Operates

Search tools tend to be fiddly little beasts at the best of times and if you don't understand how they work then this tends to rise up and bite you badly.  Here's what I know about how ag operates and that I took the time to verify:

* Searches by default are case insensitive; I got roughly the same results with ag num_threads=10 as I did with ag NUM_THREADS=10; no I don't understand why I got 76 results with the lower case version and 77 with the upper case but the box I'm searching is a bit wonky so perhaps that's it.
* Searches go across directories by default
* 