---
layout: post
title: Welcome to gist.github.com/username
category: git
tags: ["git", "gist", "markdown", "internet"]
---
{:.center}
![IMG_7726.jpeg](/blog/assets/IMG_7726.jpeg)

I'd love to tell you that I figured this one out on my own but I didn't -- my friend Nick Janetakis taught me this trick.  Here's the problem statement:

> When you have a text document that you want someone to review, how do you put that document onto the Internet?

One obvious answer is Google Docs.  Another is some kind of shared file tool like Dropbox.  But these tools are *heavy*.  The idea of a *heavy* tool is a developer thing and it means that the tool does so much more than you need to solve the problem that using it feels awkward.  So let's restate the problem:

> When you have a text document that you want someone to review, what's a **lightweight** tool that you can use to put that document on the Internet?

When you start to work with people online, they often show you some cool tool that you never knew existed.  And this is just that type of thing.  Nick showed me:

    https://gist.github.com/

If you goto [https://gist.github.com/](https://gist.github.com/) when you are logged into Github then you get a place where you can create a **gist**.  The idea of a gist is that it is a snippet of text that you share online.  Now this was originally written for Programmer Foo to share a code routine with Programmer Bar who, in turn, might them change it and share with Programmer Baz.

Now you might be thinking that how does a web based code sharing tool make it possible for you to share a document ?  The answer is simple: **markdown**.  Markdown is an Internet standard for online writing which uses simple ASCII encoding to generate html.  For example a single # character means "Make a Heading of Level 1", two ## characters means "Make a heading of Level 2".  Here is a [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

What you can do to share a document is this:

1. Create a github account if you don't have one and login.
2. Go to [gist.github.com](https://gist.github.com/) and click the + sign in the black header.
3. This creates a new gist which gives you a web form where you can enter it.
4. Enter a filename like timeline.md (the .md extension is for markdown).  The filename extension tells Github how to display it / how it works with it when you are creating / editing it.
5. Format your text document with Markdown tags and then click either Create Secret Gist or Create Public Gist.
6. Gists are posted online not by the filename but by a hash like e02bd259a36fe28ea28560fe92c01bab.  This hash is a non guessable thing and it is uniquely constructed so even if you know my github username is fuzzygroup, you can't guess what my gist url for something might be.
7. The difference between Create Secret Gist and Create Public Gist is that the public option lists gists on the gist.github.com url where people can publicly rank them, share them, etc.  I always, always, always click Create Secret Gist.

Here's how you edit a gist that someone gives you:

1. Create a github account if you don't have one and login.
2. Goto the gist url you were given.
3. Click the Fork button at the top.  Forking is a version control concept from the programming world which basically says "I want to make a new version of this that is **MINE** i.e. a fork of the original".
4. Github will copy this data over to your account and change the url accordingly.
5. Now click the Edit button and the Markdown editing window will appear and you can make changes as you desire.
6. Your url is now tied to your username and the public / secret status is the same i.e. you end up with whatever security status you had originally.


