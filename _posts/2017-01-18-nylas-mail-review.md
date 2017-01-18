---
layout: post
title: Nylas Mail Review
category: email
tags: ["email", "nylas", "slack"]
description: Nylas N1 is a new email client that has just been released as free and open source.  And, as a piece of software, it is also actually good.
image: http://fuzzyblog.io/blog/assets/nylas.png
---
Nylas N1 is a new email client that has just been released as free and open source.  And, as a piece of software, it is also actually **good**.  Among people that know me in the real world, I am notorious for handling personal email poorly if at all and I actually used it for quite a while last night.  Now that's a great sign for a new app.

![nylas.png](/blog/assets/nylas.png)

# Overall

I actually **really like** this application and I'm intending to use it to see if perhaps, in 2017, I can put on my big boy pants and deal with email as a professional (i.e. daily). The fact that it works for OSX, Windows and Linux is a huge, huge win.  The UI is impressively good and they've open sourced it which means that it has potential to get better -- fast.  

**Note**: I just tried to install it under Linux and its apparently not fully read yet.  Alas, sigh.

There is some impressively good thinking here 

Now, that said, I'm still impressed.  I'll be even more impressed when I can run it on my wide screen Linux desktop with 32 gigs of memory.

Kudos to the good folks at Nylas and ***Thank You*** -- you just made not only the personal computing world a little bit richer but also the open source world.  

# The Bad - Memory Usage

Nylas is an Electron app and that means that memory consumption is going to be an issue.  Now I'm old school -- [my first computer](https://en.wikipedia.org/wiki/TRS-80) had 4K in it and I've known people who owned things like the [KIM-1](https://en.wikipedia.org/wiki/KIM-1).  Sure I moved it to 48K as soon as I could but I started small.  That's why when I see an application like Nylas and how it uses memory it makes me want to [weep and then die](https://www.youtube.com/watch?v=SZGEiz2cpEw).  

Here's the memory usage after I had used it for about a half hour, 979 megs:

![nylas_memory_12_hours_earlier.png](/blog/assets/nylas_memory_12_hours_earlier.png)

As an additional test I left Nylas running all night long and the next morning it had eaten another 100 megs of RAM:

![nylas_memory_12_hours_earlier.png](/blog/assets/nylas_memory_12_hours_earlier.png)

It is important to understand that this isn't all that different from Slack which clocked in at 1.68 gigs.  Here's my Slack memory usage after multiple days up and running:

![slack_after_multiple_days.png](/blog/assets/slack_after_multiple_days.png)

# Performance

As I write this, I'm seeing very bad performance which is surprising because last night it was actually pretty peppy.  My guess is that with a release yesterday the backend servers which drive Nylas are likely under heavy load right now so even thought my second time experience isn't all that great, I'm going to give Nylas a pass on performance right now.

# The Bad - UI Glitches

Note: I mostly reviewed Nylas using the two panel theme.  Some of the problems I experienced you might not see at all if you use the one panel theme.

I did notice a few screen related UI rendering glitches around selection of non-contiguous mails in a list view.  Here's an example (5 selected but only 2 shown as selected).

![nylas_selection_problems.png](/blog/assets/nylas_selection_problems.png)

One of the key Nylas features is the ability to display contextual information related to the emailer and that's excellent but the app really calls for a very portait style, wide screen monitor.  I've seen it get to point where the contextual information was clipping off the right hand side of the message.  Here's a screenshot that shows this experience but not the clipping:

![nylas_clipping.png](/blog/assets/nylas_clipping.png)

One very real concern that I have is that the Send button is way at the bottom of the screen so if you have a long email there's a lot of scrolling just to say "Ok" or "Can we reschedule?".

Some smaller things:

* I have Choosy installed on OSX which is supposed to intercept calls to Safari and let you pick which browser to open links in.  Nylas somehow gets around this and launches Safari even though I have 3 other browsers open.  Sigh.
* I have scroll bars set to always be displayed and Nylas doesn't respect that.  So I have to click into a content region just to get a scroll bar to scroll.

