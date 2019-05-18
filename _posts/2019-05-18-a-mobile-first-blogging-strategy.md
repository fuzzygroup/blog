---
layout: post
title: A Mobile First Blogging Strategy
category: blogging
tags: ["blogging", "writing"]
---

A Mobile First Blogging Strategy

Not that anyone’s watching but if they were, they would notice that I’ve started blogging again both here and on my [recipes](https://www.fuzzyblog.io/recipes) site.  There were a few things that really made the difference in my starting again but the biggest was realizing that I could actually employ mobile devices in my blogging strategy.  

The interesting thing here is that I made zero changes in my blogging tool.  I'm still using Jekyll hosted on Github Pages.  These changes were purely in how I approached content.  You could use this with Jekyll, WordPress or any blogging tool.

Here's what I did:

1. The biggest change was my adoption of Apple Notes as a core text editor.  Yes it isn't perfect by any means but the fact that Apple Notes is a standard thing across my iPhone, my iPad and my OSX laptops means that I have a simple way to always create a blog post no matter where I am.  The Sync on Apple Notes seems to be flawless and it is fast enough that I now use Apple Notes as a "paste buffer" between my boxes.
2. I [turned off Smart Punctuation](https://www.howtogeek.com/344310/how-to-turn-off-smart-punctuation-on-your-iphone-and-ipad/) on all my iOS devices so I don't have issues with a curly quote in a MarkDown file.
3. I turned off Smart Punctuation on my OSX device also, Apple Menu, System Preferences, Keyboard, Text, uncheck Use Smart Quotes and Dashes.
4. I copied into my Apple Notes Blogging folder a markdown template for how I like to create a post.  When I need to start something I just copy it in at the top of the post.
5. I added a Belkin keyboard to my iPad converting it from a tablet to a lightweight, long lasting laptop.

And this is what my blogging strategy now looks like:

1.  Go into notes, wherever I am, in whatever computing device I have handy.
2. Open my template post and copy all of it.
3. Create a new note and paste in my template.
4. Write.  Lather / Rinse / Repeat as needed.
5. When I’m ready to publish, go to my actual laptop and copy the title off the post.  Then I execute a “jekyll post (paste in title)” and press enter.
6. I go back into the note and copy all of it with command + a, command + c
7. I open the resulting post in my MarkDown editor of choice, TextMate.
8. I paste in the text and make any residual edits / adjustments.
9. If I don’t have the Jekyll Server running, I start it with jekyll s to generate the correct feed and such.
10. In the command line, I do a git add / commit / push cycle.
11. And then everything is online almost instantly.

Writing this out does make it seem convoluted but it is actually pretty damn seamless and the ability to use any computing device I have at hand for content creation makes it *wonderful*.

