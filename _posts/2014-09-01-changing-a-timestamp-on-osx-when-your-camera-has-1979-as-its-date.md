---
layout: post
title: Changing a Timestamp on OSX When Your Camera has 1979 as its Date
category: osx
tags: ["osx", "sysadmin"]

---
Always wondered about this and found the need for it this morning:

<pre>
touch -t 201408311356 100_0013.MOV
</pre>

Timestamp format is YYYYMMDDHHMM.