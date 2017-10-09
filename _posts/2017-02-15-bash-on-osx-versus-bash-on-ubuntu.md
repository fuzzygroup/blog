---
layout: post
title: Bash on OSX versus Bash on Ubuntu and Upgrading Your Bash
category: osx
tags: ["osx", "linux", "bash"]
description: Your version of Bash can differ dramatically on OSX versus any modern Linux.  Here's how to understand the difference and upgrade to the current version.
---
Bash is one of those things that you just don't think about all that much -- until you want something that is apparently new.  In my case I was looking to use the ** syntax which, mysteriously, I found doesn't work at all on OSX (even if you turn it on).  This let me to use bash --version.  

Here's the result for Linux:

```bash
bash --version
GNU bash, version 4.3.11(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

Here's the result for OSX:

```bash
bash --version
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin15)
Copyright (C) 2007 Free Software Foundation, Inc.
```

Intellectually I've always known that OSX lagged behind on Open Source tooling but 6 years behind???  Really???  Apparently this is a GPL v3 issue so I get it but **sigh**.

# Upgrading Bash on OSX

I will admit that I am absolutely terrified to try upgrading Bash on OSX since I eat, sleep and breathe in the terminal.  The research I've done shows me that you can upgrade your Bash to a version 4 series with just this brew command:

```bash
brew install bash
```

And [HomeBrew](https://brew.sh/) is awesome so I suspect it works; I'm just chicken.

More on Upgrading Bash: [ClubMate](http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/) | [Stack Overflow](http://apple.stackexchange.com/questions/193411/update-bash-to-version-4-0-on-osx)

# Sidebar: The ** Syntax Explained

The ** syntax allows the file globbing to operate recursively with a single command.  For example:

```bash
wc -l **/*.rb
```

would count all the lines of ruby code across all subdirectories.  If you haven't enabled ** then you can do this with:

```bash
shopt -s globstar
```

I first the ** syntax on Stack Overflow [here](http://stackoverflow.com/posts/14689618/revisions). Thank you [Michael Wild](http://stackoverflow.com/users/159834/michael-wild).

