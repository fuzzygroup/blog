---
layout: post
title: Show Hidden Files On OSX
---
When you're initializing git repos and using the finder, it is very convenient to be able to see hidden files in OSX.  Here's how:

> defaults write com.apple.finder AppleShowAllFiles TRUE;  killall Finder

And if you want an alias:

> alias show-hidden-files="defaults write com.apple.finder AppleShowAllFiles TRUE;  killall Finder"  # Show hidden files
> alias hide-hidden-files="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"  # hide hidden files

A shout out to my buddy [Dv](http://dasari.me/) for giving me these lines so graciously while pair programming yesterday.