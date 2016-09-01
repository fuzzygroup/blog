---
layout: post
title: Learning to Extend Betty
category: betty
tags: ["betty", "ruby"]

---
So in my long, long history of using open source, I've never taken the time to formally give back to the community by maintaining anything.  Yes I've blogged.  And I've answered questions and I've damn sure argued for using open source in every job I've had since 1999.  And that is a form of give back but is that really the same?  Recently I saw a Hacker News post on "Projects Looking for Maintainers" and I found something that was personally interesting to me: [Betty](http://github.com/pickhardt/betty.git).  Betty is an NLP interface to your command line and the current author / originator describes it as "Siri for your command line".  That's a really apt description.

So I sent an email to him and he and I have been corresponding ever since and it looks like I'm at least going to be helping out.  My first commitment was to the documentation side and I proposed documenting how to extend Betty with new functionality.  And that's what we're discussing here.

# Extending Betty with a New Fun Command

One of the cool things in here is the fun module which does, well, fun things.  Extending Betty with a new command is pretty much just writing a regular expression wrapper for what you want it match on and then defining its output.  Here's two I just added:

    if command.match(/^superman\s+vs\s+batman$/i)
      responses << {
        say: [true,false].sample ? "Batman" : "Superman"
      }
    end

    if command.match(/^what\s+if\s+batman\s+does\snot\s+have\s+a?n?y?\s*kryptonite$/i)
      responses << {
        say: "Batman always has kryptonite"
      }
    end
    
Astute eyes will recognize the [ternary logic](http://stackoverflow.com/questions/4252936/how-do-i-use-the-conditional-operator-in-ruby) there so Betty doesn't always answer the same way.

# Extending Betty with a new Module -- Git!

In the lib directory create a new file named **git.rb**.  Here's what we're going to drop in there:

    module Git
      def self.interpret(command)
        responses = []
    
        if command.match(/^undo\s+git\s+add$/i)
          responses << {
            :say => "To undo a single file use\n\ngit reset filespec\n\n\nTo undo ALL files added (i.e. you want to undo git add .) then use\n\ngit reset"
          }
        end
    
        responses
      end
  
      def self.help
        commands = []
        commands << {
          :category => "Git",
          :usage => ["undo git add"]
        }
        commands
      end
    end

    $executors << Git

Here's what that actually means:
* an overall module named Git
* a class method named interpret which accepts a command and runs it against a regex which returns a response or responses
* a help method which lets you know how betty can help you with git

And that is, as best as I understand it so far, pretty much the simplest attempt to extend Betty with an entire module.  Now while Betty can actually execute commands for you like: 

    betty how many words are in this directory
    Betty: Running find . -type f -exec wc -w {} \; | awk '{total += $1} END {print total}'
    37386

I don't think that's appropriate for Betty to be making changes to git stuff on your behalf.  So I opted for Betty to just give you feedback.

Adding this module gave Betty this feature:

    betty undo git add
    Betty: To undo a single file use

    git reset filespec


    To undo ALL files added (i.e. you want to undo git add .) then use

    git reset 
    
And this help text:

    betty help git
    Betty: I can do that if you help me. Check out the following examples
    undo git add
    Please note: I am case sensitive. Watch out for my feelings...    
    
    
Yes I know its a simple command line tool.  But I live and breathe in the command line so having this handy sounds great.  And contributing to it sounds even better.