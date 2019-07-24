---
layout: post
title: Bullshite rsync Subtleties
category: osx
tags: ["osx", "rsync", "mac"]
---
So yesterday or the day before [I blogged about rsync](https://fuzzyblog.io/blog/osx/2019/07/22/backing-mac-to-mac-via-scp-rsync.html) and how good it was.  And that's true but rsync is notoriously tricky and today I became very, very aware of rsync's trickiness.

So my scenario was that I had an old MacBook Air which I was trying to get all the data off of since DropBox seemed to have an incomplete sync.  And I figured that if I just got all the files copied up to my big desktop then I could reformat the machine and give it to my wife as a replacement for her laptop on which the keyboard died.

Note: Some of these things are perhaps known issues / not issues because I'm on OSX.  What I can say is that as a Mac user some of these things make no damn sense.

# Problem the First - Directory Names with Spaces

So here was the first thing that I observed:

    rsync -avh -e ssh Dropbox/"Camera Uploads"/ 192.168.1.25:/Users/sjohnson/backups/macbook_air/Dropbox/"Camera Uploads"
    Password:
    building file list ... done
    created directory /Users/sjohnson/backups/macbook_air/Dropbox/Camera
    ./
    .DS_Store
    .dropbox
    2017-07-03 05.30.42.jpg
    2017-07-03 07.03.03.jpg
    2017-07-09 08.54.25.jpg
    2017-07-09 08.54.31.jpg
    2017-07-09 11.09.16.jpg
    2017-07-09 11.09.23.jpg
    2017-07-10 18.48.37.jpg
    2017-07-10 18.48.43.jpg
    2017-07-10 18.48.47.mov
    ^Crsync error: received SIGINT, SIGTERM, or SIGHUP (code 20) at /BuildRoot/Library/Caches/com.apple.xbs/Sources/rsync/rsync-52.200.1/rsync/rsync.c(244) [sender=2.6.9]'

So what you're seeing is that even tho the data came from "Camera Uploads", it got moved to "Camera".  The issue is obviously directory names with spaces.  And since I had started with an scp approach this meant that rsync was copying up data that it already had in place.  ARRGHH!

And here's a second pass with a different approach to space encoded filenames:

    rsync -avh -e ssh Dropbox/"Camera Uploads"/ 192.168.1.25:/Users/sjohnson/backups/macbook_air/Dropbox/Camera\ Uploads/
    Password:
    building file list ... done
    ./
    2017-07-14 18.09.19.jpg
    2017-07-14 18.09.37.jpg
    2017-07-14 18.09.39.jpg
    2017-07-14 18.28.18.jpg
    [A bunch of filenames omitted for brevity]
    2017-07-30 09.27.13.jpg
    2017-07-30 09.27.23.jpg
    ^Crsync error: received SIGINT, SIGTERM, or SIGHUP (code 20) at /BuildRoot/Library/Caches/com.apple.xbs/Sources/rsync/rsync-52.200.1/rsync/rsync.c(244) [sender=2.6.9] 

Before the second pass:

     ls -ltr Camera | wc -l
          15

After the second pass

    ScottiMac:Dropbox sjohnson$ ls -ltr Camera | wc -l
          36

So even after changing how I handled the destination filename, it still went to "Camera".  Double ARGH.

So what's the obvious workaround when rsync seems to entirely fsck up OSX filenames with spaces?  I'm sure there are other options but my approach was drop dead simple, rename each folder on source and destination from:

    Camera Uploads

to

    Camera_Uploads

and re-run the sync command:

    rsync -avh -e ssh Dropbox/Camera_Uploads/ 192.168.1.25:/Users/sjohnson/backups/macbook_air/Dropbox/Camera_Uploads/
    Password:
    building file list ... done
    .DS_Store

    sent 18.87K bytes  received 1.64K bytes  8.21K bytes/sec
    total size is 4.57G  speedup is 222553.34

# Problem the Second - Excluded Directories

My next issue was that I wanted to exclude the Library directory from the files being synced.  This would eliminate all the giant Docker files that are stored in Library (and Library mostly isn't needed since it is Application level stuff; not really user data).

Here was my first attempt:

    ➜ rsync -avh --exclude '/Users/sjohnson/Library/' -e ssh ~ 192.168.1.25:/Users/sjohnson/backups/seas
    Password:
    building file list ... rsync: opendir "/Users/sjohnson/Library/Application Support/CallHistoryTransactions" failed: Operation not permitted (1)

So that clearly failed.  Now I've long been aware that Apple has old versions of core open source tools like rsync, so:

    ➜ rsync --version
    rsync  version 2.6.9  protocol version 29
    Copyright (C) 1996-2006 by Andrew Tridgell, Wayne Davison, and others.
    <http://rsync.samba.org/>
    Capabilities: 64-bit files, socketpairs, hard links, symlinks, batchfiles,
                  inplace, IPv6, 64-bit system inums, 64-bit internal inums

    rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
    are welcome to redistribute it under certain conditions.  See the GNU
    General Public Licence for details.

Clearly the 2006 copyright date is a problem.  This calls for brew!

    brew install rsync

And, naturally, brew does [shell magic trickery](https://fuzzyblog.io/blog/ruby/2019/07/10/when-rbenv-well-won-t-rbenv-fixing-shell-extension-madness.html) that messed up for me.  Happily tho rsync is just an executable that I can fully path to (all brew executables always end up in /usr/local/bin):

    /usr/local/bin/rsync --version
    rsync  version 3.1.3  protocol version 31
    Copyright (C) 1996-2018 by Andrew Tridgell, Wayne Davison, and others.
    Web site: http://rsync.samba.org/
    Capabilities:
        64-bit files, 64-bit inums, 64-bit timestamps, 64-bit long ints,
        socketpairs, hardlinks, symlinks, IPv6, batchfiles, inplace,
        append, ACLs, xattrs, iconv, symtimes, no prealloc, file-flags

    rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
    are welcome to redistribute it under certain conditions.  See the GNU
    General Public Licence for details.

and that still failed but here was the magic (and Virginia, yes, the error was **all damn mine**, not the version of rsync):

"Excluding a specific directory is same as excluding a file, just pass the relative path to the directory to the --exclude option" from [Rsync Exclusion](https://linuxize.com/post/how-to-exclude-files-and-directories-with-rsync/)

So that made my rsync command this:

    rsync -avh --exclude 'Library/' -e ssh ~ 192.168.1.25:/Users/sjohnson/backups/seas

And that worked like a charm.  Sigh.  Always read the docs well if at all possible.  