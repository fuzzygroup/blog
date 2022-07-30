---
layout: post
title: Forensic Computing 1 - Finding TextMate Untitled Documents
category: text
tags: ["textmate", "computer_forensics"]
description: When you don't know where it lives on your computer, finding it can be surprisingly hard.
---
{% pizzaforukraine  %}

So my Mac crashed again last night.  This is now roughly a two to three times per week occurrence.  Once upon a time I would have sworn like a sailor about this but I now, sadly, accept it.  If you're curious about OSX crashes and kernel panics, I dig into [them here](http://fuzzyblog.io/blog/osx/2017/10/08/forensic-computing-2-kernel-panics-and-kexts.html).

[TextMate](http://macromates.com/) is the programming editor and writing tool I use and normally after a crash, it automatically opens all the documents I previously had open.  And when I say "all", I mean everything, even the things that weren't ever formally saved i.e. "untitled 107", "untitled 132", etc.  Because TextMate doesn't force met to assign a file, I'm able to treat TextMate windows as virtual pieces of paper, virtual post-its if you will and just drop stuff into them.  I only bother to save a file when I actually need to make it long term persistent.  And an awful lot of the time, that never happens.  Sometimes these the contents of these windows flows into a [gist](https://gist.github.com/) which then gets emailed to someone.

Now this bizarre "don't bother to save the file" approach is well and good until it **breaks**.  Last night, just before my machine crashed, I know for a fact that I was in **untitled 30**.  But when I restarted my machine, I noticed that untitled 30 wasn't in my Window list:

![/blog/textmate_window_list.png](/blog/textmate_window_list.png)

This literally sent a chill down my spine -- if untitled 30 isn't present then:

1. Where did it go?
2. How often has this happened?
3. What other untitled xyz files have I unknowingly lost?
4. Where on the blankety, blank computer is untitled 30 stored so I can bloody well find it?

Questions 1 and 2 simply cannot be answered but questions 3 and 4 are actually answerable.  If I can simply find out where TextMate stores its untitled files then I can browse the directory and find them.  I should also then be able to find untitled 30.  

# Step 1: Google

Whenever you are trying to understand something like this Google is generally your first place to look.  Unfortunately these googles didn't really yield anything:

* [where does textmate store untitled files](https://www.google.com/search?tbs=li:1&q=where+does+textmate+store+untitled+files)
* [textmate untitled](https://www.google.com/search?tbs=li:1&q=where+does+textmate+store+untitled+files)

# Step 2: Spotlight

OSX's Spotlight, the system level search engine was next.  This too yielded nothing, squat, [bupkus](http://www.urbandictionary.com/define.php?term=bupkus).   

# Step 3: Alfred

The filename search engine in [Alfred](https://www.alfredapp.com/) which you trigger with your Alfred hotkey plus the keyword open and then what you want to search yielded nothing.

# Step 4: mdfind

Another way to use Spotlight is to trigger the mdfind utility from the command line and look for the filename untitled 30 directly by typing:

> mdfind "untitled"

The output of mdfind is a list of filenames.  But, unfortunately, mdfind isn't, by default, for filenames which means that it finds the word untitled in the *body of documents* where as we want it in the filename itself. Just to be sure we can feed the mdfind's output thru grep to winnow it down:

> mdfind untitled | grep untitled

There is a -name option to mdfind but that also returned nothing:

> mdfind -name untitled

**Cool as Hell Sidenote**: In looking up [details on mdfind](http://osxdaily.com/2017/08/24/find-all-screenshots-mac/), I found this very, very cool command line:

> mdfind kMDItemIsScreenCapture:1

What that does is find every screenshot you've taken on your Mac.  And I don't mean files named "Screen Shot xyz" but any screenshot you've ever taken, even ones you've moved to other directories, renamed, etc.  Wow.

# Step 5: Look Elsewhere

Now the absence of results in Steps 2, 3 and 4 gave me a strong indication that what I was looking for wasn't in an indexed location and that gave me a clue.  Spotlight  and mdfind are both generally looking in the files for the user but NOT in the application level files.  OSX has a key directory structure for users that generally isn't indexed: 

> /Users/sjohnson/Library/Application Support/

And I know for a fact there is a TextMate directory below it:

> /Users/sjohnson/Library/Application Support/TextMate/

What I didn't know was what was below the TextMate directory:

    ls -l "/Users/sjohnson/Library/Application Support/TextMate/"
    total 6488
    drwxr-xr-x   10 sjohnson  staff   340B Jan  1  2017 Bundles/
    -rw-r--r--    1 sjohnson  staff   732K Oct  8 05:40 ClipboardHistory.db
    -rw-r--r--    1 sjohnson  staff    32K Oct  8 05:40 ClipboardHistory.db-shm
    -rw-r--r--    1 sjohnson  staff   1.7M Oct  8 07:12 ClipboardHistory.db-wal
    -rw-r--r--    1 sjohnson  staff   1.1K Sep 30 08:46 Global.tmProperties
    drwxr-xr-x    5 sjohnson  staff   170B Oct  7 06:31 Managed/
    -rw-r--r--    1 sjohnson  staff   688K Oct  8 05:51 RecentProjects.db
    drwxr-xr-x    4 sjohnson  staff   136B Nov 20  2016 Ruby/
    drwxr-xr-x  156 sjohnson  staff   5.2K Oct  8 07:12 Session/
    
And, yep, **bingo**, *Session/*.  A quick look there showed me all my untitled documents including: 

    ls -l /Users/sjohnson/Library/Application\ Support/TextMate/Session/untitled\ 30*
    
    -rw-r--r--@ 1 sjohnson  staff   5.3K Sep 13 04:23 /Users/sjohnson/Library/Application Support/TextMate/Session/untitled 30.txt
    
And now that I have a path I can just type open "/Users/sjohnson/Library/Application\ Support/TextMate/Session" and get a Finder window of all my untitled documents like this:

![text_mate_session.png](/blog/assets/text_mate_session.png)