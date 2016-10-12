---
layout: post
title: Hacking Bundler For Fun, Profit and Less Anger at the World
category: bundler
tags: ["bundler", "ruby", "open_source", "github"]
---
I recently wrote a blog post about my rage at Bundler and the fact that I have to manually remember than when the command:

    gem install json -v1.8.1
    
blows up, I have to remember to instead use:

    gem install json -v1.8.3
    
As someone who has consulted on a LOT of different ruby code bases, I see this constantly.  At times it feels that every time I start a project I have to face some kind of gem / bundler issue.  Now my friend Nick would argue that this is really something best solved by Docker and he does have a point.

But me?  I'm stubborn.  I want this fixed and I'm finally willing to stop bitching and write some code to do so.  I mean that's what open source is about.  

# The Solution

People are universally bad at remembering complex things.  And when complex things have negative contexts, they are even worse at remembering them.  I **hate** gem failures.  And I don't mean I hate them a little - gem install failures send me into a rage.  And every time I fix it, I promptly forget about it.  What I want to do is tell bundler about the solution I found to the problem.  I want bundler to **learn**.  Here's my proposed syntax:

    bundle learn bad="" good=""
  
And here's an actual example:

    bundle learn bad="gem install json -v1.8.1" good="gem install json -v1.8.3"
    
So what do we need to make a learn option work?  Here's my initial thoughts:

1.  We need to add learn as an option with two parameters, good and bad.
2.  We need a method which takes the two parameters and saves them to disc
3.  We need test coverage
4.  We need to hook into the overall failure mode and display any things that we learned that have a close match to the actual failure.
5.  Long term: Allow these learnings to be shared over the Internet so that other people can benefit from the issues that you solved.

# The Context - In the Minivan

When I thought of this I was out and about with my wife and teenage son on *The Great Home Schooling Lobster Misadventure*.  While they were shopping before we picked up the lobster that we needed, I thought of this sitting in a minivan in the parking lot.  I don't have a lot of time and I don't have much in the way of connectivity so here's what I did:

