---
layout: post
title: Things Winston Taught Me
category: git
tags: ["git", "terminal"]
description: Working with another developer always shows you new tricks.  Here Winston gave me a good set of git shortcuts for easing commits in the terminal.
---
As I discussed in my article on what [Ganesh taught me](http://fuzzyblog.io/blog/learning/2017/03/02/things-ganesh-taught-me.html), working with another engineer is a great way to learn new things.  Last week I also worked with [Winston](http://winstonkotzan.com/) and he showed me some git short cuts you can add to your bash profile.

# How I Use Git

I've tried a number of git UI tools over the years but I keep coming back to the command line.  Here's my work flow:

* git status
* git add some_file
* git commit -m "a commit message"
* git push origin master

I'm pretty much a straight command line guy.  And because I try very hard to avoid rollup commits, this can make the commit process tedious.

# How Winston Uses Git

Winston showed me his process: 

* gs
* ga 
* gc "a commit message"
* gpc 

These abbreviations are a heck of a lot shorter than what I've been typing so that's clearly a win.  My one objection to his approach is that ga adds EVERYTHING.  My preference is atomic commit messages so I really would prefer to have two aliases for add:

* ga some_file
* gaa (adds everything)

Here's how Winston originally implemented this:

    alias gundo='git reset --soft HEAD~1'
    function gc() {
      git commit -m "$*"
    }
    alias gcurrentbranch='git rev-parse --abbrev-ref HEAD'
    alias ga='git add .'
    alias gs='git status'
    alias gl='git log --oneline'
    alias gpc='git push origin $(gcurrentbranch)'
    
Here is my version:

    