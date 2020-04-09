---
layout: post
title: YES YES YES - Importing Constants from Python to Ruby at Execution Time
category: ruby
tags: ["ruby", "python", "adl"]
---
{:.center}
![IMG_3001.jpeg](/blog/assets/IMG_3001.jpeg)

This is going to fall into the category of "Dancing Bear" coding in that it isn't how well it works or how elegant it is, it is that it, like the bear, dances at all.  Here's the problem.

Three code bases that live in:

* ohi_kafka/experts-all (python)
* ohi_kafka/loader_reddit_to_kafka (ruby)
* ohi_kafka/loader_twitter_to_kafka (ruby)

And a series of code modules that define array of regular expressions in a constant always named REGEXES that live in files named like this:

* common_invective_anti_semitism.py
* common_invective_anti_black.py
* common_invective_anti_lgbtq.py
* common_invective_anti_islam.py
* common_invective_anti_woman.py

**Note**: A discussion of why the naming conventions here are this way and why lgbtq is lumped here as one thing is beyond the scope of this blog post (I personally disagree with that but I lost that argument months ago; sorry).

These regexes need to be run both in the context of the python code base and the ruby code base.  These regexes are defined as arrays of strings such as:

```python
REGEXES = [
  'foo',
  'Bar'
]
```

The magic in making this work is really, really, really understanding your deployment context, specifically:

* all code will be deployed on the same machine (it will execute across multiple machines) but since I control deploy, I can ensure that the full code stack is present
* no Docker for the ruby portion - just pretty vanilla Ruby code executing on a server as a SystemD service
* Being tricksy, very, very tricksy

My first attempt to make this work was to try and use an extension with both require and require_relative:

```ruby
require "../experts-all/common_invective_anti_semitism.py"
Traceback (most recent call last):
       16: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/bundler-2.1.2/libexec/bundle:46:in `block in <top (required)>'
       15: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:24:in `start'
       14: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/base.rb:476:in `start'
       13: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:30:in `dispatch'
       12: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor.rb:399:in `dispatch'
       11: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/invocation.rb:127:in `invoke_command'
       10: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
        9: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:476:in `exec'
        8: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:28:in `run'
        7: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `kernel_load'
        6: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `load'
        5: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<top (required)>'
        4: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        3: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        2: from (irb):1
        1: from (irb):1:in `require'
```

And that was clearly a miserable and abject horror show way to start my morning.  The next up was to eliminate the extension and see, while tearing up with laughter, if it would work:

```ruby
require_relative "../experts-all/common_invective_anti_semitism"
Traceback (most recent call last):
       16: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:24:in `start'
       15: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/base.rb:476:in `start'
       14: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:30:in `dispatch'
       13: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor.rb:399:in `dispatch'
       12: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/invocation.rb:127:in `invoke_command'
       11: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
       10: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:476:in `exec'
        9: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:28:in `run'
        8: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `kernel_load'
        7: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `load'
        6: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<top (required)>'
        5: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        4: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        3: from (irb):2
        2: from (irb):3:in `rescue in irb_binding'
        1: from (irb):3:in `require_relative'
```

Apparently require() specifically looks for .rb and .so and .dll extensions.  Sigh / insert a censored verbal expression that I should not say out loud while my wife is sleeping as I write this up.

And this was the step back moment where I thought about other mechanisms like loading the file as a string and then evaluating it with eval.  And, yes, that would have worked but runtime evals are almost always bad practices. And then I thought "what about trying load() instead of require()".  The difference between load() and require() is that a require happens only once per code execution but a load() can happen multiple times.  And since I know a lot about how coders work, my thinking was that perhaps the implementer of load() didn't check for an extension.  Here's my test code:

```ruby
load "../experts-all/common_invective_anti_black.py"
/Users/sjohnson/Sync/fuzzygroup/adl/ohi_kafka/experts-all/common_invective_anti_black.py:1: warning: already initialized constant REGEXES
/Users/sjohnson/Sync/fuzzygroup/adl/ohi_kafka/experts-all/common_invective_anti_semitism.py:1: warning: previous definition of REGEXES was here
true
2.7.0 :005 > REGEXES
[
    [ 0] "foo"
```

**Note**: These regexes are to detect invective for hate speech so I've omitted them here because they are beyond offensive (and proprietary to my day job).

And that's my solution - 

## Changes to the Python Side of the House 

Happily there were only three changes that had to be made to the python side of the house:

1. Restructure the constants from an array of strings at the top of the python script that used them to the new common_invective_whatever.py file.
2. Change their name from REGEXES to REGEXES_WHATEVER since at the Ruby layer I will have all of them operating at the same time and you shouldn't redeclare the same constant multiple times; they are CONSTANTS!
3. Add an import mechanism that brings in the constant from a file i.e. "from common_invective_anti_WHATEVER import *"

## Sidebar: What if load() didn't work for me?

As you read through this you are likely thinking "wow -- if load checked the file extension then Scott was **screwed**".  And, well, *no*.  My backup plan was actually pretty simple and involved writing a method that did this:

```ruby
# rough psuedo code since I didn't actually have to do this
def load_regexes(file)
  base_name = File.basename(file)
  `cp ../experts-all/#{file} ../experts-all/#{file}.rb`
  require("../experts-all/#{base_name}.rb")
```

Yep - I would have gotten around this by just stripping the extension and then copying it to a .rb file and then requiring that.

## Conclusion - Its All About Perspective

When you read a blog post like this you could marvel at the Rube Goldberg machinations and argue whether this was good or bad.  And I myself often do wonder a bit.  But I started from three things:

1. Dry or "Do Not Repeat Yourself".  [DHH](https://twitter.com/dhh) while he wasn't the first to utter this has been a stalwart proponent of this and it has proved, generally, to be a solid engineering principle.  Every single time you have the same code in multiple places, well, we all know that's a shite show waiting to happen.  And duplicating constants, even across languages, is just plain awful.
2. Ruby and Python happily share the same core array syntax.  This meant, to me, that it was *reasonable* to find a way to make them co-exist.
3. This wasn't a hard concept and it should, if you took the time to understand the problem, be achievable in a reasonable amount of time.  I actually solved this in far less time than it took to write this blog post. But, and this is important, systems have long life spans.  Someone who maintains this system will come after me and need to understand why I took this route and this blog post will make that possible.

Point #3 above, to me, reflects the difference between having literally decades of software engineering experience and perspective (I've been writing code now since '81 when I got my first computer) and being a more junior person.  As a junior engineer, I'd have simply waved my hands in the air and duplicated the data.  Now I can see that while there are only 5 files of regular expressions now, moving forward there will be N files and their contents will constantly change.  This approach means the only **real** coupling between Ruby and Python needs to be updating the lists of files.

**Note**: Because Python and Ruby both use # to indicate comments, I'll be adding comments to the top of the constant files to indicate the need for this coupling.

And, in closing, do you now see why I described this blog post as a dancing bear?  The dancing wasn't pretty but I made it dance.

## References

* [Ruby Learning](http://rubylearning.com/satishtalim/including_other_files_in_ruby.html)
* [ThoughtCo](https://www.thoughtco.com/requre-method-2908199)
* [RubyCademy on Require](https://medium.com/rubycademy/requiring-a-file-or-library-in-ruby-29f99e5e2c6a)
* [RubyCademy on Load](https://medium.com/rubycademy/loading-a-file-in-ruby-51463a1c6c7e)
* [Stack Overflow in Python Imports](https://stackoverflow.com/questions/6343330/importing-a-long-list-of-constants-to-a-python-file)