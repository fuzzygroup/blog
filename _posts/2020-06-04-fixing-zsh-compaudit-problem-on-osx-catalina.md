---
layout: post
title: Fixing zsh Compaudit Problem on OSX Catalina
category: osx
tags: ["osx", "zsh", "catalina"]
---
{:.center}
![IMG_1479.jpeg](/blog/assets/IMG_1479.jpeg)

Ever since OSX Catalina, every time I open a new shell window I get this error:

    zsh compinit: insecure directories, run compaudit for list.
    Ignore insecure directories and continue [y] or abort compinit [n]? y
    (eval):32: command not found: complete
  
The issue with complete isn't the problem here -- it is the insecure directories issue.  After a bunch of googling, I found this command:

    compaudit | xargs chmod g-w

which fixed the issue entirely.