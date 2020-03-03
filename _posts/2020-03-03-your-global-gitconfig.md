---
layout: post
title: Your Global .gitconfig
category: git
tags: ["git"]
---
{:.center}
![IMG_2192.jpeg](/blog/assets/IMG_2192.jpeg)

I had a question recently about my use of **git trash** which isn't a standard git command.  I accomplished this, about a decade ago, by modifying ~/.gitconfig and, well, I haven't thought about it ever since.  Here's my ~/.gitconfig as an example.

    [color]
    diff = auto
    status = auto
    branch = auto
    [color "branch"]
    current = yellow reverse
    local = yellow
    remote = green
    [color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
    [color "status"]
    added = yellow
    changed = green
    untracked = cyan
    [user]
    name = Scott Johnson
    email = blahblahblah@gmail.com
    [alias]
    co = checkout
    st = status
    br = branch
    trash = checkout -f
    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
    [apply]
    whitespace = nowarn
    [core]
    excludesfile = /Users/sjohnson/.gitignore_global
    [difftool "sourcetree"]
    cmd = opendiff \"$LOCAL\" \"$REMOTE\"
    path = 
    [mergetool "sourcetree"]
    cmd = /Applications/SourceTree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
    trustExitCode = true
    [filter "lfs"]
    clean = git-lfs clean -- %f
    smudge = git-lfs smudge -- %f
    required = true
    process = git-lfs filter-process
    [push]
    default = simple
    
The key thing, to support git trash, is the [alias] section.  This is where you can define your own custom commands based on the fundamental git primitives.  My git lg command is also pretty nice (and courtesy from Sean Kennedy).

Another really, really useful thing is the excludesfile setting which lets you tell git to never, ever worry about a file like the cursed **.DS_Store** files which OSX persists in generating.  

This is generally stored in something like /Users/username/.gitignore_global. 