---
layout: post
title: OSX Tip - Using Toshiba External Hard Drives
category: osx
tags: ["ntfs", "osx"]

---
I found myself having to get on a plane today and travel 1,000 odd miles to get about a terabyte of data.  Given the importance of the task, I opted for brand new drives so I dashed to the store and picked up two 3 terabyte Toshiba hard drives and I wanted to verify that they worked prior to travel.  I plugged them in, turned them on and then found that I could NOT write to them.  Digging further into this showed me that they were NTFS and on OSX, NTFS is a read only partition type.  So I tucked into Disk Utility only to find that it could not destroy the NTFS partition.  Sigh.  Happily there's always the command line and with Jared's assistance, I came up with this:

<pre>
diskutil eraseDisk fat32  TOSHIBA\ EXT /dev/disk3
</pre>

diskutil is the command line version of Disk Utility and it is both infinitely more capable and infinitely more dangerous.  To get started with this, do a:

<pre>
diskutil list
</pre>

which will give you a list of all mounted discs.  DO NOT.  I repeat DO NOT use this on anything other than the disc you want to erase.  This told me that I wanted to erase /dev/disk3.  You'll also need to find out the format you want to make the new disc.  And you can do this with:

<pre>
diskutil listFilesystems  
</pre>

Finally you have to bring it all together by specifying the current name of the disc as a way of preventing you from erasing something important.  And that gives us the final command or:

<pre>
diskutil eraseDisk fat32  TOSHIBA\ EXT /dev/disk3
</pre>

And then a little bit of wait and you have a brand new, writable disk.

Important:

Fat32 has a 2 gigabyte per file limit.  So just ignore every single bit of what's written above.  Sigh.