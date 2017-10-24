---
layout: post
title: PostMac 001 -- Adding pbcopy to ElementaryOS or Another Unix
category: postmac
tags: ["postmac", "linux", "mac"]
---
Well as will become clear in another few blog posts, I took ElementaryOS and installed it on my 2012 MBP with 16 gigs RAM and 768 mb SSD storage.  This used to be my full time machine up until a few months ago when I shifted everything to my Macbook Air due to this box becoming flat out unusable as a Ruby dev box.  Even after re-install brew and all the tools, I just can't get gems to reliably build.

So, two days ago, between that and my disappointment in not being able to upgrade to a new machine that I want, in a fit of abject rage, I wiped the disc and did a full install **overwriting** OSX -- making it a real commitment.  And when I went to write a blog post on it the first thing I realized was no SSH keys.  Generating SSH keys was easy but then I realized that I didn't have pbcopy.  Sigh.  

# Here's what you need to do to add pbcopy to ElementaryOS or another Linux

1.  Install xsel.  sudo apt-get install xsel
2.  Alias xsel and put it into .bashrc.

    vi ~/.bashrc
    
    Add these lines:
    
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    
    Save and exit
    
    ESC :wq
    
    Source the .bashrc file
    
    source ~/.bashrc

# References

[Stack Overflow Reference](http://superuser.com/questions/288320/whats-like-osxs-pbcopy-for-linux)
[Bash rc Vs Bash Profile](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html)
