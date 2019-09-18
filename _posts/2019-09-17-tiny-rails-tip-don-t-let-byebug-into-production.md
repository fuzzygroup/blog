---
layout: post
title: Tiny Rails Tip - Don't Let byebug into Production
category: rails
tags: ["rails", "ruby"]
---
{:.center}
![IMG_8940.jpeg](/blog/assets/IMG_8940.jpeg)
The Ruby gem byebug is the Ruby debugger and this is normally installed into your Gemfile in this way:

    group :development, :test do
      gem 'awesome_print'
      gem 'byebug'
    end
    
What that says in people speak is "for the environments development and test, install the following gems".

To use byebug, you simply put the byebug command into whatever bit of code you need to debug -- controller, model, background job, view, etc.  But here's how most of us embed byebug:

```
  byebug
```

And, at some point, that is going to wend its way thru development, thru test, dodge past a code review and WHAM! arrive onto production -- where things will quickly grind to a halt since the gem isn't available for production.

There are two easy ways to solve this:

* invoke byebug conditionally tied to the environment
* prevent it from going into your commits via a git hook

## Method 1: Invoke byebug Conditionally

One of the most elegant idioms in the Ruby world is the right hand if.  Here's how to apply it in this case:

```ruby
  byebug if Rails.env.development? || Rails.env.test?
```

This is so damn superior to the alternative:

```ruby
  if Rails.env.development? || Rails.env.test?
    byebug
  end
```

I know it is only two additional lines but you spend enough time in code and that additional "visual cruft" really comes to annoy.

## Method 2: A Git Hook

A git hook is a script file that is run automatically by git when an action happens like **pre-commit**.  My personal favorite git hook is always pre-commit because that action prevents badness from getting into the repository.  A pre-commit script is simply an executable shell file which runs before the commit action and if it returns any output then the commit is halted.  

What is below is a ruby script which I've been using for ages and ages.  My former employee DV Suresh first wrote it for me and then I rewrote it from memory when I moved on from that position.  This script:

* Checks for syntax errors
* Looks for byebug calls without guard clauses

The byebug functionality is new and was written just for this blog post.  It doesn't seem to be dodgy but, well, late night coding and all that.

Here's an example of the output:

    ➜  web_change_me_now git:(247-badges) ✗ git add app/models/habit.rb
    ➜  web_change_me_now git:(247-badges) ✗ git commit -m "revised habit.rb to check byebug"
    in .git/hooks/pre-commit
    app/models/habit.rb:
      TODO: Add a guard clause to your byebug call
        byebug
        
What just happened was I added a single file, a model.  The add will always happen cleanly since this is a pre-commit not a pre-add.  But when the commit happens, the code is checked for a naked byebug and the commit process is then halted and a todo note is generated.

Here's the whole script:

```ruby

#!/usr/bin/env ruby
#
# A hook script to verify that only syntactically valid ruby code is commited.
# Called by git-commit with no arguments. The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.
#
# Put this code into a file called "pre-commit" inside your .git/hooks
# directory, and make sure it is executable ("chmod +x .git/hooks/pre-commit")

puts "in .git/hooks/pre-commit"

require 'open3'
include Open3

# Set this to true if you want warnings to stop your commit
stop_on_warnings = false
stop_on_errors = true

compiler_ruby = "$HOME/.rvm/rubies/ruby-2.6.3/bin/ruby"

changed_ruby_files = `git diff-index --name-only --cached HEAD`.split("\n").inject([]) do |files, line|
  files << line.chomp if line =~ /(.+\.(e?rb|task|rake|thor)|[Rr]akefile|[Tt]horfile)/
  files
end


#
# Compilation check; designed to catch syntax errors
#
problematic_files = changed_ruby_files.inject([]) do |problematic_files, file|
  if File.readable? file
    cmd = if file =~ /\.erb\z/
      # Set trim mode to "-", just as Rails does
      # Replacing all <%= tags with <% for the syntax check
      "sed 's/<%=/<%/g' #{file} | erb -xT - | #{compiler_ruby} -wc"
    else
      "#{compiler_ruby} -wc #{file}"
    end

    errors = nil
    popen3(cmd) do |stdin, stdout, stderr|
      errors = stderr.read.split("\n")
    end

    errors.reject!{ |line| line =~ /[0-9]+:\s+warning:/ } unless stop_on_warnings
    errors.reject!{ |line| line =~ /[0-9]+:\s+syntax error/ } unless stop_on_errors

    unless errors.empty?
      errors.map!{ |line| line.sub(/#{file}:/, '') }
      problematic_files << "#{file}:\n#{errors.join("\n")}"
    end
  end

  problematic_files
end

#
# looking for byebug calls
#
byebug_files = changed_ruby_files.inject([]) do |byebug_files, file|
  if File.readable? file
    cmd = if file =~ /\.erb\z/
      # Set trim mode to "-", just as Rails does
      # Replacing all <%= tags with <% for the syntax check
      "sed 's/<%=/<%/g' #{file} | erb -xT - | #{compiler_ruby} -wc"
    else
      #"#{compiler_ruby} -wc #{file}"
      "cat #{file} | grep byebug" 
    end

    errors = nil
    popen3(cmd) do |stdin, stdout, stderr|
      errors = stdout.read.split("\n")
    end
    
    # this can't use stop_on_errors or stop_on_warnings because those are tied to 
    #  the compiler and this is purely a grep check
    errors.reject!{ |line| line =~ /Rails.env.test\?/ || line =~ /Rails.env.development?/ || line =~ /#byebug/}

    unless errors.empty?
      errors.map!{ |line| line.sub(/#{file}:/, '') }
      byebug_files << "#{file}:\n  TODO: Add a guard clause to your byebug call\n#{errors.join("\n ")}"
    end
  end

  byebug_files
end

if byebug_files.size > 0
  $stderr.puts byebug_files.join("\n\n")
  exit 1
else
  puts "no byebugs left in the code without guard clauses; All is happiness and light"
  exit 0
end

if problematic_files.size > 0 
  $stderr.puts problematic_files.join("\n\n")
  exit 1
else
  puts "no syntax errors"
  # All is well
  exit 0
end
```

 If you want to use this then create a pre-commit file in your .git/hooks directory in your application and make it executable with:
 
     chmod +x .git/hooks/pre-commit
     
**Note**: The files in .git/hooks are NOT checked into your repo with a commit.  They need to be manually distributed to each team member (or that's how it was a few years ago at least; that may have changed.)