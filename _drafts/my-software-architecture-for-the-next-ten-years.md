---
layout: post
title: My Software Architecture For the Next Ten Years
category: software_engineering
tags: ["software_engineering", "elixir", "ruby", "rails"]
---
I've been writing code using Ruby since 2006 and using Rails since 2007.  I've generated a lot of different apps and the biggest really looks like this:

    +----------------------+-------+-------+---------+---------+-----+-------+
    | Name                 | Lines |   LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Controllers          | 36374 | 23903 |     147 |    1290 |   8 |    16 |
    | Helpers              |  6596 |  5116 |       1 |     386 | 386 |    11 |
    | Models               | 153021 | 81609 |    1444 |    9722 |   6 |     6 |
    | Libraries            | 59985 | 36510 |     195 |    1573 |   8 |    21 |
    | Controller specs     | 18835 | 11213 |       0 |       0 |   0 |     0 |
    | Feature specs        |  4238 |   531 |       0 |       0 |   0 |     0 |
    | Helper specs         |  2366 |  1388 |       0 |       0 |   0 |     0 |
    | Lib specs            |  4124 |  2940 |       0 |       0 |   0 |     0 |
    | Model specs          | 53934 | 37612 |       0 |       3 |   0 | 12535 |
    | View specs           |   533 |   311 |       0 |       0 |   0 |     0 |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Total                | 340006 | 201133 |    1787 |   12974 |   7 |    13 |
    +----------------------+-------+-------+---------+---------+-----+-------+
      Code LOC: 147138     Test LOC: 53995     Code to Test Ratio: 1:0.4

I'm in the process of a massive refactoring and its time to figure out what actually matters to me.  And from doing this I hope to derive the attributes of my software architecture for the next ten years. 

# Reliability

First and foremost I'm looking for reliability.  I'm so damn tired of crap that doesn't work.  It seems like every single week if not every day I'm dealing with some kind of Ruby issue.  Now some of this is cruft accretion due to age -- as you can see above I work on some big crap but, still, I'm tired of it.  I want things that work and stay working.  

# Documentation over Test Coverage

I'm not opposed to test coverage by any means.  I'm a fan of testing particularly testing as a design tool when you're figuring out how things need to work.  Now, that said, I'm unconvinced that comprehensive testing, particularly in the upcoming world of functional programming, is the path forward.  I've probably written over a hundred thousand lines of test code in the past ten years across test unit, rspec and minitest and TDD is not the panacea that we all thought it was.  Large test suites, as useful as they are, become their own set of issues.

So while test coverage isn't going away for me, the idea of 100% test coverage is.  

Note: While the application above doesn't have 100% test coverage, I have written rails code bases which were at the 93 to 95 % level of test coverage.  Very useful but keeping the coverage running was hard.  And running the full test suite was about a 20 minute wait.

# No Monoliths

I might restate that a little more forcefully as ***No More Mother Fucking Monoliths***; apologies to Samuel L. Jackson and my children who may someday read this but I do feel that strongly on this point.  The codebase metrics shown above come from what I think of in my own head as **my basecamp**.  That reference will likely make sense to you if you're in the Rails community and not at all otherwise (so ignore it).   And, yes, it is a monolith.  And, you know what, ***monoliths suck green monkey chunks***.  

I no longer care what [DHH](https://twitter.com/dhh/status/695272044024487936) says - the monolith design pattern is an abomination at best.  I'm running a far smaller team than 37 Signals and the monolith pattern is one of the reasons we're stuck.  Among the many benefits of NOT using a monolith are:

* separation of concerns
* ability to scale the components of your application that are performance challenged
* speed of the overall tool chain; that big app above?  It takes over a minute to load the rails console every single time since there are almost 1,500 models that have to be parsed and loaded into memory 
* ability to farm a component out to 3rd party contractor and have them able to understand it instead of "oh crap where do I start"
* faster learning curve for new hires
* ability to selectively address performance by rewriting components in a new language 
* you might end up with a gem stack that isn't a disaster waiting to happen

# Fast, Efficient, Compiled

I shudder to think of the amount of money I've spent unnecessarily paying for compute cycles due to the slowness that is Rails.  And while Chris McCord and others on the Phoenix team take the perspective that performance isn't all that Phoenix is about, honestly, it is enough for me.  At this point, while I admire the intellectual purity of functional languages, if functional is what it takes to get performance, I'm there.  

# AWS

Anything I build moving forward will be built using AWS as the data center platform.  Intellectually I agree with Jeff in terms of raw performance and I admire the [Scooter Computer](https://blog.codinghorror.com/the-scooter-computer/) greatly but what AWS brings to the table isn't raw performance -- it is **everything**.  The experience of moving from a production system to a full blown staging environment in about 15 minutes absolutely blew my mind.  And, from that point forward, I've never consider another environment.  AWS now offers just about any server side technology that you can imagine and that's too powerful to ignore.

# Conclusions

So here's what I'm looking toward as a platform:

* Ruby / Rails as a prototyping tool 
* Elixir as the overall reliability engine and the ultimate goal as things can be rewritten
* Write rails apps differently by separating them into as small things as possible
* Deploy the rails bits to individual AWS resources so they can be scaled well
