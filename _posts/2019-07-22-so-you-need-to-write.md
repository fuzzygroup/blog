---
layout: post
title: So You Need to Write
category: writing
tags: ["writing", "blogging", "heinlein"]
---
I'm a long time blogger and from time to time I get people asking me how I produce as many words as I do.  I know a few people looking to start writing projects and I thought I'd put together a few notes on the topic of how I'm productive.

# My Guidelines for Writing Productively

Here is the quick version of my writing guidelines:

1. Break the tyranny of the file
2. Write in smaller chunks - never chapters
3. Write don't format
4. Look into different writing tools
5. Realize that no one thing you write matters all that much
6. Measure your progress and improve on it

## Break the Tyranny of the File

I haven't primarily written using a classical word processor software now since 1987 and I attribute most of my productivity to this one fact, specifically I think that I haven't had to think about files in almost 30 years.  I refer to this as "breaking the tyranny of the file".  As stupid as it may sound, the need to decide how to name a file, where to locate a file, etc are all cognitive decisions that pull mental energy away from the actual writing process.  And lest you think that in 2019, files are simpler than ever, consider this dialog box from trying to close an unsaved document in Pages:

[View Pic](https://i.imgur.com/a/CYHtw37.png)

I'm sorry but this doesn't make much sense even to me (the answer here is to click Delete; sigh).

The easiest way for most people to break the tyranny of the file is to use a content management system like a blog where, yes, there are files but their creation and management is hidden.  As an example, here's how I create something in my blogging tool:

    jekyll post "So You Need to Write"

-or- if I want to make a draft that isn't going to go live today:

    jekyll draft "So You Need to Write"

And that one command builds what I need and I can then open it in my editor.  I never have to worry about filename / location / etc.

## Write in Smaller Chunks - Never Chapters

Along with breaking the tyranny of the file comes the idea of working in small chunks - think sections (or posts) not chapters.  The longer the thing that you are "writing" is, the harder it is to hold it all in your head at once.  If you can write a long work it at the section / post level and then composite it together at the end you will find that each section is easier to write.

And if you are a software developer trying to write, consider this analogy.  At one time or another, we've all written functions that were longer than one screen.  Remember how hard it was to keep all of that function in your head.  Well, working at the section level is analogous.

## 3. Write Don't Format

I view formatting as the absolute bane of writing.  Tools like Microsoft Word make formatting so seductive because you feel "productive" but, really, you aren't being productive when you are formatting, you are just "twiddling" with the content.  To me one of the worst advances in modern software for writing productivity is the full integration of formatting tools right into the writing process.  From my perspective, you write and then you format as a final step before output.

Note: Structural formatting like headings, inline emphasis such as bold facing / italics are fine.  I'm more referring to the "let's see what this looks like with a different font / margins / etc" type of twiddling.

## 4. Look Into Different Writing Tools

To paraphrase McLuhan's famous "[The Medium is the Message](https://en.wikipedia.org/wiki/The_medium_is_the_message)", I would argue that the tool alters the output.  If all you have ever used to write is Microsoft Word, well, there is a whole world out there of writing tools that will dramatically affect how you write.  I cover these in the next section and I would strongly, strongly argue that you at least explore different tools.

Note: If you're addicted to some of the actually excellent tools inside Word such as the grammar checker then you can always do what I do and copy and paste a chunk of writing into Word, let the grammar checker give you changes and then move it back.  I do this regularly. 

## 5. Realize That No One Thing You Write Matters All That Much

When you write a lot, you come to realize that no one thing actually matters all that much.  I tend to view writing as a corpus -- some bits are stronger than others and the value is in the totality.  I no longer fret about if a particular piece is perfect because I have accepted that some will be and some won't be.  

## 6. Measure Your Progress and Improve On It

One of the best changes I've made for being a productive writer in 2019 is that I now benchmark my progress and I use it to motivate myself.  Here's an example

[View Pic](https://imgur.com/a/IJF29FK)

I should note that my numbers here are lower than they would normally be.  A big part of the reason for that is that I wrote the tooling driving the screenshot above (new product coming soon).

# Writing Tools

For the purposes of being transparent, I will tell you what writing tools I use.  But, for the sake of kittens everywhere, DO NOT use what I use.  My tool choices would likely lead to incessant, Tourette's style cursing.  I use idiosyncratic tools because I've been doing this forever and I'm an uber nerd.  These work for me and likely don't work for you.

## My Personal Writing Tools 

I use:

* [TextMate](https://macromates.com/) as an editor
* [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) as a drop dead simple content formatter
* [Jekyll](https://jekyllrb.com/) as a blogging tool 
* [Github](https://github.com/fuzzygroup/blog) for content management (and Jekyll is intimately tied to github)
* [gist.github.com](https://gist.github.com/fuzzygroup) for generating temporary content versions that I can show people a quick draft.  [Nick Janetakis](https://nickjanetakis.com/) taught me this trick.  Thanks Nick!
* [Google Docs](https://docs.google.com) if I need a way for people to edit something but Google Docs WILL NOT re-produce Markdown so it is a suck ass, bullcrap tool. Argh.

To repeat, do not try and use these tools the way I do.  After all, I modeled my writing process after the way I do software development right down to using git ...

### A Note About Github

I thought my comment about using Github / git for managing my writing was my being a typically overly nerdy developer and Mark Bernstein gave me some interesting feedback:

"This might actually be OK advice for writers; I liked the Pragmatic Programmer’s advice, back in the day, to keep all your writing in subversion.  It's possible that Time Machine obviates some of the need for this, but it's a good idea."

If you are committed to using a plain ASCII format for writing such as MarkDown or HTML then Github / git might actually be something to consider.  Do bear in mind that Git is an industrial strength tool and [not always the easiest thing to use](https://fuzzyblog.io/blog/git/2019/06/27/understanding-a-small-organization-s-git-development-model.html).

## Tools You Should Consider

Here are the writing tools that you should look at:

* [WordPress](https://wordpress.com/)
* [Tinderbox](https://www.eastgate.com/Tinderbox/)
* [Storyspace](https://www.eastgate.com/storyspace/)
* [Scrivener](https://www.literatureandlatte.com/scrivener/overview)

### WordPress

If you are looking to write daily and just build that skill then I strongly recommend that you blog.  I've been blogging now since 2002 and I was one of the authors on the [O'Reilly Essential Blogging book](https://www.amazon.com/Essential-Blogging-Selecting-Doctorow-Paperback/dp/B00ME3RFYA/) (by the way O'Reilly, I've never once gotten a royalty check -- did no copies ever sell?).  Anyway, blogging is a drop dead simple way to write that incorporates a lot of my approaches:

* Break the tyranny of the file 
* Write in smaller chunks 
* Write Don't Format

And if you're going to blog then WordPress is a damn fine way to do it.  And hosted WordPress is both easy and cheap; you don't need your own server.  Recommended.

### Tinderbox / Storyspace

I'm covering these tools together because they both come from the same creative mind and, to me, they are heavily interlinked (despite being different products).  Tinderbox and Storyspace are both more tools for thinking about / planning what you have to write than the writing itself.  Both tools are heavily oriented around graphical views of the structure of your writing.  And Tinderbox is specifically designed for note taking.  

Here is some commentary from the author:

"Storyspace 3 works seamlessly with Tinderbox, with which it shares files. Tinderbox is designed for making, visualizing, and analyzing notes, making it ideal for the early stages of ambitious projects. Storyspace is designed for writing and reading interlinked narrative; many writers will move freely between Tinderbox and Storyspace."

### Scrivener

Scrivener is the best thought-out tool I've seen for writing long form works (think books / novels) in a damn long time.   With a focus on structural views and working in small chunks, Scrivener addresses my top three concerns (tyranny of the file / smaller chunks / write don't format).  You have to be open to really learning a new tool to use Scrivener, but it is worth it.



### Disclaimers

Matt Mullenweg, the founder of WordPress, is a friend and one of the coolest folks I know online.  But despite that bias, WordPress is still damn awesome.

Tinderbox and Storyspace are both written by Mark Bernstein who is also a friend and has been doing this stuff even longer than I have.  I met Mark back in '87 when we both attended the first ACM Conference on Hypertext at University of North Carolina, Chapel Hill.  And while I have done a lot of different things career wise, Mark has focused exclusively on writing tools and brought a lot of good into the world that way.  I respect him greatly for this.

Mark Bernstein read an early draft of this post and gave me a number of great changes.  Thank you Mark!

All of the techniques above I have used extensively -- for non fiction writing.  I have never tried them in a fiction context.  I suspect that they would work but I can't attest to that.

# In Closing

Someone I used to know once made a wonderful observation on how to be a successful writer.  It was short, succinct and beautiful in its clarity:

“Fingers on keys; ass in chair”