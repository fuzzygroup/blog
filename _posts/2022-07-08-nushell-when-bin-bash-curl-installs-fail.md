---
layout: post
title: NuShell - When /bin/bash curl installs fail
date: 2022-07-08 22:57 -0400
category: nushell
tags: ["nushell", "rust"]
---
I've liked the concept of NuShell since I first heard about it.  I then liked it more when I discovered that Yehuda Katz was involved since I strongly believe in picking software based on the pedigree of the engineers involved (no I don't -- yet -- have engineer trading cards but I'm thinking about it).

Although I have NuShell running on my experimental system, I've held off on using it on my main box mostly due to concerns about the vast amounts of things that pipe crap to /bin/bash like this:

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    /usr/bin/find "$(brew --prefix)/Caskroom/"*'/.metadata' -type f -name '*.rb' -print0 | /usr/bin/xargs -0 /usr/bin/perl -i -0pe 's/depends_on macos: \[.*?\]//gsm;s/depends_on macos: .*//g'
    
That's an uninstall script, an install script and a find command.  I tried all of these tonight on NuShell and they all failed.  An example of this is:

    /Users/sjohnson/Sync/coding〉/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

    /bin/bash: #!/bin/bash: No such file or directory
    /Users/sjohnson/Sync/coding〉
    
**Note**: For non NuShell users, you can tell its NuShell above by the greater than sign in the prompt.

And then it struck me -- I can likely simply execute /bin/bash from within NuShell and THEN run whatever I need to in bash.  I tried it and it worked perfectly.  So if you have problems with things that don't work on NuShell, try spinning up a /bin/bash session.  After you're done, type exit and you are back in NuShell.