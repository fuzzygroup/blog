---
layout: post
title: Accessing Your Mac via SSH / Rsync and Making Mac Networking Work for SMB
category: OSX
tags: ["OSX", "ssh", "rsync"]
---
{:.center}
![IMG_8668.jpeg](/blog/assets/IMG_8668.jpeg)

I recently had to back up one Mac to another Mac using rsync (which runs on top of SSH) and I discovered that you can't simply rsync / ssh from one Mac to another. And, yes, I know that this change happened years and years ago but I don't often go Mac to Mac (using I go Mac to Linux Server).  

Here's the trick:

* Make sure your Macs are both on the same wifi access point or ethernet network
* Go into System Preferences
* Go into Sharing
* Turn on Remote Login

I'd also recommend that you Turn on File Sharing also but think about that a bit before you do so.

## References

* [Boolean World](https://www.booleanworld.com/access-mac-ssh-remote-login/)
* [Mac Sales](https://blog.macsales.com/45185-mac-101-learn-the-power-of-rsync-for-backup-remote-archive-systems/)
