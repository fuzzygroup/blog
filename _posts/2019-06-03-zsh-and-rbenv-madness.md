---
layout: post
title: Zsh and RbEnv Madness 
category: ruby
tags: ["ruby", "zsh", "rbenv "]
---
{% pizzaforukraine  %}

I'm a Mac user and I recently switched over from Bash to Zsh.  I then got massive weirdness when I switched from Terminal Window 1, Tab 1 to say Terminal Window 3, Tab 9 (yes I have a problem; I'm sure you have your own problems; now shoo!).  Specifically I would see that in the first Terminal Window, I would get the right version of Ruby and then in the second Terminal Window, I would get the "system ruby".  

This requires a bit of an explanation for the less than Ruby familiar:

 * All (or effectively all; go away you) *nix machines include a version of Ruby aka "System Ruby"
 * The system ruby is generally old and poorly maintained
 * The system ruby is rarely the version of Ruby your application will use
 * You need a "Ruby Version Manager" to set the version of Ruby you need for your application.  Two of the leading contenders are RVM and RbEnv.
 * Both RVM and RbEnv work by shell level fuckery.  Sorry for the swearing but this is how they get under the environment and essentially insert a version of an executable before your standard path.  I also think of both of these as "Dancing Bear" software -- its not how well they dance but that they dance at all.
 * On a directory where you want to use a specific version of ruby you have to create a file called .ruby-version which contains a value like 2.5.1.  This tells RVM or RbEnv to load that version of Ruby when you enter this directory.

Given my allusion to how many terminals and terminal tabs I might have open at any one time, you may have already figured out my issue -- it was my own damn fault.  

The issue was this - if you ever have one terminal reporting a different version from another and both have the .ruby-version file contents then it HAS to be an issue of sourcing .zshrc.  There is likely no other way that this error can occur.  And, sure enough, I realized that this was my first time in this directory since I had changed over from Bash to Zsh.  Here are the suspect lines from .zshrc:

    # rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

These lines add the current path before the system path and then evaluate the rbenv init function.  And this causes any calls for ruby, irb, bundle, gem, etc to go from the right place and not from system ruby.

The solution was to go thru every Terminal Window and Terminal Tab and execute:

    source ~/.zshrc

Note 1: This same type of thing exists for Python (virtual env) and many other languages.  And it is always the same type of fuckery.

Note 2: As always kudos to my pairing partner, [Sean Kennedy](https;//csphere.github.io/), who helping with this.  