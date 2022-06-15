---
layout: post
title: Declaring Ruby Bankruptcy, The Ruby Psych 3.1 Issue, RVM and RBEnv
date: 2022-06-15 02:35 -0400
category: ruby
tags: ["ruby", "rvm", "rbenv"]
---
I had a bloody awful Sunday three days ago.  I had started work on a new application that had Ruby 3.1 set in its Gemfile and I blithely installed Ruby 3.1 using RVM.  And then my life began to suck slimy green toads with errors like this:

    /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/yaml.rb:3: warning: It seems your ruby installation is missing psych (for YAML output).
    To eliminate this warning, please install libyaml and reinstall your ruby.

I'd like to say that I wasn't quite as diligent in fixing this because, well, it was **sunday**.  However, given the readiness by which most of us generally install new versions of ruby, that wasn't it.  We simply aren't used to **breaking** changes with Ruby.

The [ctrl blog](https://www.ctrl.blog/entry/ruby-psych4.html) does a great job of describing this.  Thank you.  The basic issue is that psych is a low level gem and once it changes, well, your world kind of just breaks.

What I pretty much found out immediately is that every single thing I wanted to do with Ruby just failed:

* bundle install
* irb
* rails c
* rake
* And, "drum roll" -- changing over to a different ruby

The fact that I couldn't change over to a different ruby basically meant that I was screwed.  I don't think that this was intended.  And it is entirely possible that this was some kind of whacky interaction on a development system with, ahem, a lot of rubies and crazy legacy conflicts but that is what happened.

## Declaring Ruby Bankruptcy

Since I couldn 't change rubies, everything just devolved into an amazing pool of **suckitude**.  Not only couldn't I use Ruby, I couldn't blog, run any of my utility scripts, etc.  My final answer was to declare *ruby bankruptcy* and:

* delete rvm
* delete rbenv
* delete all references to rvm and rbenv from zsh and other profile files
* reboot
* rm -rf ~/.rvm
* rm -rf ~/.rbenv
* reboot

I've been a long time Ruby user so this process exposed some craziness like 2.3.1 log files owned by root which couldn't be deleted.

## Taking a Break

This was the point where I threw my hands up, walked away and decided that it was a bad day for software.  My workshop, table saw and the desire to get my hands actually dirty (instead of virtually dirty) took over.

## Moving Forward - Separating my 3.1 and 3.1 + Apps from Earlier

After a calming break that involved reducing large pieces of wood to smaller pieces of wood and saw dust, I returned to my computer.  My decision was to be a bit more judicious moving forward with how I managed my rubies.  Given that you have to have different rubies to work on different projects, I decided:

* For anything 3.1 or later, I would use RVM to manage the project
* For anything below 3.1, I would use Rbenv
* To avoid any conflicts, I would further isolate RVM and Rbenv by NOT having Rbenv fully installed in my shell environment

**Note**: RVM and Rbenv are software to manage your ruby versions.  The issue, particularly on OSX, is that the operating system (OS) generally ships with a version of Ruby designed to run system scripts.  As this ruby cannot be replaced since that might break operating system level code, you need a way to isolate application level ruby from OS level ruby.  This led to the creation of tools like:

* RVM
* Rbenv
* asdf
* and others

All of these tools essentially play games with your shell code and pathing to inject a different version of Ruby before the OS level ruby is called.  Opinions on which is better vary but I've historically been an RVM guy, mostly, because it is what I used first.

**Note**:  Once you've installed new rubies, you're going to need to also bundle install **EVERYTHING** all over again because your gem bundles are stored with your rubies.

## Installing RVM and Ruby 3.1

[RVM](https://rvm.io/) can be installed from [https://rvm.io](https://rvm.io) with these two commands:

    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    \curl -sSL https://get.rvm.io | bash -s stable 

Once it is installed, I did:

    source /Users/sjohnson/.rvm/scripts/rvm
    rvm list
    rvm install ruby-3.1.2
    rvm use ruby-3.1.2

These commands do the following:

1. Update my existing shell so it can be used with RVM.  An alternative is closing the shell and re-opening but I don't like to do that.
2. See what rubies are available.
3. Install ruby 3.1.2
4. Use ruby 3.1.2

## Installing Rbenv and Ruby 2.7.1

[Rbenv](https://github.com/rbenv/rbenv) can be installed with:

    brew install rbenv ruby-build
    eval "$(rbenv init - zsh)"
    rbenv install 2.7.1
    rbenv versions
    rbenv local 2.7.1

This was the process I needed to get Jekyll, my ruby based blogging engine working, but there was an additional wrinkle -- bundler:

    ❯ ruby -v
    ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-darwin19]

    blog on  gh-pages [🤷‍] via 💎 v2.7.1 on ☁️  (us-west-2) 
    ❯ bundle install
    Traceback (most recent call last):
    	2: from /Users/sjohnson/.rbenv/versions/2.7.1/bin/bundle:23:in `<main>'
    	1: from /Users/sjohnson/.rbenv/versions/2.7.1/lib/ruby/2.7.0/rubygems.rb:294:in `activate_bin_path'
    /Users/sjohnson/.rbenv/versions/2.7.1/lib/ruby/2.7.0/rubygems.rb:275:in `find_spec_for_exe': Could not find 'bundler' (1.17.3) required by your /Users/sjohnson/Dropbox/fuzzygroup/blogging/blog/Gemfile.lock. (Gem::GemNotFoundException)
    To update to the latest version installed on your system, run `bundle update --bundler`.
    To install the missing version, run `gem install bundler:1.17.3`

    blog on  gh-pages [🤷‍] via 💎 v2.7.1 on ☁️  (us-west-2) 
    ❯ gem install bundler:1.17.3
    Fetching bundler-1.17.3.gem
    Successfully installed bundler-1.17.3
    Parsing documentation for bundler-1.17.3
    Installing ri documentation for bundler-1.17.3
    Done installing documentation for bundler after 2 seconds
    1 gem installed

    blog on  gh-pages [🤷‍] via 💎 v2.7.1 on ☁️  (us-west-2) took 3s 
    ❯ bundle install
    
## Final Thoughts

I'm not going to say that this approach is perfect:

* I have to remember that I'm using two different tools for the same task
* I have know the commands for both tools
* I can't use Rbenv without the eval command

The eval command:

    eval "$(rbenv init - zsh)"

The benefit tho is that I do have careful isolation between 3.1 and earlier rubies.  Yes, I get that this isn't supposed to be necessary -- and maybe it was my system that was at fault -- but I never want to have to declare **Ruby Bankruptcy** again.