---
layout: post
title: Why I Haven't Switched Away from OSX
category: osx
tags: ["osx", "linux"]
description: When you have stability problems with software, the logical decision is to switch -- or is it?  Here I talk about OSX stability issues and why six months after I started trying to switch, I'm still using OSX.
---
I'm writing this at 4:12 am sitting next to a machine with 11:50 hours of uptime.  The machine I'm using is an old OSX Macbook Air running OSX El Capitan 10.11.6 and the machine with less than 12 hours of uptime is running Sierra 10.12.5 and is a new (6 months old) Macbook Pro 13, the last one of the old generation before Apple foolishly messed around with the keyboard travel and layout on the new generation.  Yesterday my wife was driving and I was in the car drafting blog entries for a new, very focused blog I want to launch.  We were on flat dead empty and she stopped at a gas station so I got out to pump the fuel.  I came back to that worst of all experiences -- my laptop had rebooted spontaneously and was sitting at the login prompt.  *Groan*.  Even worse there was no system report this time so I don't even know what pathetic excuse for a piece of software screwed up (again).  So I'm just left wondering.  But since this happens so frequently, I found a [crash report from about a week ago](https://gist.github.com/fuzzygroup/a4589f50665fd62f9ded74d54cd77e74) when my box had an uptime of 94000 seconds (yes that's just one day).

My old friend [Gene Callahan](https://gene-callahan.blogspot.com/), the man who two decades ago taught me Awk and pattern matching, skills that have subsequently defined much of my technical career, asked me recently why don't I switch to something stable and answering that is a challenge but I think I'm finally ready to address that.  Here's the tldr with a deep discussion on each below.

* Lack of Faith in the Alternatives
* Textmate, Textmate, Textmate
* iTerm2
* My Phone
* My Pictures / My Data
* Time Machine
* Apple Hardware is Simply Beautiful

Gene was asking me this, I suspect, because I wrote [a series of Postmac](http://fuzzyblog.io/blog/tag.html#postmac) blog posts at the end of 2016 into 2017 and then I simply stopped.  I was [very serious](http://fuzzyblog.io/blog/postmac/2016/11/05/life-in-a-postmac-world.html) about this initially and then I went dark on the topic and this digs into that.

# Disclaimer: I'm a Power User

It should be noted that I'm a power user and a software developer.  I mostly use a terminal and an editor.  My recent list of "5 Apps I use Everyday" on [Hacker News](iTerm, TextMate, Enpass, Ruby, Git) was iTerm, TextMate, Enpass, Ruby, Git -- just one of those was a GUI app (a password manager).  What I develop are mostly Rails apps with a smattering of straight ruby and, lately, some JavaScript / Node for a [course I'm teaching / mentoring](http://fuzzyblog.io/blog/how_to_be_a_developer/2017/07/02/how-to-be-a-developer-001.html).

Now the way I develop Rails apps is optimized for developer productivity so I start every project by opening a succession of terminal windows:

* Web Server Tail
* Database window
* Rails Console
* Command Line
* Remote Command Line

By keeping all the resources for whatever I need to do always active, I minimize cognitive overhead due to switching time / "ok do I want to drop out of console to check the log file; is that worth it?".  

I have the definition of these set in a [Tmuxinator](https://github.com/tmuxinator/tmuxinator) profile so when I want to work on project xyz, I just tell the command line "tmuxinator seira_watch_web_app" and all the terminals for that project spring into existence (and it is wonderful to not have to think about 'ok what port do I need the web server on').  Right now I have 97 profiles setup for Tmuxinator.

You're probably thinking well -- 5 terminal windows, how is that a power user?  *Chuckle*, you should know play the opening bars of *[welcome to the jungle](https://www.youtube.com/watch?v=o1tj2zJ2Wvg)* in your head.  I've made the technical focus for 2017 learning how to do Rails development in a distributed, **non monolithic** fashion so that means your traditional Rails monolith has now been decomposed into N separate Rails projects with formal APIs between them and that you generally need all parts live concurrently.  In my case that generally amounts to 8 separate projects, each with at least 5 terminal windows so my 5 terminal windows is now 5 * 8 or 40 plus terminal windows just to work on one side project -- and that doesn't include consulting work, side, side projects, etc.  Generally speaking I run about 100 to 200 separate bash sessions.  The reason why I know about things like [pkill](http://fuzzyblog.io/blog/unix/2016/11/23/pkill-rocks.html) is from trying to tease out just one terminal session from the sea of them that I normally am swamped by.

Now I'm sure that 100 terminal sessions sounds like absolute madness but it actually isn't all bad.  The terminal ITerm2 is actually pretty damn good and I manage it through a combination of tooling ([Tmux](https://github.com/tmux/tmux/wiki) / Tmuxinator) and convention (terminal 2 is my core software development window; terminal 3 is blogging and so on).

So if you add 100 plus terminal windows to a browser or three each running say 50 plus tabs, I have very, very serious memory needs.  Apple's persistent inability / lack of desire to ship a laptop with more than 16 gigs of RAM is something I find absolutely maddening.

But for all of my bitching about stability and investigating alternatives, 8 months since I first wrote about "postmac", I'm still here using OSX every single day so what went wrong?

# Lack of Faith / Everything Crashes

I'm now 49 years old and I have an appalling lack of faith in software quality -- or as I like to describe it "everything crashes".  This past November I bought an Intel NUC for the purposes of just running Ubuntu and experimenting with desktop linux to see if it was an alternative.  I went with Ubuntu 16 and used Ubuntu Mate as the closest linux experience to OSX that I could find (and yes I flirted heavily with [Elementary](http://www.hongkiat.com/blog/elementary-os-luna/) but it wasn't stable).  And you know what I found out, while Ubuntu didn't crash as hard as OSX, I still lost the networking stack about every week.  And a machine without networking, well in 2016 / 2017, that's not much of a computer.  And the only way I ever found to get this fixed was a full system restart.  Now I'm sure that if I had dug into it enough, I could have found a way to restart the network stack but I never found it.  Oh and this was an Intel NUC with twice the ram of my OSX that I was using under far less demanding circumstances.

Honestly the experience of trying to switch off OSX onto Ubuntu and finding that Ubuntu wasn't stable, at least when used in a GUI context, was absolutely disheartening, so much so that that box sites on my desk and every time my eye falls on it, I get more than a little sad.  I run ubuntu linux boxes 24x7x365 with well over a *full year* of uptime so the network stack on my personal Ubuntu box failing after less than a week (and failing consistently) puzzles me.  My suspicion is that this somehow related to a full GUI running on top of Ubuntu itself.

So, honestly, everything crashes and if you're going to run a full computing stack, with a GUI, browser and everything else, I no longer think that there is such a thing as stability -- at least not if you're a power user like myself and really pushing the limits of the machine.  And yes that's a crap ass attitude but it is what a lifetime of being a power user has reduced me to; sigh.

# If Everything Crashes then Resume Quality is Key

So if you assume that everything crashes then the quality of resume is key.  And this is something where I found a dramatic difference between Ubuntu and OSX.  Sure Ubuntu didn't hard crash but if I have to restart the machine to get networking running again, well, it might as well have.  While I remain pissed that my machine crashes regularly (I'm averaging about once per week now), I will state that Apple / the application vendors have finally managed to make this suck less.  Specifically:

* iTerm2 remembers every window and tab's position so all I have to do is relaunch Tmuxinator with a profile; since tab names are persistent (I'm glaring at you Apple Terminal), the name tells me what profile to launch
* My editor, covered next, restores bloody everything
* Apple generally relaunches every application I had going

So while its not perfect, resume quality is far, far better than I have ever had it before.  Even the core browsers I rely on, Chrome, Firefox and Safari actually get window / tab restoration mostly correct.

# Textmate, Textmate, Textmate

The very first editor I used once I switched fulltime to OSX from Windows / Linux (both on ThinkPad hardware) back in 2006 was [TextMate](https://macromates.com/) and I'm still using it.  I've written hundreds of thousands of lines of code in it and while the world has mostly moved on, I still find it to be the single best editor I've ever used.  Sure its old and a wee bit clunky but it: 

* Has restore implemented perfectly (even "unsaved" files are restored after a crash allowing you to treat it as a virtual scratch pad; once you drop things into a new window they never go away unless you choose kill them)
* Has extensions specific to Ruby / Rails
* Has extensions for almost anything
* Fast enough
* Great syntax highlighting
* Macro facility

I used to laugh at engineers who were so closely tied to a particular editor and think "I'll never be that"; karma is a bitch. But, seriously, an editor is what I spend maybe 90% + of my time in so having one that I love really matters and that is actually a switching cost.  

When I attempted to using Ubuntu on the NUC, I used [Sublime](https://www.sublimetext.com/), [Atom](http://www.atom.io) and [Visual Studio Code](https://code.visualstudio.com/).  Sublime never felt right and I just can't get past the performance / memory bloat of anything written using Electron (as beautiful as VS Code is). I should note that Visual Studio Code is actually awesome and Microsoft has done amazing work on it.

But I still love my TextMate.

# iTerm2

While iTerm2 takes some crap for not always fixing bugs, being sometimes [slow](https://danluu.com/term-latency/) and a few other failings, I personally find it awesome.  Once again the ability to resume after a crash looms large.  Oddly if I choose to install updates, it can't resume anything so I rarely choose to update it.  Similarly its resumption doesn't work if you exit so if I have to shut it down, well, I use Activity Monitor to kill it and then it brings back all my terminals perfectly.  I wish I could accept the updates but, honestly, decent resume is so wonderful that I can live without them.

iTerm2 has Tmux integration and decent multi pane support that could theoretically save me from having to be so reliant on Tmuxinator but I've explored it being really happy with Tmux / Tmuxinator.

# My iPhone / Phone Integration

This one is an absolute killer.  I'm an iPhone user and the integration that Apple has put together is fairly compelling.  Specifically if my wife or kids text me, I can just reply using my laptop and not have to struggle with my fat fingers on a small phone screen.  That one feature is huge for me and after WhatsApp has completely stopped working for me since early 2017, I'm back to using SMS for texting with my family so this is huge.  I used to get around this with a dedicated WhatsApp app on OSX (which I think exist on other platforms).  Given that mobile isn't going to any less important, integration is key and I find it hard to believe that I could ever have a better experience with an iPhone on non Apple hardware.

# My Pictures / My Data 

Moving between systems is always a lossy operation -- you're going to lose something whether it is a much loved app or data that doesn't convert correctly or something else.  Given that I have a decade plus worth of files on OSX, I'm going to lose stuff when I move and just the prospect of that is daunting.

# One Device

I used to have a work laptop for coding and then a personal computer for "my data".  Ever since I switched to OSX, I've had only one device to worry about and that's pretty damn wonderful.  Given that I use an iPhone, if I was to switch away from OSX for my daily coding, I'm likely still going to have OSX in life and that ruins the one device strategy.

# Time Machine

If you weren't a hardcore Mac person when Time Machine shipped you likely don't remember how rarely, if ever, most of us backed up.  I keep one machine constantly backed up with Time Machine and I actually trust it.  I've had only one back up issue with Time Machine since I started using it and that includes reformatting a machine that had every family photo on it ever and Time Machine brought back every drop of data.  Sure there are other backup solutions on other platforms but I **know** that Time Machine works and that level of trust is pretty important.

# Apple Hardware is Simply Beautiful and Lasts

If you're a PC guy then you may not understand the hardware quality of an Apple box.  While I have lots and lots of issues with Apple at times, I have to admit that their hardware is simply **beautiful** -- and it **lasts**.  My first 15" Macbook pro, that old 2010 model, it still runs daily as the family Plex server hooked up to like 9 gigs of storage and runs pretty much like a champ.  My 2012 Macbook Pro?  Its still around and working perfectly.  So while the software has issues, the physical hardware is beautiful and durable.  If you're going to use something on a daily basis then it being beautiful isn't a bad thing -- I spent a lot of years using Dell and Toshiba hardware and the build quality just sucked.  I used to know that when I heard rattling in my Toshiba's it meant that a screw had come out (again) and that the machine would die shortly thereafter.  Overall the hardware side of my Macs haven't let me down.

# Closing Thoughts on Software Quality

I should note that software quality problems are rampant in the industry.  Just as an example, if I prematurely abort a test run on RSpec with ctrl+c, well, I lose the cursor in the terminal -- and there is nothing I can do to get it back, not clear, not ctrl+k, etc.  I just have to shut down that terminal session.  So it isn't just OSX or the GUI on Ubuntu, it is everywhere and it is a damn pity.