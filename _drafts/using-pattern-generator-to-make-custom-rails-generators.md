---
layout: post
title: Using Pattern Generator to Make Custom Rails Generators
---
Welcome to the pattern_generator wiki!

I'm a user of pattern_generator, not the author, so any mistakes here are mine and mine alone.  I've been very impressed by this gem so I thought I'd write some documentation as a thank you.  Here's how to use this for your own project and write your own generators.

1.  Fork It.  Start by forking this to your own repo on github.

2.  Clone It.  Clone your fork down to your local dev system.

3.  Change It.  Follow the directions on this repo's home page to create a custom generator.  Basically you're going to write a template for a class and a template for a spec / test file.

4.  Add It.  Add pattern_generator to your Gemfile in one of your development groups.  You need to call out the master branch specifically.  Here's an example:

>   gem 'pattern_generator', :git => 'https://github.com/fuzzygroup/pattern_generator.git', :branch => "master"

5.  Add / Commit / Push.  Get your changes into github.

6.  Change Dir.  Change your working directory to the repo where you want to use your new generator and do a bundle update pattern_generator.

7.  Use It.  Run your new generator with bundle exec rails g WHATEVER

Enjoy!