---
layout: post
title: Software Has Rework Too -- Reworking a Rails App
date: 2022-07-02 05:36 -0400
category: rails
tags: ["rails", "software_engineering"]
---
{:.center}
![fire_dance.jpg](/blog/assets/fire_dance.jpg)

{:.center}
Read On - Yes there's a reason this picture is here ...

<p class="text-center">A loving tribute to [Oxide and Friends](https://feeds.transistor.fm/oxide-and-friends); Here there be dark corners of podcast specific in jokes ...</p>

It is **delightfully fun** to actually learn something new.  And it is even more fun to translate something from a different knowledge domain, say **hardware**, into a domain you understand, say **software**.  I've been listening to the Oxide and Friends podcast recently and they taught me the concept of *Rework* in a hardware assembly context.  What rework means is sometimes things go wrong and you need to "re-work" it.  For example you might fumble the wiring on a component and then need to get out the 30 gauge wire, a microscope and a soldering iron and do what is normally a machine's job it by hand.

Tonight I found myself in a bind and my solution was: 

> Reworking a Rails App

## Let me Dive In 

I do my software engineering primarily in a Rails context.  I know the Oxide folks view Rails and Ruby largely as the [devil's own web development tool](https://share.transistor.fm/s/f06dd3dd) -- and they're 1,000% wrong -- but that's neither here nor there.  Rails and Ruby are my jam.  

I recently started a new project as an exercise to see what Rails 7 could really bring to the table if I tossed out some of my slower moving development practices.  I made the decision to pair Rails 7 with an application template library and that's where the things started to go awry.  I made the decision to enable Stripe in my application template library and then this particular dark hell began.  Here's my (unanswered) message from the support forum:

    Anyone know how to get this thing to STOP calling stripe? 
    I can't get into the configuration UI because "Error while 
    authenticating with Stripe" (its an API key invalid error that 
    I can't seem to fix on the Stripe end).  And then it would toss 
    an error and shut down the application itself.

So I had a web app that I couldn't run in a web server.  Face Palm.  Head Desk.  And, at this point, Bryan and Adam from Oxide are literally laughing at me.  Bite me - guys - let's talk about moment arms ...

After a few days of sitting on this issue (I have many, many things to work on) and getting no response, I pulled up the Rails Stats for the project:

    be rails stats
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Controllers          |   2120 |   1404 |      54 |     197 |   3 |     5 |
    | Helpers              |    318 |    248 |       0 |      31 |   0 |     6 |
    | Jobs                 |      7 |      2 |       1 |       0 |   0 |     0 |
    | Models               |   1316 |    616 |      16 |      74 |   4 |     6 |
    | Mailers              |     25 |     17 |       2 |       1 |   0 |    15 |
    | Channels             |     52 |     37 |       3 |       5 |   1 |     5 |
    | Views                |   3830 |   3284 |       0 |       0 |   0 |     0 |
    | Stylesheets          |   2708 |   2283 |       0 |       0 |   0 |     0 |
    | JavaScript           |   1250 |    875 |       0 |       4 |   0 |   216 |
    | Libraries            |   5388 |   3878 |      31 |     114 |   3 |    32 |
    | Controller tests     |    380 |    306 |      13 |      42 |   3 |     5 |
    | Helper tests         |    104 |     83 |       2 |      15 |   7 |     3 |
    | Model tests          |    652 |    292 |      13 |      51 |   3 |     3 |
    | Mailer tests         |     21 |     18 |       2 |       2 |   1 |     7 |
    | Integration tests    |    596 |    494 |      20 |      54 |   2 |     7 |
    | System tests         |    391 |    290 |       5 |      27 |   5 |     8 |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Total                |  19158 |  14127 |     162 |     617 |   3 |    20 |
    +----------------------+--------+--------+---------+---------+-----+-------+
      Code LOC: 12644     Test LOC: 1483     Code to Test Ratio: 1:0.1

I did not write 12K lines of code.  All of this was the result of underlying generators.  Basically all I had done was:

1. Scaffold up controllers with data descriptions
2. Write / edit the migrations
3. Install some components
3. Write some model level magic
4. Glue it together with some ooey, gooey rake goodness (I love Rake; I miss [Jim Weirich](https://en.wikipedia.org/wiki/Jim_Weirich))

And, technically I had caused this problem -- I had enabled the **[ ] Stripe check box** in the admin UI on the application library.  The fact that I didn't know *I APPARENTLY HAD TO, RIGHT THE HELL NOW*, add stripe credentials or my world would end was **NOT** clear to me.  And please don't tell me "Just go create stripe credentials" -- I did.  They didn't work.  I don't know why.  I don't care.

Apparently I now had:

> Software Rework

waiting for me.  Damn you Oxide!

## Blogging Helps Engineering

I recently posted a tweet:

Name four things that made you a better engineer and who taught you them.  Me? 1 - Blogging (@davewiner) . 2. Ruby (@wolframarnold). 3. Unit Tests (@wolframarnold). 4. Pair Programming (@wolframarnold).

My #1 thing that helped me be a better engineer was blogging.  Why?  Blogging made writing easier and engineering is a **communications process**.  I may be communicating with a technology but I am **communicating**.  Blogging freed me from what Ted Nelson used to call *The Tyranny of the File* - I don't write files - I tell my blogging tool of choice "give me new post" and then I just open it and go.  The fact that I don't have to worry about naming it, placing it on a file system or uploading it to the web means that I can just focus on my communications.  I didn't used to think that naming files was such a big deal but consider this:

    ❯ ls -ltr _posts | wc -l 
        1078

So my blogging tool has 1,078 finished posts (there are 492 drafts also; sigh).  That's 1,500 file naming decisions I would have had to make.  Oy Vey.

But, you ask, why am I talking about this when I'm discussing rework.  What I have learned over my career is that if I do something new, I'm almost certainly going to have to do it again sometime.  And the best way to make a repeatable process -- **write it down**.  And that's why I have insanely specific blog posts like the one about: "Fixing FactoryBot Validation Name Has Already Been Taken Controller Test or Spec Errors" -- I know that someday whatever was at the heart of that particular disaster will come back and hit me with a hammer.  This way I'm at least part of the way there to solving it.

There is a particular N step process to using the application template I chose and, thankfully, I wrote them all down.  So now I could just: 

1. Trot out that hellish set of steps
2. Find a goat
3. Light a fire
4. Dance in the light of the fire 
5. Cast some frothy good rework magic
6. Begin again

## Reworking a Rails App

Here was the process:

1. My original application was in /Users/sjohnson/Sync/coding/rails/readwithscott
2. I ran back through my application library generator and it put a new template application into my github.
3. I cloned that down to my machine into /Users/sjohnson/Sync/coding/rails/readwithscott2
4. I ran through the setup steps for anything build with that application template.  These are currently on my phone and haven't made the blog yet.
5. I then had passing tests.

Now I had to integrate two code bases.  One of the magic powers of Rails is that every Rails app is pretty much the same.  So once you learn how to work on one Rails app, you can literally work on any Rails app because all of the setup decisions in terms of file locations have been made for you.  All I needed to do was move over the work I had done.  And this could really be done in terms of re-using the generators in the new application and then moving some files over from the old application.

### Generators

All I needed to do was:

    bundle exec rails g scaffold Book
    bundle exec rails g scaffold Bibliography

And this created a ton of files and directories.  

All the next steps assume that you are located in the readwithscott2 directory,

## Gemfile

For a Rails app, Gemfile is the canonical source of truth for components so:

    cp ../readwithscott/Gemfile . 

## Migrations

    cp ../readwithscott/db/migrations/* db/migrate

## Models

    cp ../readwithscott/app/models/book.rb app/models
    cp ../readwithscott/app/models/bibliography.rb app/models

## Docs

I always create a top level project root called docs for every single project ever.

    mkdir docs
    cp ../readwithscott/docs/* docs

## Rake Tasks

    cp ../readwithscott/lib/tasks/*.rake lib/tasks

## Bundle Install

Bundle install adds the components from the Gemfile into the application and creates the Gemfile.lock file which really matters:

    bundle install

## Db Migrations

Executing the migrations creates the db schema and this was the first bit of madness:

    bundle exec rake db:migrate

And then I got nattered at about a table already existing which made no sense to my addled, sleep deprived mind but I realized that by running the generators twice, I had now two sets of time stamped migrations in my db/migrate directory:

    20220625084356_create_books.rb
    20220628085120_create_books.rb

Easy fix -- just delete the newer migration and then re-migrate:

    bundle exec rake db:migrate

## Run the Rake Task

A Rake task in Rails runs scripting independent of your core data models.  Think of it as glue / integration code and I had two rake tasks which would seed the data into the system.  A quick run and I had created 206 records based on parsing a markdown file.

## And Now I can Finally See It!

Keep in mind that I had never actually seen this application as once I set it up, I then terminated my server side process and simply worked in the repl and / or the model / rake tasks.  Seeing things makes a fundamental difference so I fired up:

    bin/dev

And, voila!  My application displayed itself in all its (non-resplendent) glory!

## And Now Problems Emerge!

My first thing to try was to go use the application in a browser and create a new object (book).  This gave me a form page which had no fields -- and this baffled me.  My initial thought was to put it aside and add some code to the controller to handle [idempotent object saving](https://fuzzyblog.io/blog/rails/2022/06/10/thinking-about-rails-database-objects-and-idempotency.html).  I've been playing with this lately and had a nice insight.  So I happily ignored the problem and wrote more code.  Sigh.

And then I stopped -- and I thought.  Thinking about hard things is always good.  The application template I'm using, as long as you scaffold the application up with the fields, it generates form fields.  It is true that you don't get form fields that you add later to the database via a secondary migration but the core fields for me (title, author) should be there -- and they weren't.

And then it struck me -- I had scaffolded this correctly when I initially created the objects but incorrectly when I generated in the rework.  Here are the two approaches:

Correct:

    rails g scaffold Bibliography active:boolean title:string user:references

Incorrect:

    rails g scaffold Bibliography

I had been lazy the second time and that was now going to cost me.  My first thought was to copy over the files from my original work but now I had changes that needed to be merged.  

I decided to create a save subdirectory under controllers and putting the modified controller into it.  This would let me copy and paste my changes back.  I did that, made a few other changes and all was frothy and good.

## Conclusion

This is actually not the first time I have done **rework** on a Rails app.  My problems with the [intersections of FactoryBot and RodAuth and the underlying insane meta programming that is buried in RodAuth Rails](https://fuzzyblog.io/blog/2022/06/10/fixing-factorybot-validation-name-has-already-been-taken-controller-test-or-spec-errors.html) led me to rework -- I just lacked the phrase.  At least this time I have a **noun** to recognize what I'm doing.  Thanks Oxide!

And just as a disclaimer, I don't think that this is inherently a Rails problem -- despite it happening to me twice in a Rails context in rapid succession -- I'm very deliberately experimenting with new technologies where I don't fully understand the limits.  And that can sometimes bite you -- or result in 10 page, Yegge like essays that amount to:

> Rework.  Not just for hardware.

;-)
