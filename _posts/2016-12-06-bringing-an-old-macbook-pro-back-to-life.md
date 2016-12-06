---
layout: post
title: Bringing an Old MacBook Pro Back to Life
category: osx
tags: ["osx", "mac", "rvm", "ruby", "bundler", "gem", "brew", "cask", "mysql"]
---
This morning has been more than a tad frustrating -- and let's leave Tad out of this, shall we?  I've been engaged in bringing my 2011 MacBook Pro 15 back to life.  After a brief venture into Linux, I found that I really needed the data on this box back and despite my Time Machine woes I was able to restore most everything.  I'm now trying to make it actually a functional development tool since it is the only machine that generally seems to run this particular obsolete gem stack -- although [Dv](http://www.dasari.me/) would argue I should just kill everything and run Vagrant -- something I'm thinking about.

Here's the process I've been thru:

* kill brew and reinstall it: **ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"** and then **ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"**
* kill rvm and re-install it: **rvm implode** and then **\curl -sSL https://get.rvm.io | bash** [Docs](https://richonrails.com/articles/uninstalling-rvm)
* install cask room: **brew cask install google-chrome** [Docs](https://caskroom.github.io/)
* kill bundler and re-install it:  **gem install bundler**
* kill gem and reinstall it: **gem update --system '2.3.0'** [SO](http://stackoverflow.com/questions/13626143/how-to-upgrade-rubygems)

I then updated my [Ansible MacBook Pro configuration routine](https://github.com/fuzzygroup/ansible-macbook-pro) and ran it against the box.  And then I hit a high degree of [code rot](https://fuzzygroup.github.io/blog/rails/2016/12/06/code-rot-is-very-very-real.html) that, well, totally ruined my day.  