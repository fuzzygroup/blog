---
layout: post
title: PHPLarge -- FuzzyOffice -- 002 - Starting Small
category: story.radio.weblogs.com
tags: ["php"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>PHPLarge :: FuzzyOffice :: 002 - Starting Small</title>
    <style type="text/css">
      body {
        margin-top: 0px;
        margin-left: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        }

      body, td, p {
        font-family: verdana, sans-serif;
        font-size: 90%;
        }

      h2 { 
        font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 24px; font-weight: bold
        }
      .header {
        font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 40px; font-weight: bold
        }
      .realsmall {
        font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px;
        }
      .small {
        font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px;
        }
      </style>
    </head>

| 

 |

| ![](http://radio.weblogs.com/0103807/images/trans60x60.gif)  
 | Last updated: 8/16/2002; 7:54:39 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>PHPLarge :: FuzzyOffice :: 002 - Starting Small</b></font>

Note: Bear in mind that I'm writing some kinda complex things here without a technical reviewer.&nbsp; It's like flying without a net.&nbsp; You know where to email me when I'm wrong but be kind.

I'd love to tell you that this story contains all the FuzzyOffice code.&nbsp; I can't.&nbsp; I can't even tell you that this script contains most of the FuzzyOffice code.&nbsp; It doesn't.&nbsp; (And the next statement won't surprise you then).&nbsp; I can't even tell you that this script contains \_ANY\_ FuzzyOffice code.&nbsp; It doesn't.&nbsp; But it does contain code.&nbsp; Of that you can be certain.

Let me explain.

FuzzyOffice is now the biggest single PHP application I've written.&nbsp; It's up to&nbsp;27 + modules all at various levels of functionality, almost all of them able to store and retrieve data.&nbsp; More importantly and worse for writing about.&nbsp; They're all pretty much architected a little bit differently as I've "adapted" my style to fit the needs of the application.&nbsp; And, if you think "adapted" means "screwed up in the early stages" that would be correct Mr. Spock.&nbsp; You can now pass go and collect your obligatory 200 bars of Latinum.&nbsp;

So, when you know that they code you want to document isn't quite right yet and you honestly can't face rewriting it again -- at the time you want to blog about it, what do you do?&nbsp; What do you do?&nbsp; You **start small**.

Simple.&nbsp; You Make YAW (yet another website) that illustrates the approach to coding you are taking and is deliberately simple yet real.&nbsp; That's **starting small**.&nbsp; Once this example is out I should have had time to improve the coding on some of my base modules and be ready to show them.&nbsp; And, since I'm using the same coding approach for those scripts as I illustrate here, there is indeed frothy goodness to be learned.

So, without (much) further ado, I give you ...

[**<font size="4">www.phpblog.com</font>**](http://www.phpblog.com)  
  
(yeah it actually exists and kinda even works)

**Problem:** I want to read blogs about php.&nbsp; I can't find them.&nbsp; I know they're out there but where?

**Solution:** A website which is a registry of php related blogs.

**Comment:** Along the way document the source code and showcase core FuzzyOffice concepts including:

- An event driven coding model that even applies to home pages 
- A template driven layout model that even applies to homepages 
- Network I/O (input / output) with Snoopy

## Event Driven PHP Coding

Disclaimer: I am by no means taking credit for this style of coding.&nbsp; I'm not sure if I picked it up somewhere or invented it (like many things I do, I woke up at 3 am one morning with that classic "thunderbolt from god" experience when it was all just so clear to me).&nbsp; I'm also not saying it's perfect at all.&nbsp; I (probably) wouldn't use this for a high performance website with huge traffic.&nbsp; I originally thought that it seems best for websites that are really software applications.&nbsp; Now I'm starting to use it for content sites also.&nbsp; It works for me; perhaps for you, perhaps not.&nbsp; Anyway ...

PHP has a wonderful feature where you can readily mix code and HTML willy nilly (that means "all together and at random").&nbsp;&nbsp;For me at least?&nbsp; It's not the right approach.&nbsp; It's a very, very fast way to develop -- that I will admit.&nbsp; It's also, at least for me, a maintenance nightmare.&nbsp; Here's what I like:

- Code separate from HTML 
- One PHP source file that contains pretty much all of the "module" level application logic 
- Clear logic flow 
- The ability to fork tasks based on skills -- give a good designer like my partner Gretchen the task of the HTML and give me the real coding 
- The ability to use real design tools for HTML 
- The ability to translate and localize sites easily;&nbsp;the world isn't just English you know 
- The ability for an editor to review AND repair text in a site without having to grovel through web pages 

When you intermix HTML and PHP freely, this goes out the window and you're left with just plain lots of PHP files that only a real coder can deal with.&nbsp; That's great for the php coder (it keeps him employed) and not so great for the project or organization.&nbsp; The combination of event driven coding and template driven layout solves most of this.&nbsp; (What I mentioned with respect to an editor requires an additional step of abstraction that we'll cover in the next story).

So, what is event driven coding you ask?&nbsp; I'm finding that increasingly even my content pages have web forms inside them.&nbsp; And whenever there is a web form, there also needs to be a script to handle the "events" that generates.&nbsp; Of course this quickly leads to this mess:

- HTML page with N forms where N is a positive integer NOT less than 1 but&nbsp;often greater (search form, email this to a friend form, comment form) 
- PHP script for processing the search form 
- PHP script for processing the email this form 
- PHP script for processing the comment form

That's a mess!&nbsp; Here's how I handle it:

<font face="Courier New"><font color="#006600">switch (</font><font color="#0000cc">$action</font></font><font face="Courier New"><font color="#006600">) { <br>  case </font><font color="#0000cc">add</font></font><font face="Courier New"><font color="#006600">: <br>    </font><font color="#0000cc">add</font></font><font face="Courier New"><font color="#006600">();<br>    die();<br>  case </font><font color="#0000cc">search</font></font><font face="Courier New"><font color="#006600">: <br>    </font><font color="#0000cc">search</font></font><font face="Courier New"><font color="#006600">();<br>    die();<br>  default:  <br>    </font><font color="#0000cc">display</font><font color="#006600">(</font><font color="#0000cc">$statusmessage</font></font><font color="#006600"><font face="Courier New">);<br>    break;<br>}</font><br></font>

Near the top of any of my event driven scripts is this block.&nbsp; All of my forms have a hidden variable called action which is handled by one or more cases within this switch statement.&nbsp; Here's an example form from phpblog.com which is part of the index.php url:

    <FORM name=add action=index.php method=post>

    <input type=hidden name=action value=add>

I then define a function to handle that action and I'm pretty much done.&nbsp; When the page is just being displayed, the default case is called (since $action is null) and then the page's display routine is called.&nbsp; More on that routine in the 2nd section following but first something about how I code ...

## Coding Conventions

Every programmer defines his or her own coding conventions as they develop.&nbsp; And some can be fairly idiosyncratic (or weird).&nbsp; I'm no different.&nbsp; Here are some of the conventions you'll see in my stuff:

- 

Header Block at the Beginning

- 

Two Character Indenting with Spaces

- 

All Include Statements at the Top

- 

Global "Meta" Variables Following Include

- 

Switch Statement after Globals

- 

Function Definitions with LOTS of white space between them

- 

SQL statements Defined on Entirely Separate Lines of Their Own

Most of this is pretty basic so I don't need to describe it further.&nbsp; Two things stand out though.&nbsp; "Lots of white space" means that I actually have 10 or 15 blank lines between different functions.&nbsp; Why?&nbsp; I'm not a huge subroutine person in PHP so my functions tend to be large (that's bad I know; it's a work in progress).&nbsp; With lots of white space between functions, it's very apparent where one ends and another begins.&nbsp; This sounds stupid until you realize that for the 33rd time you've just edited the wrong thing.&nbsp; When you have lots and lots of code files and you do things fast, this really does happen (over 1,000+ php files on my main website alone).&nbsp; I move my sql statements onto one or more lines intentionally like this:

      $query = "

    SELECT * FROM '$maintable'

      ";

I've never seen anyone else do this so it deserves some explanation.&nbsp; Here's a little secret -- my SQL isn't always perfect.&nbsp; This approach lets me easily copy and paste&nbsp;SQL statements into PHPMyAdmin or another query tool for testing.&nbsp; Since I do most of my coding under Linux these days and I use VI in character mode, I don't have perfect mouse selection and this technique pretty much guarantees that I get the right code selected with just one swipe of the mouse.&nbsp; Given that most of my scripts tend to revolve around 1 main data table per PHP module I also define the name of that table as a variable at the beginning of the php file&nbsp;so I can move SQL statements from module to module with less changes (it's quite disconcerting when your changelog starts displaying contacts instead of changes!).

## Template Driven Layout or "display"

Given the blog world's focus on content templates and the seperation of content from presentation, no one is probably surprise to learn that I'm a fan of this too.&nbsp; Thankfully PHP offers lots and lots of ways to do this and I didn't have to write my own routines (I'm not a big fan of low level blocks; give me application specific code, thank you very much!).&nbsp; Here are some of the approaches to this in PHP that I am aware of:

- My satellite job buddy Ray's [branding article](http://www.phpbeginner.com/columns/ray/branding) in [www.phpbeginner.com](http://www.phpbeginner.com)
- [FastTemplate](http://www.thewebmasters.net/php/FastTemplate.phtml) which is technically obsolete and has been replaced by ... 
- [Smarty](http://smarty.php.net/) the new PHP template library

And there's more.&nbsp; Whenever code is involved, the PHP community does seem to be able to take on lots of different approaches to the problem.

Right now, today, I'm not using Smarty.&nbsp; I'm still using FastTemplate for all my projects.&nbsp; Sure I know that it's obsolete and that I should move to Smarty.&nbsp; But I have stuff working already.&nbsp; I know how to use it.&nbsp; And, like most developers, I'm wicked conservative when it comes to things that break my own stuff.&nbsp; And, while Smarty is better without question, when you already know something, you tend to stick with it.&nbsp; At some point we'll FuzzyOffice to Smarty en masse and enjoy the pain of it as a \_shared\_ exercise!&nbsp; Anyway, back to template driven layout ...

The basic idea of template based layout is simple -- pull the HTML (mostly) out of the PHP code and create a "template" containing variables where the PHP code can insert values for the variables.&nbsp; All a template is to FastTemplate is an HTML file with some markup conventions.&nbsp;

JSJ

## Network I/O

JSJ

## Da Code Boss!&nbsp; Da Code!

Here's a link to all the code discussed here:

> [http://www.phpblog.com/download/](http://www.phpblog.com/download/)

What I did was take advantage of PHP's .PHPS syntax coloring feature.&nbsp; This feature, taught to me by my buddy [Apokalyptik](http://www.apokalyptik.com/), lets a \*nix symbolic link (think Windows Shortcut or Macintosh Alias) to a source file be displayed in a color coded fashion.&nbsp; The symbolic links are created with a command like this:

    ln -s index.php index.phps

Now if you go to the url for that .phps file, you get this (try it):

[http://www.phpblog.com/index.phps](http://www.phpblog.com/index.phps)

<script src="http://radiocomments.userland.com/comments?u=103807&amp;c=counts" type="text/javascript"></script>[comment&nbsp;[<script type="text/javascript" language="JavaScript">commentCounter ("stories/2002/08/12/phplargeFuzzyoffice002StartingSmall")</script>]](http://radiocomments.userland.com/comments?u=103807&p=stories%2F2002%2F08%2F12%2FphplargeFuzzyoffice002StartingSmall&link=http%3A%2F%2Fradio.weblogs.com%2F0103807%2Fstories%2F2002%2F08%2F12%2FphplargeFuzzyoffice002StartingSmall.html "Click here to comment on this page.")

<script language="JavaScript" type="text/javascript"><!--
	var imageUrl = "http://radio.xmlstoragesystem.com/weblogStats/count.gif";
	var imageTag = "<img src=\"" + imageUrl + "?group=radio1&usernum=103807&referer=" + escape (document.referrer) + "\" height=\"1\" width=\"1\">";
	document.write (imageTag);
	//--></script>

 | ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 |
| ![](http://radio.weblogs.com/0103807/images/trans60x60.gif)  
 | Copyright 2002 © The FuzzyStuff  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif)  
 |

