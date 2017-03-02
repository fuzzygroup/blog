---
layout: post
title: Working with the Gem Ecosystem Part 2 - Updating Gems and Writing Generators
category: ruby
tags: ["ruby", "rails", "generators", "pattern_generator", "hyde"]
description: When you create your own gem it can sometimes be hard to get it to update in the Gemfile where you use it.
---
In case you haven't figured out yet that I write stuff here as much for myself as for anyone else, well, its true.  Almost every single day I find myself going back to my own blog as a reference tool.  Today I'm writing a part two to my [Working with the Gem Ecosystem](http://fuzzyblog.io/blog/ruby/2016/08/17/working-with-the-gem-ecosystem.html) post.

My thanks are extended to [Nick](http://www.nickjanetakis.com/blog/) who helped clarify the Gem update process and pointed out the need to embed the branch name in the Gemfile.  He picked this up from his work on the [Orats gem](https://github.com/nickjj/orats) which is very useful if you're into Rails and Docker.

# Generators

I'm a big believer in custom generators and I've always found the process of writing them to be convoluted at best.  I recently found [pattern_generator](https://github.com/sungwoncho/pattern_generator) which makes writing generators drop dead easy.  I'm writing a project now where a major part of the process is writing custom data parsers for all kinds of web sites -- udemy, leanpub, pluralsight, instagram, etc.  These are all PORO (plain old ruby objects) i.e. no ActiveRecord backed and I wanted a custom generator which:

* created my class
* created my template
* filled out the boilerplate structure

Happily pattern_generator is just plain perfect. Here's all I did

* fork the gem
* clone it to my computer
* open it in an editor
* create a directory
* add my template class
* add my template spec
* replace the class name with erb style output tags

And while this worked great, I ran into issues when I started making changes ...

**Note:** The issues I had here are mine and mine alone.  [Sung Won Cho](https://github.com/sungwoncho) did a great job on pattern_generator and I thank him for it.

# And Now Back to Gems

My problem came when I added my fork of pattern_generator to my project's Gemfile and did a bundle install.  At first the gem came down perfectly but I noticed a few bugs.  I then updated my code and re-bundled and *nothing*.  I didn't get any of my changes.  Here's how I had it in my Gemfile initially:

```ruby
gem 'pattern_generator', :git => 'https://github.com/fuzzygroup/pattern_generator.git'
```

Naturally this was located in a development only section of the Gemfile since we don't want the memory overhead of this in production.

My first thought was that this was tied to a bundle update versus bundle instlal so I did:

> bundle update

And, again, nothing.  Next I tried:

> bundle update --source=https://github.com/fuzzygroup/pattern_generator.git

I would have expected a bundle update pattern_generator to work but I did not find that to be the case.  But even with specifying the source explicitly I still did not get the right version of my code.  Happily Nick and I were about to pair anyway so I asked him and he honed right in on the branch i.e. specify the branch in the Gemfile.  Here's how that looks:

```ruby
gem 'pattern_generator', :git => 'https://github.com/fuzzygroup/pattern_generator.git', :branch => "master"
```

And that worked perfectly.  I wrote several new parsers today and then used my [SyncDotRake](https://github.com/fuzzygroup/sync-dot-rake) toolkit to merge the parsing code into a new Service Oriented API.  Overall it was a damn good day.  Thanks Nick!

**Note:** I next updated the gem on the following day and **could not get** it to update at all.  I finally tried:

> bundle update pattern_generator

and that actually seemed to work consistently and reliably.
