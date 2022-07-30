---
layout: post
title: Forensic Computing 2 - Kernel Panics and Kexts
category: osx
tags: ["osx", "kernel_panics", "kexts"]
description: When your Mac crashes regularly but without a clear cause, how do you look for a solution?
---
{% pizzaforukraine  %}

As I've noted in [other places](http://fuzzyblog.io/blog/text/2017/10/08/forensic-computing-1-finding-textmate-untitled-documents.html), my Mac crashes a lot.  For some time now I've just sort of accepted this as a consequence of how I do things.  I'm a software developer and I tend to push the limits of everything.  Part of the reason that I accept it is that my computing usage is more than a bit non standard and I suspect that I'm running up against nothing more than resource limits.  Just as an example, at the start of my day, my terminal count looks something like this: 

    ps auwwx | grep bash | wc -l
          50
          
That's at the start of my computing day (I open a lot of terminals and generally leave them running).  Just as a side note, my desktop Hackintosh, with double the RAM, also running OSX is pretty much rock solid so I tend to view this as a resource issue.  But what if it is not?  What if this is a solvable software issue?

# Analyzing Kernel Panics

In order to figure this out, I took a number of my kernel panics and put them online as gists:

* [October 8th](https://gist.github.com/fuzzygroup/ab3a4c81edb3fa80910e25fc12e49993).  Yes this one happened while I was writing this all down.  Damn it.  
* [October 7th](https://gist.github.com/fuzzygroup/97bc867094294a2b724f5860d04d09ab)
* [September 30th](https://gist.github.com/fuzzygroup/30ee32761f72d55d1fe8b870dbdc04af)
* [August 27](https://gist.github.com/fuzzygroup/137e695b9ed5cc2d2ebcda8c983616a4)
* [September 11](https://gist.github.com/fuzzygroup/5e41b8ccdcdf6c8bf95bbe002aa158

As I've been reading these crash by crash, I always attributed it to randomness since there was no consistent application that seemed to cause the crash (WindowServer was the most common but by no means the sole thing).  But there is a lot of information in these reports and the application when it crashed perhaps isn't the only thing I should be caring about.

I noticed one interesting thing in going thru the above kernel panics (oh and by the way, you can find many of these logs in /Library/Logs/DiagnosticReports/).  They are all named something like Kernel_2017-09-16-132730_FuzzygroupMacbookPro2016.panic.  [Thanks Apple](https://support.apple.com/en-us/TS3742).  What I noticed was that the kext (Kernel Extension) that always is last loaded is com.github.kbfuse.filesystems.kbfuse which belongs to KeyBase.  This is a part of [Keybase](https://keybase.io/) which is a very cool crypto app.  This extension is apparently part of the new [Keybase Filesystem](https://keybase.io/docs/kbfs).

A kext is a kernel extension and that basically means "code that extends the lowest level of the operating system (the kernel)".  Fuse is a toolkit that lets you write filesystems in user space and what I do remember about the Fuse project is that I've seen a lot of flakiness / crashes over the years from Fuse related stuff.  

A quick google for the term [osx kernel panic fuse](https://www.google.com/search?tbs=li:1&q=osx+fuse+kernel+panic) gave me 49,100 results so I'm not the only one thinking this.  Googling instead for (com.github.kbfuse.filesystems.kbfuse)[https://www.google.com/search?tbs=li:1&q=com.github.kbfuse.filesystems.kbfuse] took me to the github page for the [keybase fuse project](https://github.com/keybase/client/tree/master/osx/Fuse) where I found the following uninstallation directions:

    // Check for any mounts (if there are you need to umount)
    mount -t kbfuse

    sudo kextunload -b com.github.kbfuse.filesystems.kbfuse
    sudo rm -rf /Library/Filesystems/kbfuse.fs
    
# What Next?

I've done these steps and now I need to just wait and see if my system stability improves.  I also deleted the Keybase application entirely because its unclear to me what happens to Keybase if I delete a kext that it is using.

In closing, I'd like to add that I am not the only person who is reporting an issue with this kext and kernel panics.  Here's an [open Github thread](https://github.com/keybase/client/issues/5190) on it.

# Update

As of 24 hours later, my Mac has crashed two more times so the kext apparently had nothing to do with it, alas.  