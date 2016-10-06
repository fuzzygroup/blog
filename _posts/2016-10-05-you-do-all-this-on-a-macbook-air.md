---
layout: post
title: You Do All This On A MacBook Air???
category: macbook
tags: ["macbook", "osx", "aws"]
---
I had an interesting pair programming session with [someone](http://nickjanetakis.com/blog/) today.  The situation was a complex debugging problem and I needed a second, experienced brain to walk the decision tree of issues with me.  He made an interesting comment when he first saw my screen:  ***You do all this on a MacBook Air?***

Yep.  My primary compute resources for local work are: 

* MacBook Air (13-inch, Early 2014), 1.7 GHz Intel Core i7, 8 GB 1600 MHz DDR3, 500 gigs flash storage
* MacBook Pro (Retina, Mid 2012), 2.6 GHz Intel Core i7, 16 GB 1600 MHz DDR3, 750 gigs flash storage

Of the two I tend to use the MacBook Air more these days and here's what I do with it constantly (as in all this stuff is usually running at the same time):

* Browser (I usually run 2 or 3 different browsers constantly)
* TextMate 2
* TextMate 1
* Numbers
* Keynote from time to time
* TweetBot 
* Full stack development on multiple code bases
* MySQL driving the full stack development
* Redis driving the full stack development
* Virtual Box / Vagrant
* DropBox 
* Skype
* Slack
* Mail
* Alfred
* Virtual Desktop Support
* iTerm - an embarrassingly large number of terminal sessions at any given time:

    ps auwwx | grep bash | wc -l
    71

And I pull all this off with a lowly little 8 gb MacBook Air that is so ancient it doesn't even have native HDMI out -- I have to use a dongle to get HDMI -- terribly embarrassing when you present at a [Meetup like last night](https://fuzzygroup.github.io/blog/ansible/2016/10/04/ansible-basics-presentation-at-indy-elixir-meetup.html). *Chuckle*

# Why Not A More Recent Machine?

The saddest thing to me in modern computing is that Apple no longer sells any kind of box that I actually want.  Moving to a new box for a developer is, let's be honest, a huge pain in the ass.  I'll easily spend 2 weeks being out of sync on libraries, dev tools, etc.  So for me to move to a new box is a big deal and I don't do it lightly.  Now, when I look at the laptops that Apple is selling, nothing is all that much better than what I bought in 2012.  Sure the CPU is a bit better and the graphics card, maybe, but I'm a developer -- I don't care about the graphics card.  What I care about is the RAM and the storage.  And going from 16 gigs of RAM to 16 gigs of RAM -- that's not actually an improvement; it is the same.  And, yes, I can go from 750 gigs of SSD to 1 tb of SSD but so what?  Again that's not a significant improvement for **4 YEARS OF CHANGE**!

The second saddest part of this is that component prices of all kinds continue to fall.  Want to guess what 64 gigs of RAM costs outside of the Mac Ecosystem -- about $200.  I bought it a month ago.  Apple charges $1,300 to upgrade a Mac Pro from its 12 gb base to 64 gigs.  I know that there's an Apple tax and I've been happily paying it for years but that's just plain too much.  

If you're heavily entrenched in the Mac world and you're curious about what life outside looks like, I'd recommend you read the tale of the [Scooter Computer](https://blog.codinghorror.com/the-scooter-computer/).

**Note:** I don't fully agree with Jeff in his opinions on AWS and the cost of computing versus what he can spend on the Scooter box.  And I think he misses the [fundamental industry shift that AWS](https://fuzzygroup.github.io/blog/aws/2016/09/06/aws-i-was-wrong-dead-wrong.html) enables but his expertise in hardware is something I've been following now for literally years.  Honestly you're not buying into AWS for the hardware they give you, you're buying into it for their wonderfully powerful APIs.  The hardware is just a delivery vehicle for the APIs.

# Tips and Tricks for Pulling Off This Kind of Load on a Tiny Box

So if Apple doesn't sell anything I want anymore and hasn't for years, what's a nerd to do?

## Hackintosh

My long term plan is to build a [Hackintosh](https://medium.com/swlh/building-my-1-200-hackintosh-49a1a186241e#.w6qefd78d) but I've been so busy that its been a pile of parts for over a month now.  Sigh.  I know all the issues but I just need a fast as crap box with a ton of memory and I could buy everything for less than Apple would charge me for memory.  How could I not try it.

## Activity Monitor

I run Activity Monitor all day long and I always have either the CPU tab or Memory tab open.  If something goes south (and it is usually Safari) then I kill it aggressively.  That keeps things healthy.  Safari, Slack and Skype are probably the three things I have to kill regularly to free up resources so the machine can breath.  Since Slack and Skype are also mirrored on my phone, iPad and other laptop, well, its not a big deal.

## ASCII Is My Native Format

I'm a software engineer so mostly what I work with is nothing more than ASCII.  ASCII files by today's standards are teeny, tiny and don't generally get corrupted.  That's a huge win.  And ever since I moved to Jekyll for blogging, all of my writing output is stored in markdown files on the file system.  That's awesome.  I have every essay I've written since 2002 in one easy place for grepping over.

## Dropbox

The hidden magic here is Dropbox.  Ever since [Dv](http://dasari.me) talked me into using DropBox to replicate my working data set between my machines and showed me how wonderful an experience that is, I'm just plain happy.  Something goes wrong with box1?  Well I've got box2 right next to me.  The only issue is if you try and modify the same code base on two machines at roughly the same time and that's unlikely since I use my Machines for mostly separate purposes.
