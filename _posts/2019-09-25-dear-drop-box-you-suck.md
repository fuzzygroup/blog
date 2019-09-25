---
layout: post
title: Dear Drop Box You Suck
category: sync
tags: ["drop_box"]
---
{:.center}
![IMG_5541.jpeg](/blog/assets/IMG_5541.jpeg)

**Note**: Manual synchronization is about this fun ...


Synchronization is one of those things that is fundamentally important and yet hard as hell to get right.  I've been in the computer industry for a long, long time now and I've only ever seen it done well a few times:

* Lotus Notes - say what you want about Notes, it got sync right=
* Palm III - Hawkins nailed it
* The Late, Lamented Dropbox of Yesteryear

I say the [Dropbox](https://www.dropbox.com/) of yesteryear because the Dropbox I use today, well, **sucks slimy green toads**.  Here's what I found myself doing yesterday as I left the office to work somewhere else:

    scp -p 192.168.1.25:/Users/sjohnson/fuzzygroup/adl/pol-hate-analysis/categorical.parquet .
    scp -p 192.168.1.25:/Users/sjohnson/fuzzygroup/adl/pol-hate-analysis/read_categorical2.py .

Yep.  That's right.  I manually scp'd files from my big desktop down to my laptop to work on them when I went remote.  It was a miserable experience and it reminded me of what life used to be like -- when Dropbox worked.  It used to be that I would simply work on files in my ~/Dropbox directory and I was assured that sync would magically get files from my desktop to my laptop in damn near real time.  

Here's what happens now:

* Files never sync reliably - each of my machines is at a different point in the sync process continually
* Sync tries to sync files that haven't changed in 2 years -- and not a few files; I've seen more than 500K files try and sync constantly
* Dropbox uses > 90% of my CPU
* I have one Dropbox account and I always have login issues

I get that Dropbox feels the need to add new features to compete with Microsoft's OneDrive and GoogleDrive and Box.com and I don't begrudge them the ability to add new features.  What I want, however, is a working version of the features they originally promised me -- machine to machine file synchronization.

I'm sorry Dropbox but you simply suck.  And I'm currently looking at [SyncThing](https://syncthing.net/) as a replacement; no it isn't exactly the same but maybe it will at least work.

**Note 1**: I am a paid customer of Dropbox.  The product they provide even their paying customers simply doesn't work.  Or at least it doesn't work as it used to.

**Note 2**: This isn't a complicated use case where I'm talking Mac to PC sync or something like that.  I'm simply saying "Sync files in ~/Dropbox on Machine 1 to ~/Dropbox on Machine 2".  