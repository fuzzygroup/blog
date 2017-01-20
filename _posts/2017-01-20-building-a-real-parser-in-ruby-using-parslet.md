---
layout: post
title: Building a Real Parser in Ruby Using Parslet
category: ruby
tags: ["ruby", "parsing", "software_engineering", "parslet"]
description: When parsing is really, really, hard, use Ruby and Parslet if you need more than a regular expression
image: http://fuzzyblog.io/blog/assets/recursive_descent_parsers.png
---
I deal with "parsing" all the time and I generally do it with one or more regular expressions.  And while I know that JWZ is famous for this statement:

> Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems.  alt.religion.emacs (lost; recovered) [JWZ](https://en.wikiquote.org/wiki/Jamie_Zawinski)

Regular expressions provide a uniquely powerful way to deal with day.  What the don't do well though is handle problems when you arbitrary complexity / recursion in your structure.  Let's say you are trying to parse: 

* "name like '%Warning%'"
* "name like '%Warning%' AND name not like '%noob%'"
* "name like '%Warning%' AND name not like '%blah%' AND name like '%bar%'" 

You see where this is going -- I have an arbitrary SQL like syntax and while I could craft a specialized regex which tried to deal with the max cases and then back off, at best that would be a hack.  At worst it would be code that I'd be ashamed to show Mother Johnson and that would be sad.  This calls for -- wait for it -- a real **parser**.

And, yes, I am talking about the stuff we all learned in compilers class aka [The Dragon Book](https://www.amazon.com/Compilers-Principles-Techniques-Tools-2nd/dp/0321486811).  If, like me, you didn't actually take a compilers class then let me explain.  The Dragon Book, for as long as [I can remember](https://en.wikipedia.org/wiki/Dragon_Book), has been the source of how you write compilers, parsers, etc.  Wikipedia cites it back to 1977 and that's what I mean by "as long as I can remember".  I know my first startup partner, Brian, used it in college circa 1988 and it has been in constant use, well, forever.

The stuff taught in the Dragon Book are techniques that either you use constantly because they neatly correspond to how you think or they are things you trot out once a decade or so when the problem is that severe.  In my case I last did this stuff in 1996 when I used it to write an HTML parser in Visual Basic.  That time I did it with a Lex / Yacc / Bison grammar using this [O'Reilly book](https://www.amazon.com/lex-yacc-Doug-Brown-ebook/dp/B009THDEBC) to assist me.

![http://kschiess.github.io/parslet/images/parsley_logo.png](http://kschiess.github.io/parslet/images/parsley_logo.png)

One of the beautiful things about computers as a profession is that if you've ever done something then there's a near certainty that it will loop back on you.  This time around I am tackling it with Ruby and the [Parslet](https://github.com/kschiess/parslet) gem.  I've been following Parslet on the mailing list since at least 2014 because I know just how important parsing is and [Kaspar Schiess](https://github.com/kschiess) has done fantastic work on it over the years.

Developing a parser with a tool like Parslet is not something you can just sit down and hack out.  This isn't that kind of gem -- I know, I tried it that way.  This is a:

* roll up your sleeves
* watch a video
* work thru an example
* scratch your head
* drink coffee
* re-watch the video
* finally get it
* extend the example

type of thing.  And that honestly is the exact process I used.  [Dv](http://www.dasari.me) and I worked thru it together and we couldn't make any progress until we sat down and did it this way.  Yes we were able to cobble together a simple grammar but we just couldn't put all the pieces together without this level of understanding.  But, I can promise you this, once you do actually understand how a tool like Parslet works then it is fundamentally transformative for you.  

In our case we started with Calle Erlandson's Recursive Descent Parsers talk available on [YouTube](https://youtu.be/_F-eh66zw90) and [github](https://github.com/calleerlandsson/recursive-descent-parsers-talk).  This is a fantastic video where he walks you through the development of an infix parser for a calculator i.e. "3 + 4 * 2" should be give a result if 11 (8 + 3) because you have to evaluate it mathematically not left to right.  Here is my repository where Dv and I extended Calle's example to include [division](https://github.com/fuzzygroup/recursive-descent-parsers-talk).  Yes I even sent a pull request over to him to perhaps get division into the master.

I know I wrote a lot of words and didn't even talk about parsing SQL like expressions.  That's because priorities got shifted and, just after getting ourselves ready to tackle the real project, it was a case of "And now please do this instead".  Sigh.  I'm sure I'll come back to this topic but really do watch the video -- it is fantastic.

