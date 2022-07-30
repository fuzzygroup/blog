---
layout: post
title: Writing Ruby Programs Like a Python Programmer
category: ruby
tags: ["ruby", "python"]
---
{% pizzaforukraine  %}

As of late, I have found myself writing a number of what amount to "Non Rails" tools.  These are tools that tend to:

* Run continuously in the background
* Are deployed as SystemD services on Unix boxes
* Have the normal issues of coding complexities between development (OSX) and production (Ubuntu)

Even though I normally just generate a Rails application for even my command line tools, this project felt like minimalism was called for and, well, I wanted that particular challenge.

In the remainder of this blog post, I'm going to talk about what this looks like and what I've learned from spending a few months in the Python world and how I'm applying it here.

## File Structure

Here's a directory listing from one of these tools.  The thing to understand is that "ohi" is the abbreviation for the project (which explains why you see it multiple times).

    ❯ ls -l
    total 64
    -rw-r--r--@ 1 sjohnson  staff   189 Feb 24 09:58 Gemfile
    -rw-r--r--  1 sjohnson  staff  2083 Feb 24 09:58 Gemfile.lock
    -rw-r--r--@ 1 sjohnson  staff   307 Feb 24 10:21 README.md
    -rwxr-xr-x@ 1 sjohnson  staff   111 Feb 24 14:35 deploy.sh
    -rw-r--r--@ 1 sjohnson  staff  3542 Feb 24 14:07 loader.rb
    -rw-r--r--@ 1 sjohnson  staff  1477 Feb 24 14:12 loader_kafka_to_ohi.rb
    -rw-r--r--@ 1 sjohnson  staff   436 Feb 24 10:29 loader_kafka_to_ohi.service
    -rw-r--r--@ 1 sjohnson  staff   125 Feb 24 10:22 loader_kafka_to_ohi.sh

Here is the role of each of these pieces:

* Gemfile / Gemfile.lock -- the standard Ruby packages that the tool relies on
* README.md -- the Readme
* deploy.sh -- a shell script that SCP's everything up to a deployment server.  Yeah, yeah. I need CI/CD.  And it will come but for now this makes deployment easy.
* loader.rb -- the "God" class for this tool (explained below)
* loader_kafka_to_ohi.rb -- the actual main loop for the tool
* loader_kafka_to_ohi.service -- the SystemD service file for this
* loader_kafka_to_ohi.sh -- the shell script called by the SystemD service file 

## It really is About Separating def main From Supporting Functions

While all these tools tend to come down to the 8 files above (or variants on them), the bulk of it is in two files:

* loader_kafka_to_ohi.rb 
* loader.rb 

The first file, loader_kafka_to_ohi.rb, basically amounts to  a few sections:

* A comment at the very top showing how to execute it including any command line arguments
* A set of require statements to load the gems (remember - this isn't Rails so you need to manually require your gems)
* Constant declaration
* A def main function
* A call to execute main()

Here's the skeleton:

```ruby

#
# Execution Example
# RAILS_ENV=development TOPIC=reddit ruby loader_reddit_to_kafka.rb
#

require 'json'
require 'kafka'
require 'mechanize'
require 'ostruct'
require 'redd'
require 'redis'
require_relative 'loader'

TOPIC = ENV['TOPIC']

def main
  # code here
end

main
```

**Note 0**: You'll notice that I still use the convention of RAILS_ENV for the environment; I'm too damn trained at this point in my career to even consider naming that something else

Having written a number of these tools lately, I can definitively state that there is a **huge** clarity of code benefit to separating out the main loop from the supporting code.  It is a forest for the trees sort of thing.

The second file, loader.rb, is a "God Class" which wraps every function used by main (or any of the functions that main calls) into a single class.  Given that the underlying function of this tool is to load data, well, I call the class: Loader i..e

```ruby
class Loader
end
```

Even though a God class is generally a bad thing (poor use of name spaces, too big, etc.), I found it to be a decent compromise in terms of abstractions simply because it makes debugging *trivial*.  I find myself constantly switching between local development and remote development (where all my tooling like Kafka, my API server, etc) exist.  With a god class like loader, I can easily ssh into my production box and then just use irb in my deployment directory to:

```ruby
require_relative 'loader'
```

and then continue figuring out whatever problem has come up with easy access to functions in my god class (everything is just a def self.whatever method in loader.rb so all methods can be called trivially).

**Note 1**: My main loop including require statements, constants and declarations is less than 60 lines and my god class is less than 160 lines.  As I said this is a compromise.

**Note 2**: Normally the term God object is used instead of "God class" but since I'm not actually ever instantiating an object, it felt like God class was more accurate.

**Note 3**: But shouldn't you always have your development environment mirror your production environment?  Sure in an ideal world but Kafka servers are a *damn censored* pain in the arse to setup where as the AWS managed kafka service is almost brainless in its simplicity.  This is a very lightly staffed project and I chose to spend my time on coding rather than DevOps (and, yes, getting something complex installed locally is still DevOps).

## Use require_relative to Import A God Class

The key technique to making this style of development work was my realizing that while [require](https://www.thoughtco.com/requre-method-2908199) worked for gems, it worked poorly, if at all, for my own function libraries.  The reason for this is apparently Ruby madness with respect to the current working directory or cwd.  Happily [require_relative solves this issue with flying colors](https://stackoverflow.com/questions/9750610/ruby-require-error-cannot-load-such-file).

## Where's the Python Connection?

I find this technique, a god class with require_relative, to be very similar to coding in Python using import statements.  Oddly Python feels a bit more object oriented because anything you import automatically gets treated as a namespace that makes coding look like a class.  Python folk use this technique very readily and I find that flexibility quite pleasant in Ruby (even if I have to define a class to make it work).

**Note 4**: Yes I should be able to do this also with [modules](https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html) but I've found modules to be problematic in past experience so ... (and I freely admit that it might be me).

## What About Test Coverage

While I shudder to admit it, I actually haven't written test coverage for these things yet.  When I do I'll figure out how to graft test coverage onto a non Rails application.