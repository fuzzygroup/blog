---
layout: post
title: Tools for Publishing an Ebook
category: ebook
tags: ["ebook"]
---
I resisted John Gruber's Markdown for **years**.  I always looked at it as "Damn it.  I know HTML; why the f would I need that?".  And then I started blogging using Jekyll which really forced immersion and now I damn well adore Markdown.  Markdown is one of those rare technology standards that I can point to and say "Yep.  It actually made my life *better*".  

I've recently been thinking about building an ebook and I'm not willing to **not use** Markdown as my writing format.  My formatting needs aren't large so, for me, Markdown is just fine for the writing portion of an ebook. The questions come about getting something else out of the markdown: 

* How do you generate the epub file?  
* How do you generate the pdf?  
* How do you get something into whatever format the kindle uses?
* How do you get something into the kindle store?
* How do you get something into the apple store?

I started my research from a Hacker News discussion on tools for [ebook publishing](https://news.ycombinator.com/item?id=15433327) which is a great place to start.  I've then done some additional research and I've summarized each of the tools.

# LeanPub

In the world of tech books, it seems like every few years there is a new company that I find myself regularly buying tech books from.  It used to be O'Reilly.  Then for a lot of years it was Pragmatic and, this year, it is LeanPub.  I have bought more technical books from LeanPub in 2017 than I have from Pragmatic and O'Reilly combined -- in the past two years.   LeanPub takes in Markdown and creates book from this markup.

# Gitbook

[Gitbook](http://www.gitbook.com) is a tool for taking inputs from any of these formats and producing an ebook:

* DocBook V5.x (.xml)
* Word (.docx)
* HTML (.html)
* Open Document (.odt)

Unfortunately the lack of Markdown as an official input source means that Gitbook isn't an option and I find that disappointing.  Their [pricing model](https://www.gitbook.com/pricing) is actually reasonable, free for open source books and $7 / month for up to 5 private ebooks.  They also seem to have good collaboration tools which is obviously useful for the publishing / editing process.

# Softcover

Softcover is a ruby based tool for creating ebooks created by Michael Hartl who is best known for creating documentation for the Ruby world.  Softcover is a Ruby gem which wraps around a large amount of open source and proprietary tools that are combined into a comprehensive ebook publishing tool.  Here's an example of the softcover check command which illustrates the different tools that Softcover relies on:

    Checking Softcover dependencies...
    Checking for LaTeX...         Missing
    Checking for GhostScript...   Missing
    Checking for ImageMagick...   Found
    Checking for Node.js...       Found
    Checking for PhantomJS...     Found
    Checking for Inkscape...      Missing
    Checking for Calibre...       Missing
    Checking for KindleGen...     Missing
    Checking for Java...          Found
    Checking for zip...           Found
    Checking for EpubCheck...     Missing

Even with all the open source tooling that I use constantly, I did not have all of these installed and that was fairly surprising to me.  Happily Softcover does an excellent job of not only telling you what you don't have but also how to get it.  Here's an example:

    Missing dependencies:
      • LaTeX (http://latex-project.org/ftp.html)
          ∟ Huge download—start it now!
      • GhostScript (should come with LaTeX)
      • Inkscape (http://inkscape.org/)
      • Calibre (http://calibre-ebook.com/)
          ∟ Enable Calibre command-line tools (http://manual.calibre-ebook.com/generated/en/cli-index.html)
      • KindleGen (http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211)
          ∟ Put the kindlegen executable on your path, e.g., in /usr/local/bin
      • EpubCheck 4.0.1 (https://github.com/IDPF/epubcheck/releases/download/v4.0.1/epubcheck-4.0.1.zip)
          ∟ Unzip and place epubcheck-4.0.1/ in a directory on your path

About the only change I could make here would be to point out the brew installations for OSX are *brew install caskformula/caskformula/inkscape* but given that not everyone uses brew, that's clearly an edge case.

# UlyssesApp

UlyssesApp is actually interesting.  In a field of mostly open source tools or software as a service options, UlyssesApp is a client side Mac application for creating your electronic book.  I'm honestly not sure about UlyssesApp but I'm willing to look further into it.