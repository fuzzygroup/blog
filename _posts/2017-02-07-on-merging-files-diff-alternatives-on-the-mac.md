---
layout: post
title: On Merging Files - Diff Alternatives on the Mac
tags: ["software_engineering", "version_control", "merge", "git", "diff"]
category: software_engineering
description: When you really, really break the code base, you need tools to put it back together.  Here I look at diff tools.
image: http://fuzzyblog.io/blog/assets/open_diff.png

---
There are certain skills as a software developer that take, in my experience, a lifetime to master.  I have now been using version control since the mid 1990s and I still don't consider myself, by any means, a master.  I'm good, don't get me wrong, but I don't feel that I have yet fully internalized all the benefits that version control offers.  So, when I have a chance to really take advantage of version control, I truly relish the opportunity.  

I recently had a refactoring situtation where I was, shall we say, overly ambitious.  And, yes, that's the positive version of what I'd refer to as "Humpty Dumpty" code syndrome where you have so thoroughly broken a critical bit of code that you just can't put it back together.  Specifically:

* I refactored a truly alway bit of two critical routines, one with 8 input variables that returned 6 variables
* No test coverage
* It would not, no matter what I did, do what it did before; specifically it would do the first pass of an N pass algorithm but I could never make it go beyond stage 1
* In the process of doing this I added new and highly desirable functionality everywhere and fixed about 30 critical code mistakes along the way

So, well, **crap**.  The fix was, in the immortal words of Doctor Who, to get all timey-whimey!  Specifically I needed to time travel back to *before* I started and then:

* confirm that this code actually worked in the first place -- maybe this problem existed before I *fixed* it
* figure out how to travel back from the past while bringing with me a working version
* NOT lose any of the cool new features

One of the development practices I am absolutely **adamant** about is only ever having 1 checkout of the code based at a time.  I'm hardcore on this because I've seen what happens when you have multiple versions floating about -- its very, very convenient but you tend to get confused and then you lose track of what's the master and things get screwball.  But, in desparate times, you do what you must and so I went over to github and:

* I found a commit from roughly before I started; I wasn't real specific about this, I just remember "this debacle started last Thursday so goto Wednesday"
* I browsed the code base at that point
* I created a new directory where I wanted this
* I checked out the code; that put a fresh copy of master in place
* I did a git co HASH where HASH represented the commit hash for Wednesday

This put me what's called [*detached head*](http://stackoverflow.com/questions/3965676/why-did-my-git-repo-enter-a-detached-head-state) mode and I was able to modify /run / test, etc.  I then had to: 

* port over my rake task which was doing my tests
* port over the individual changes, one by one, *carefully* to let the old code run correctly

What I found was that the old code did, in fact, run better than the new code.  Sigh.  And after 2 days of fixing things all over the place I had the system back to running order with the exception that I now had 2 code bases that needed to be merged.  *Bigger Sigh*.

# Time for some Diff Magic

So I now had two git checkouts with differences between them.  One of them was master, and did I mention that while this was all going on I got pulled off the project to fix something else and add yet more functionality to the code base for a day and half, and the other was my time travel branch.  When I did a git status in the time travel branch I got this:

```bash
    git status
    HEAD detached at 93bf221
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

    	modified:   app/models/form.rb
    	modified:   app/models/form2016_q4.rb
    	modified:   app/models/iframe2016_q4.rb
    	modified:   app/models/link.rb
    	modified:   app/models/link2016_q4.rb
    	modified:   app/models/page.rb
    	modified:   app/models/page2016_q4.rb
    	modified:   app/models/page_body.rb
    	modified:   app/models/page_body2016_q4.rb
    	modified:   app/models/site.rb
    	modified:   app/models/unique_url.rb
    	modified:   app/models/unique_url2016_q4.rb
    	modified:   app/models/url_resolver.rb
    	modified:   app/models/url_tool.rb
    	modified:   config/initializers/constants.rb
    	modified:   lib/common_link.rb
    	modified:   lib/common_page.rb

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

    	docs/snippets/create_mechanize_page_without_fetch.rb
    	lib/tasks/crawl2016_q4.rake

    no changes added to commit (use "git add" and/or "git commit -a")
```
    
That's a whole lot of changes.  The easiest approach was to start with the entirely new files and just copy them over to the original.  

Now this is where I'm going to make a highly personal engineering choice here -- I'm going to avoid an automated merge process of any type.  When it comes to complex code changes in an automated fashion I honestly don't have a lot of faith.  I've seen automated merges go wrong time after time so I was looking for a tool to make this easier.  A quick bit of googling turned up:

* OpenDiff / FileMerge (part of X-Code)
* [meld](http://meldmerge.org/) - a python tool with an unofficial brew install via *brew install homebrew/gui/meld*
* [Beyond Compare]http://www.scootersoftware.com/download.php from [Scooter Software](http://www.scootersoftware.com/)
* [Diff Merge](http://www.sourcegear.com/diffmerge/) from [SourceGear](http://www.sourcegear.com/)
* [Kaleidoscope](http://www.kaleidoscopeapp.com/)

I ended up using Open Diff for my merge issues:

![opendiff](/blog/assets/open_diff.png)

Here are screenshots from some of the other tools I looked at:

## Diff Merge

![diff_merge](/blog/assets/diff_merge.png)

## Beyond Compare

![beyond_compare](/blog/assets/beyond_compare.png)

## Kaleidoscope

![kaleidoscope](/blog/assets/kaleidoscope.png)


## More Reading

Here are a few good articles on merge tools:

* [GitTower](https://www.git-tower.com/blog/diff-tools-mac)
* [outcoldman](https://www.outcoldman.com/en/archive/2014/05/12/git-dirdiff/)
