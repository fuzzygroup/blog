---
layout: post
title: Moving to Zsh on OSX in 2019
category: shell
tags: ["shell", "zsh", "osx"]
---
Note: Before you follow these instructions, see Postscript at the end.

I have a long and twisted relationship with *nix shells.  My computing history started on 8 bit boxes where the was close to no shell (just Basic) and then transitioned to DOS.  I moved to Unix initially in 88 (Sun 3s) and then went to Linux full time in '99 and OSX finally in 2005.  And despite all that, I still struggle with *nix shells; my prompt is never right, my shell scripting blows chunks, etc.  Sigh.  But the one thing I hate, hate, hate, *censored* hate is that with Bash, my history is always screwed up.  I actually like Bash a bit but I am so damn tired of every Bash session on my machine having a different history and each terminal window racing in a Darwinian competition of "let my history win!".  

Just to clarify, in a terminal your history is the list of commands that you executed.  And since the types of commands I issue can be frighteningly complex, I want access to all my previous commands - *period*.  I'm absolutely binary on this issue, access to all your commands is a good thing.  And commands being lost is a bad thing; a *censored*ing bad thing.

My good friend Sean and regular pairing partner, Sean Kennedy, told me that Z-Shell solves this and, when I had an opportunity, I was ready for it.  Here's the short process:

1. Close everything.
2. Install Mojave if you haven't (yes I'm antiquatedly retro in the speed by which I upgrade operating systems; sorry / not sorry).
3. Install Z Shell with Home Brew
4. Install Oh My Zsh which makes ZShell so much better
5. Execute a change shell command 
6. Update Your .zshrc File
7. Log out and then in on your Mac.  Yes this shouldn't be necessary but #$(#$*# Apple.

Steps 3 forward are covered below.

# 3 - Install Z Shell with Home Brew

Execute this:

    brew install zsh

# 4- Install Oh My Zsh

Execute this command:

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 5 - Change Your Shell

You may find that installing Oh My Zsh changes your shell.  If it doesn't then you need to do this:

    chsh -s $(which zsh)

And then a:

    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# 6 - Update Your .zshrc

The file .zshrc is your zsh configuration file.  Edit it as follows:

1. Open this file in an editor. 
2. Comment out the robbyrussell theme line by prefixing it with a # character.
3. Add the following lines after the robbyrussell theme line (change the username csphere to your own).

Here are the cahnges to make:


    # Oh My Zsh
    export SPACESHIP_GIT_SYMBOL=''
    export SPACESHIP_PACKAGE_SYMBOL='package '
    export SPACESHIP_NODE_SYMBOL='node '
    export SPACESHIP_RUBY_SYMBOL='ruby '
    export SPACESHIP_ELIXIR_SYMBOL='elixir '
    export SPACESHIP_XCODE_SYMBOL='xcode '
    export SPACESHIP_SWIFT_SYMBOL='swift '
    export SPACESHIP_GOLANG_SYMBOL='go '
    export SPACESHIP_PHP_SYMBOL='php '
    export SPACESHIP_RUST_SYMBOL='rust '
    export SPACESHIP_DOCKER_SYMBOL='docker '
    export SPACESHIP_AWS_SYMBOL='aws '
    export ZSH=/Users/csphere/.oh-my-zsh
    ZSH_THEME="spaceship"
    ZSH_CUSTOM=~/.zsh-custom/
    plugins=(
      git
    )
    source $ZSH/oh-my-zsh.sh

# A Slack Conversation About This

    scott.johnson [9:26 AM]
    So I just tried to search my history and am I doing it right:

    history | grep ssh
      69* ssh 172.31.21.29

    that’s not showing the ssh line I got from you to get into jenkins which concerns me about the command line history.  Am I doing something wrong?

    So I found it by looking in ~/.zsh_history

    Sean Kennedy [9:32 AM]
    edit your zsh history
    err
    edit your zshrc

    scott.johnson [9:33 AM]
    ok…

    Sean Kennedy [9:33 AM]
    ```HISTFILE=~/.zsh_history
    SAVEHIST=100000```
    then source it
    will probably need to source it in every active terminal

    scott.johnson [9:33 AM]
    thx man

    Sean Kennedy [9:33 AM]
    np

# Postscript

So I just tried to follow this exactly on a new machine and it both worked and didn’t work.  It worked in the terminal window where I started but it failed in any new window.  I think the issue amounted to:

* On OSX Mojave after a chsh operation you need to log out and log back in.  My guess is that this one thing fixes everything but just in case, follow the next steps.
* I needed (perhaps) a bootstrap shell script called ~/sourcezsh.sh which has in it only three lines:

    #!/bin/bash
    # adjust as needed
    export ZSH=/Users/sjohnson/.oh-my-zsh
    source $ZSH/oh-my-zsh.sh

In the event that this fails for you then here are the links which helped me sort it out:

* [Stack Overflow on bash to ZSH](https://superuser.com/questions/362372/how-to-change-the-login-shell-on-mac-os-x-from-bash-to-zsh)
* [Thoughtbot Issues on Zsh](https://github.com/thoughtbot/laptop/issues/447)
* [Robby Russell Issues on Zsh](https://github.com/robbyrussell/oh-my-zsh/issues/6405)
* [AutoLoad and Zsh](https://stackoverflow.com/questions/30840651/what-does-autoload-do-in-zsh)

Note: I’d have solved this more definitively but my machine is rebuilding a 100gig archive of hate speech for data processing and, well, I simply can’t log in and out right now.  Sigh.

And I wouldn't have posted this except that it mostly worked and I needed it myself to move forward.  Still I hate like hell that it is ambiguous.  Sorry.

# References

 * [Rick Cogley](https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/) 
