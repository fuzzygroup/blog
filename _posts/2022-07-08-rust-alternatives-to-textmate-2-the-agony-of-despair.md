---
layout: post
title: Rust Editors to Replace TextMate 2 - The Agony of Despair
date: 2022-07-08 08:59 -0400
category: rust
tags: ["rust"]
---
The older I get and remain an active software engineer, the less accepting I am of **poor software quality**.  All of us know that software crashes, generally, are a choice of the developer in terms of his:

* technology platform -- some technologies are inherently riskier than others i.e. "Friends don't let friends use C++"  or "Practice safe computing my son"
* development practices -- things like test driven development and pair programming (stop it Bryan; we can debate that someday) that demonstrably improve code quality
* engineering philosophy -- Erlang is a fabulous demonstration that by embracing failure you can make more reliable software

But when you fail to address any of the above, you end up with today's software crisis.  And, honestly, I'm tired of it.

This morning, at about 6:53 am, my beloved TextMate 2, an editor that less than 2 hours ago, I had typed into a Discourse thread "You can pry out of my cold dead hands", went insane once again.  TextMate 2 has a lockup context where it won't crash but it will just sit there and refuse to respond to keystrokes.  Then you have to force quit it and depending on the severity of its insanity will recover its context on restart or not.  This is why I write down posts like:

* [Fixing TextMate 2 When It Goes Insane](https://fuzzyblog.io/blog/textmate/2020/01/15/fixing-textmate-2-when-it-goes-insane.html)
* [Forensic Computing 1 - Finding TextMate Untitled Documents](https://fuzzyblog.io/blog/text/2017/10/08/forensic-computing-1-finding-textmate-untitled-documents.html)
* [Adding AutoSave on Focus Lost to TextMate 2](Adding AutoSave on Focus Lost to TextMate 2)

> Sidebar: When TextMate had to be Force Quit, it was using 1.76 gigs of RAM.  Now, despite doing nothing but opening this one document (and all my history it recovered), it is now using 2.93 gigs of RAM.  This document is only 562 words.  Somehow, maybe it is just me, that doesn't explain the additional 1.18 gigs of RAM used for just 562 words.  I am on a computer with 64 gigs of RAM and 1/20th of that is my FSCKING TEXT EDITOR!!!

Every time you have a crash in something as fundamental as an editor for a software developer, it is an excuse for us to lose focus, stop, take a break, etc.  Me?  I went to the grocery story -- at a point when I had been closing in on making a release of an open source package I've been promising myself to finish for **6 years**.  I still haven't gotten back to that Zen point of coding I had been at even though hours have passed.  This is why I hate crashes.  And I have now been writing about this since 2003:

> 

It has been said that insanity is doing the same thing repeatedly and expecting different results.  And, yes, I've been expecting classically written software to simply get better over time.  This isn't going to happen so it is time to look for alternatives.

## About Rust

Rust is a relatively new programming language with a focus on speed, correctness and memory safety.  Rust essentially makes the crazy gyrations that are so common -- and inherently wrong -- in C derived languages so hard that you simply don't make them.  And this:

1. Makes Rust hard to learn.
2. Self selects the programmers willing to learn rust down to an elite handful.
3. Results in higher quality software.

I don't think I'm incorrect in saying that when a piece of software written in Rust exists, it is going to be higher quality than something written in C / Swift / C++ / Java.  And, because of that, I have started using more software written in Rust whenever possible.  I recently switched my terminal from iTerm 2 to [Warp.dev](https://www.warp.dev/) because of this.

## What Do I Need in an Editor

I'm a hard core rubyist with a focus on Rails.  Yes I do other languages but the Ruby stuff is not going to change.  Here's what I need in an editor:

1. Graphical; Sorry I do like the WIMP interface; I did my half million lines of code in VIM and I love Bram Moolenar but no; just no
2. Basic conformation to platform conventions
3. Able to be invoked easily from the command line and open a directory of files with a tree view on the left
4. Able to be used for documents (markdown / ascii) as well as code
5. Syntax highlighting
6. Keystroke macro recording
7. Autosave on focus lost
8. Extensibility if at all possible; TextMate succeeded in large part because there are bundles for everything 
9. A window menu that lists all windows
10. Configurable keystrokes
11. Fuzzy Finder for quick navigation to files
12. Cross file search
13. Features need to be discoverable
14. Fast
15. Side by Side display.  TextMate doesn't have this but I noticed it in Lapce and added it to the list because it was that damn impressive.
16. Has to be low enough overhead that I can create a new doc, not bother to save it, drop some text bits into it and get back to it when I please; in essence I'm treating editor windows / buffers at virtual scraps of paper.  Periodically I will recurse through them and deal with but it may not be for weeks. And don't tell me that's my problem -- right now I have 50 windows open.  Each with maybe a few K of text.  On a 64 gig machine.

And I don't have to have everything but that's the core nexus of what I use daily.

## Let's Look at Some Options

| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |

I took a [Reddit post](https://www.reddit.com/r/rust/comments/rfx8az/thoughts_on_some_of_the_actively_developed_text/) which listed a bunch of Rust editors and thought I'd use this exercise as a way to learn MarkDown table structures.  I took his list and graded them against my criteria. One interesting thing I did was, since so many of these are written in public, I included the commit count in the table below.  Just looking at the commit count shows me that of the editors listed, only a few are actually real i.e. something that is being regularly developed enough to live on as a daily driver.

| Editor     | Commit Count | 1 Graphical  | 2 Platform | 3 Open  | 4 Documents | 5 Syntax | 6 Macros | 7 Auto Save | 8 Extensibility | 9 Window | 10 Keystrokes | 11 Fuzzy |  12 Search | 13 Discoverable | 14 Fast | 15 Side By Side | Default Key Bindings |
| ----------- | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | 1,170 |  N|
| [glyph](https://github.com/zackradisic/glyph)      | 50|  N|
| [helix](https://github.com/helix-editor/helix) | 3,028 | Y | 
| [hired](https://github.com/sidju/hired)| 78 | N| 
| [kibi](https://github.com/ilai-deutel/kibi) | 179 | N|  | 
| [lapce](https://github.com/lapce/lapce) | 1,669 |  Y | N | N | ? | Y | ? | ? | ? | N | ? | ? | ? | N | Y |
| [pepper](https://github.com/vamolessa/pepper) | 3,133 | N  | ? |  ? | N | 
| [Zed](https://zed.dev/)| ??? | ?  |
| [zee](https://github.com/zee-editor/zee) | 137 |  N| Nope! | Yes | I think so | N  | Don't care if it doesn't syntax highlight | Don't Know | Yes | No | Yes | Emacs; Alas|

Notes: 

* Kibi is notable for being a clone of Kilo by AntiRez; Kilo is one of the great current lessons in software engineering
* Zed is conceptual afaict - exists only on a web page; sounds great but absolutely NOT filling
* Zee explicitly doesn't load the [Ruby TreeSitter](https://github.com/tree-sitter/tree-sitter-ruby) grammar; for Ghu's sake Zee, Why?  It isn't like you have an anti-package philosophy like Pepper
* Zee is absolutely impressive.  Just watching the crates it uses as it compiles is like a laundry list of editor related goodness (yes I'm an editor wonk)