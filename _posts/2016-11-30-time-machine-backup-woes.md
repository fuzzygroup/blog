---
layout: post
title: Time Machine Backup Woes
category: osx
tags: ["osx", "time_machine", "mysql", "mac"]
---
It is a fairly well understood IT truism that you don't really know how good your backup strategy is **until** you restore it.  I'm an IT professional and I've been one my whole life but, even so, I still got bit badly by backup woes.  About a month ago I took a moderately functioning 2011 Macbook Pro 15" and did a full time machine back up on it.  Then I wiped it and played with Linux distros on it.  The machine did have valuable data on it but I did a full backup on it and I was beyond careful:

* the backup disk was labeled
* the backup disk was turned off
* the backup disk was physically unplugged

Given that I had valuable data on the disk, I wanted to be absolutely certain that nothing happened to it.  I always knew I'd restore it but I wasn't sure exactly *when*.  And then *when* turned out to be today.  Now, since the title includes the words "backup" and "woes" you do know that this isn't going to end well, right?  

# Problem the First -- 200 Gigs Free Space

My first inkling that something had gone very, very wrong came when I did a **df -h** and realized that my restored computer has roughly 200 gigs of free space.  Normally this box runs between 5 and 20 gigs free.  Clearly there is a problem.

# Problem the Second -- All Passwords Have to be Re-Entered

This was weird -- I noticed that sometimes I'd have to re-enter passwords when I know that they worked perfectly before.  I find this odd because it implies that not everything got restored.  This is troubling.

# Problem the Third -- iPhoto Doesn't Work At All

Interestingly I found that my copy of iPhoto told me that it wouldn't work under Capitan.  I don't know how an older version of iPhoto got left behind when this box was upgraded to capitan but, again, troubling.

I simply copied iPhoto from another Capitan box onto a USB stick and dropped it onto this machine and it worked beautifully and, praise Ghu, I have pictures of my kids again.  As I said in the beginning -- **valuable data**.

# Problem the Fourth -- WHERE ARE MY DAMN DATABASES?

And here comes the punch line -- the missing data seems to all be my MySQL databases.  A quick google shows that for the query "time machine" "mysql" (indicating that both terms are phrases and both are required) gives some [227,000 results](https://www.google.com/search?q=%22mysql%22+%22time+machine%22&ie=utf-8&oe=utf-8).  Clearly I'm not the only one with an issue here.  My guess is that the data I need is actually on the backup disc -- somewhere.  I suspect that Time Machine doesn't restore anything outside of /Users/ and the operating system itself.  And, yes, that's stupid.  Quite honestly this is likely the last time I'll ever trust Time Machine.  Sheesh. 

If anyone out there has experience with restoring MySQL databases from Time Machine I'd really appreciate some assistance.  Trying to ferret out their location from the back up disc is mildly impenetrable.  

# Conclusion and a Recommendation

I know someone out there is saying "Carbon Copy Cloner".  Yep.  I know.  And I own a full copy, bought and paid for.  But I honestly thought that Time Machine was good enough for a personal backup.  Apparently, at least for a developer, it is **not**.  Tomorrow I am figuring out where MySQL stores its data on all my other OSX boxes and I'm relocating it to a location inside /Users/sjohnson with a vengeance.