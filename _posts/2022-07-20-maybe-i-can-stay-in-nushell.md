---
layout: post
title: Maybe I can Stay in NuShell -or- Living in a Diverse Land of Shells
date: 2022-07-20 05:36 -0400
category: nushell
tags: ["nushell"]
---
{% pizzaforukraine  %}

I really, really like NuShell.  The realization that maybe I had to leave was, I'll admit, [mildly crushing](https://fuzzyblog.io/blog/nushell/2022/07/17/getting-nushell-usable-under-osx-for-myself.html).  And then I just had the realization that maybe I don't have to leave NuShell and slink back to the dirty, byte infested corners of Bash and Zsh.  Here's what just happened:

    /Users/sjohnson/Sync/coding/flow_analytics/open_source〉rails new pool_api --api                                                            
    Rails is not currently installed on this system. To get the latest version, simply type:
    
        $ sudo gem install rails
    
    You can then rerun your "rails" command.
    /Users/sjohnson/Sync/coding/flow_analytics/open_source〉ruby -v                                                                                 07/20/2022 05:34:41 AM
    ruby 2.6.8p205 (2021-07-07 revision 67951) [universal.x86_64-darwin21]
    /Users/sjohnson/Sync/coding/flow_analytics/open_source〉rvm use        
    

And that was the point when I realized "Oh yeah -- RVM doesn't work on NuShell" and then it struck me -- I can run Bash:

    /Users/sjohnson/Sync/coding/flow_analytics/open_source〉/bin/bash                                                                               07/20/2022 05:34:57 AM
    bash: /Users/sjohnson/Library/Python/2.7/bin/powerline-config: /usr/bin/python: bad interpreter: No such file or directory
    bash: /Users/sjohnson/Library/Python/2.7/bin/powerline-config: /usr/bin/python: bad interpreter: No such file or directory
    bash: /Users/sjohnson/.iterm2_shell_integration.nu: No such file or directory
    ERROR:  Can't find Ruby library file or shared library lunchy
    usage: dirname string [...]
    
    The default interactive shell is now zsh.
    To update your account to use zsh, please run `chsh -s /bin/zsh`.
    For more details, please visit https://support.apple.com/kb/HT208050.
    [sjohnson:~/Sync/coding/flow_analytics/open_source] [base] $ rails new pool_api --api
    
    create
    create  README.md
    create  Rakefile
    create  .ruby-version
    create  config.ru
    create  .gitignore
    create  .gitattributes
    create  Gemfile
       run  git init from "."
    ...
    
So maybe my system can mostly run NuShell and I can drop in and out of Bash / Zsh when I need different things.  **Fingers Crossed**.