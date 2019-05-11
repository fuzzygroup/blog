---
layout: post
title: When libreadline Goes Whack
category: brew
tags: ["brew", "osx", "libreadline"]
---
Well shite.  I’ve seen this before and I just plain hate it.  This is the last error you want to get on a Friday afternoon after five.  Taking the time to fix it now generally means that your computer won’t boot on a Monday due to something going wrong in the fixing process and you forgetting what you did.  

Every single time libreadline goes to hell, it is always a pain. Here’s how I fixed it this time.

## The Environment / Context

I'm running a MacBook on OSX (Sierra; yes I'm a luddite on OS upgrades) with [HomeBrew](https://brew.sh/) 1.7.0.

## The Error

Here is the error:

    ```dyld: Library not loaded: /usr/local/opt/readline/lib/libreadline.7.dylib
    Referenced from: /usr/local/Cellar/postgresql@9.5/9.5.12/bin/psql
    Reason: image not found
    sh: line 1: 36440 Abort trap: 6           
    /usr/local/Cellar/postgresql@9.5/9.5.12/bin/psql seasthree_test /Users/sjohnson/fuzzygroup/seas/cas-seas3-attain-admin/spec/fixtures/schools.sql```

libreadline is a core library used by almost any open source tool that ends up reading input from the standard in.  In this case I'm trying to feed a sql file into the pg (postgres) executable.

This is one of those errors that I've seen a dozen or so times and I always fix it with some crazy combination of jiggery-pokery / goat sacrificing.  This time I thought I'd document it for, well, the next damn time.

## The Solution

The answer appears, courtesy of Google via a [Github Issue](https://github.com/Homebrew/homebrew-core/issues/5799), appears to be an update of bash.  Sigh.  While I love the power of command shells, I truly, truly hate messing with them.  

Here's the process I followed:

    brew update
  
That upgrades HomeBrew to the latest.  I then check the process again to see if it has magically gone away and no such luck.  The next step is to upgrade bash itself:

    brew upgrade bash 

On an OSX box there is the version of bash that comes with the system and then there is the bash that comes from HomeBrew.  The reason you upgrade bash is that what Apple ships is woefully obsolete:

    bash --version
    GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin16)
    Copyright (C) 2007 Free Software Foundation, Inc.

Bash after it has been upgraded is now north of version 5. 

The way that you make your new bash usable is that you first have to add it to /etc/shells by editing this file:

    sudo nano /etc/shells

This prompts you for your password.  Then at the very end of the file you need to add this line:

    /usr/local/bin/bash

After adding this line, do the CTRL+W and then CTRL+Q dance to exit the editor.  That essentially tells OSX "Ok this is a valid shell that someone can now tell us they want to use".  The next step is to use the chsh command to make this permanent.

    chsh -s /usr/local/bin/bash $USER

**Note:** Much of what I know about changing an OSX shell comes from this [Stack Exchange post](https://apple.stackexchange.com/questions/224511/how-to-use-bash-as-default-shell).     

At this point you have set your system up to use the new shell but it won't take effect until you restart your terminal.  Given that I use iTerm and I have about 70 terminals open at any point, restarting a terminal is a big deal.  But what I can do is validate this by using the Apple Terminal.  So I start up Apple Terminal and do a:

    echo $BASH_VERSION
    5.0.7(1)-release

And, unfortunately, I still get the error when I try again.  Sigh.  At this point with the new Bash in place, I'm able to try:

    brew upgrade libreadline

And that begins the process.  Now since libreadline is used by almost everyone that HomeBrew has installed for me, it is a long, long process.  I can watch it upgrade Postgres, Maple, etc.  When it is finally done, I try again only to find that my pg executable isn't there anymore.  This takes a moment of thought but I realize that it is simply moved since the previous directory included a version number.  When I finally reconstruct a path to the correct version of pg, it now executes flawlessly:

    /usr/local/Cellar/postgresql@9.5/9.5.15/bin/psq

Success!  And, in closing, yes I do actually know that I shouldn't have to specify the exact pathing.  A big part of homebrew's advantage is that this isn't needed.  But for some reason, on this particular box, it is needed.  And I've just never bothered to figure out why.