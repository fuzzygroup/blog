---
layout: post
title: Getting Around Spotlight's Madness
category: osx
tags: ["osx", "spotlight", "mdfind"]
---
{% pizzaforukraine  %}

Spotlight is the Apple / OSX search engine and I find it absolutely, blindingly maddening.  The way Spotlight seems to work, when you use it from the OSX search icon, is that it tells you what it found but not **where** it found it.  And I get that filesystems are passe and we are supposed to be in a post file world, blah, blah, blah.  And I call bullshite on that.  I'm a professional software developer and knowing where things actually exist is actually fricking important.  

And here's how to do that with Spotlight -- use mdfind directly.  mdfind is the underlying  command line executable that also executes spotlight searches.  Earlier today I was struggling to remember the name of a Ruby gem and all I knew was that it had "icon" in its name.  So here's what I did:

    mdfind icon -onlyin /Users/sjohnson/Dropbox/fuzzygroup/ | grep Gemfile

And this command looked for the string of characters "icon" but only in the directory where I keep all of my many, many Rails projects.  And then I fed it thru a grep command to find only the references to Gemfile.  And this very quickly led me to [identicon](https://github.com/victorgama/identicon) which is a gem which builds [Stack Overflow like abstract user avatars](https://meta.stackexchange.com/questions/17443/how-is-the-default-user-avatar-generated).