1.  Found the [bundler source](https://github.com/bundler/bundler) on github.
2.  Forked it to my [github account](https://github.com/fuzzygroup/bundler).  
3.  Cloned it to my local box.
4.  Changed to the right directory.
5.  Set the ruby version with RVM.
6.  Opened the directory in TextMate with mate .
7.  Read DEVELOPMENT.md and do steps 1 (groff), 2 (dependencies) 3 (run tests) and 4 (shell alias).
7.  Try and figure out where this might go.  And fail **miserably** -- bundler is big!

If you think about the code that I want to write, I actually don't need to understand very much about bundler.  All I need to do, at least to start, is add a command line option that writes some data to a file.  Making this get looked up by a bundler failure obviously will be harder.

# Search to the Rescue!

Whenever I'm faced with a complex code base and the need to find an integration point, I always, always do the same thing -- I **search**.  My rationale was this:

  There must be a relatively unused command line option in bundler.  If its relatively unused there won't be a lot of calls to it so finding it should be simple.  
  
Running bundle --help and paging thru the results showed me the viz option which I had never heard of.  Here's a screen shot:

![bundler_viz.png](/blog/assets/bundler_viz.png)  

# Hacking cli.rb

What I found was cli.rb where there was a method that seemed to indicate that you could patch in.  Here's what it looks like:

    desc "viz [OPTIONS]", "Generates a visual dependency graph"
    long_desc <<-D
      Viz generates a PNG file of the current Gemfile as a dependency graph.
      Viz requires the ruby-graphviz gem (and its dependencies).
      The associated gems must also be installed via 'bundle install'.
    D
    method_option :file, :type => :string, :default => "gem_graph", :aliases => "-f", :desc => "The name to use for the generated file. see format option"
    method_option :format, :type => :string, :default => "png", :aliases => "-F", :desc => "This is output format option. Supported format is png, jpg, svg, dot ..."
    method_option :requirements, :type => :boolean, :default => false, :aliases => "-R", :desc => "Set to show the version of each required dependency."
    method_option :version, :type => :boolean, :default => false, :aliases => "-v", :desc => "Set to show each gem version."
    method_option :without, :type => :array, :default => [], :aliases => "-W", :banner => "GROUP[ GROUP...]", :desc => "Exclude gems that are part of the specified named group."
    def viz
      require "bundler/cli/viz"
      Viz.new(options.dup).run
    end
    
So what I need is a similar routine that gets called when the learn option is entered on the command line.  My first several attempts were fairly miserable failures but here's what I ended up with:

    desc "learn [OPTIONS]", "Allows bundler to learn that what to do when a command is broken"
    
    long_desc <<-D
      learn stores your personal approach to getting around gem breakages.
      Example: bundle learn bad="gem install json -v1.8.1" good="gem install json -v1.8.3".
      will prompt you with the correct command when the failure occurs
    D
    method_option "bad", :type => :string, :default => "", :aliases => "-b", :desc => "The bad gem command"
    method_option "good", :type => :string, :default => "", :aliases => "-g", :desc => "The good gem command"

    def learn
      require "bundler/cli/learn"
      raise "Hit learn!!!"
      Learn.new(options.dup).run
    end
    
That require statement means that I needed to create bundler/cli/learn.rb immediately or I'd get a nasty missing file error.  No big deal though.    
    
This can be called with:

     dbundle learn --bad="gem install json -v '1.8.1'" --good="update your ruby"
     
or

     dbundle learn --bad="gem install json -v '1.8.1'" --good="gem install json -v1.8.3"
     
Note: Its called dbundle in this example since I have a local shell alias so my modified bundler will be run instead of bundler itself.

Here's an example of the output:

    dbundle learn --bad="gem install json --version='1.7.3'" --good="update your ruby"
    --- ERROR REPORT TEMPLATE -------------------------------------------------------
    - What did you do?

      I ran the command `/Users/sjohnson/me/fuzzygroup/rails/bundler/exe/bundle learn --bad=gem install json --version='1.7.3' --good=update your ruby`

    - What did you expect to happen?

      I expected Bundler to...

    - What happened instead?

      Instead, what happened was...


    Error details

        RuntimeError: Hit learn!!!
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/cli.rb:426:in `learn'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/vendor/thor/lib/thor/invocation.rb:126:in `invoke_command'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/vendor/thor/lib/thor.rb:359:in `dispatch'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/cli.rb:20:in `dispatch'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/vendor/thor/lib/thor/base.rb:440:in `start'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/cli.rb:11:in `start'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/exe/bundle:32:in `block in <main>'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/lib/bundler/friendly_errors.rb:105:in `with_friendly_errors'
          /Users/sjohnson/me/fuzzygroup/rails/bundler/exe/bundle:24:in `<main>'

    Environment

      Bundler   1.13.3
      Rubygems  2.6.6
      Ruby      2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]
      GEM_HOME  /Users/sjohnson/.rvm/gems/ruby-2.3.1
      GEM_PATH  /Users/sjohnson/.rvm/gems/ruby-2.3.1:/Users/sjohnson/.rvm/gems/ruby-2.3.1@global
      RVM       1.26.1 (latest)
      Git       2.2.1
      Platform  x86_64-darwin-15
      OpenSSL   OpenSSL 1.0.2h  3 May 2016
      rubygems-bundler (1.4.4)

          Bundler settings

      build.nokogiri
        Set for the current user (/Users/sjohnson/.bundle/config): "--use-system-libraries"
      disable_postit
        Set via BUNDLE_DISABLE_POSTIT: "1"
    --- TEMPLATE END ----------------------------------------------------------------

    Unfortunately, an unexpected error occurred, and Bundler cannot continue.

    First, try this link to see if there are any existing issue reports for this error:
    https://github.com/bundler/bundler/search?q=Hit+learn%21%21%21&type=Issues

    If there aren't any reports for this error yet, please create copy and paste the report template above into a new issue. Don't forget to anonymize any private data! The new issue form is located at:
    https://github.com/bundler/bundler/issues/new

# So Now We Need a Method So Bundler Can Learn

If you think about what this needs to do, it looks something like this:

1.  Figure out if what you're telling it to learn is a duplicate or not.
2.  Write a file to some kind of local storage which files away the bad, good and machine details.  

Now that's actually fairly simple.  The hard part is figuring out where that data can live.  I honestly have no idea where that might go given the 

# So How Do You Profit from this?