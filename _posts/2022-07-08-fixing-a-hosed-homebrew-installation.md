---
layout: post
title: Fixing a Hosed HomeBrew Installation
date: 2022-07-08 22:40 -0400
category: osx
tags: ["osx", "homebrew"]
---
**NOTE**: I'm not telling you to do this.  This blog post advocates bulk permission changing and that's risky but HomeBrew was entirely broken and brew doctor did not work.  And this solution did.  Use at your own risk.

I have two primary machines -- a Mac Desktop and a dual monitor Mac Laptop.  I use the laptop more mostly from habit but I'd really like to use the desktop for something that makes me feel better about it being next to me and yet rarely used.  One of the reasons for two machines is one is my daily driver and one is experimental.  For example, my desktop I installed NuShell on recently as I didn't (yet) trust it enough.  

I recently discovered that HomeBrew wouldn't install things correctly on my desktop.  The issue was always permissions issues and when I dug into it, I found that 

    /usr/local/Cellar

was owned by, well, NOT me.  The answer, as with so many other *nix things is chown (DO NOT DO THE FOLLOWING):

    sudo chown -R sjohnson:wheel /usr/local/Cellar

-or- that's what I thought the answer was.  Unfortunately while a:

    brew install boost
    
worked seemingly nicely, it failed at the final step:

    ==> Downloading https://ghcr.io/v2/homebrew/core/php/blobs/sha256:d124757fd19130379ccef3e1bd26fd082fa11a543aad37a6add6b942fb3d327e
    ==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:d124757fd19130379ccef3e1bd26fd082fa11a543aad37a6add6b942fb3d327e?se=2022-07-09T02%3A50%3A00Z&sig=ea5rDsciKGA8m41Nuw4d6Wkg370EFvFhExVvQkjfr1Q%3D&sp=r&spr=https&sr=b&sv=2019-12-12
    ######################################################################## 100.0%
    ==> Downloading https://ghcr.io/v2/homebrew/core/postgresql/manifests/14.4
    ######################################################################## 100.0%
    ==> Downloading https://ghcr.io/v2/homebrew/core/postgresql/blobs/sha256:1e258c37f55737787151ee3a5276e805e0aa4e30cf5d166bdc2208d0d7f812c2
    ==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:1e258c37f55737787151ee3a5276e805e0aa4e30cf5d166bdc2208d0d7f812c2?se=2022-07-09T02%3A50%3A00Z&sig=ynubrlIVaQArYbdlB0upJDURT70N0cluK7KFQIFnSgU%3D&sp=r&spr=https&sr=b&sv=2019-12-12
    ######################################################################## 100.0%
    ==> Upgrading httpd
      2.4.29_1 -> 2.4.54
    
    Error: Permission denied @ apply2files - /usr/local/lib/httpd/build/config.nice
    

This had me look on my good machine at the overall /usr/local directory:

WORKING MACHINE:

    ❯ ls -l /usr/local
    total 0
    drwxrwxr-x@   35 sjohnson  admin   1120 Jul  8 06:53 Caskroom
    drwxrwxr-x   324 sjohnson  admin  10368 Jul  8 13:18 Cellar
    drwxrwxr-x   100 sjohnson  admin   3200 Jun 12 11:43 Frameworks
    drwxrwxr-x    21 sjohnson  admin    672 Jun 12 09:58 Homebrew
    drwxrwxr-x  1758 sjohnson  admin  56256 Jul  8 13:18 bin
    drwxrwxr-x    51 sjohnson  admin   1632 Jun 12 11:43 etc
    drwxrwxr-x   451 sjohnson  admin  14432 Jul  8 22:27 include
    drwxrwxr-x  1890 sjohnson  admin  60480 Jul  8 22:27 lib
    drwxrwxr-x   402 sjohnson  admin  12864 Jul  8 22:27 opt
    drwxr-xr-x@    3 root      wheel     96 Jun 18  2019 remotedesktop
    drwxrwxr-x    23 sjohnson  admin    736 May 25 22:24 sbin
    drwxrwxr-x   100 sjohnson  admin   3200 Jun 12 13:24 share
    drwxrwxr-x    16 sjohnson  admin    512 Jul  2 00:43 var
    
BROKEN MACHINE:

    bash-3.2$ ls -l /usr/local/
    total 0
    drwxrwxr-x   22 502       admin    704 Apr 25  2019 Caskroom
    drwxrwxr-x  121 502       admin   3872 Jul  8 10:33 Cellar
    drwxrwxr-x    5 502       admin    160 Apr 28  2020 Frameworks
    drwxrwxr-x   21 sjohnson  admin    672 Jun 27 23:13 Homebrew
    drwxrwxr-x  641 sjohnson  admin  20512 Jul  8 22:43 bin
    drwxrwxr-x   30 502       admin    960 Jun 27 23:23 etc
    drwxrwxr-x  177 sjohnson  admin   5664 Jul  8 22:43 include
    drwxrwxr-x  507 sjohnson  admin  16224 Jul  8 22:40 lib
    drwxrwxr-x  159 502       admin   5088 Jul  8 22:40 opt
    drwxrwxr-x    7 502       admin    224 Apr 24  2020 sbin
    drwxrwxr-x   49 502       admin   1568 Jun 27 23:22 share
    drwxrwxr-x   13 502       admin    416 Apr 28  2020 var
    

and this led me to the following series of commands:

    sudo chown -R sjohnson:admin /usr/local/Caskroom
    sudo chown -R sjohnson:admin /usr/local/Cellar
    sudo chown -R sjohnson:admin /usr/local/Frameworks
    sudo chown -R sjohnson:admin /usr/local/Homebrew
    sudo chown -R sjohnson:admin /usr/local/bin
    sudo chown -R sjohnson:admin /usr/local/etc
    sudo chown -R sjohnson:admin /usr/local/include
    sudo chown -R sjohnson:admin /usr/local/lib
    sudo chown -R sjohnson:admin /usr/local/opt
    sudo chown -R root:wheel /usr/local/remotedesktop
    sudo chown -R sjohnson:admin /usr/local/sbin
    sudo chown -R sjohnson:admin /usr/local/share
    sudo chown -R sjohnson:admin /usr/local/var

Although I normally wouldn't advocate this much bulk permission fuckery, it did actually work and a brew install boost worked just fine after it.