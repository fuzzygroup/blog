---
layout: post
title: Scotts Radio -- An Excursion into UserTalk
category: story.radio.weblogs.com
tags: ["blogging"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Scotts Radio :: An Excursion into UserTalk</title>
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
 | Last updated: 8/20/2002; 9:29:52 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Scotts Radio :: An Excursion into UserTalk</b></font>

<meta content="Microsoft FrontPage 4.0" name="GENERATOR"><meta content="FrontPage.Editor.Document" name="ProgId">

# UserTalk: The Radio Scripting Language<?xml:namespace prefix = o />

UserTalk is the underlying scripting language for Radio. From a technical perspective, UserTalk is an algol derived language with a syntax reminiscent of Pascal. Among UserTalk's unique features are:

- An integral object database for handling storage of variable length objects 

- Built in network connectivity and ability to script across different network protocols 

- A unique outline based development environment that dramatically aids in managing the complexity of script development 

The examples below are by no means a full guide to UserTalk. When O'Reilly previously published a book on UserTalk, when it was named Frontier, the guide was 592 pages. Clearly this is more of a taste of UserTalk than a full meal.

## The UserTalk Development Environment

One of the most distinctive aspects of UserTalk beyond the language itself but actually the environment in which you develop UserTalk scripts. At the heart of Radio is an outliner and an outlining metaphor. This outliner can also be used to structure your code and manage large blocks of code with an expand and collapse approach.

To work in the UserTalk development environment, the first step is to go into "Full Radio", the non browser version of Radio, talked about in Chapter 3 under Republishing your entire blog.. Here's how.

On Mac OS X: Control click the Radio icon in the Dock and choose Open Radio from the menu.  
On Windows: Right click the Radio icon and choose Open Radio from the menu.

The Radio development environment is displayed. Most of the Radio development features are located on the Tools -\> Developers menu as shown below.

![](http://radio.weblogs.com/0103807/images/an_exc10.gif)

Here are the important commands that you need to know to take advantage of this environment.

- Jump -- lets you jump directly to routine within the overall UserTalk framework. Think of Jump as a way to go directly to a class. 

- Workspace -- creates a new "workspace" or environment for you to work in with a local set of database entries 

- Quick Script -- lets you enter a simple script in a text editor and run it. Ideal for simple utilities. 

Although the UserTalk environment has additional tools, Jump Workspace and QuickScript are the one's you use most frequently. A picture of the overall environment including a workspace and the outline based scripting is shown below.

![](http://radio.weblogs.com/0103807/images/an_exc11.gif)

## UserTalk Language Examples and Verbs

Now that you have seen the UserTalk development environment, here are some examples of how common programming tasks are accomplished. Please note that these examples were largely referenced from the UserLand documentation on UserTalk.

Like every language, UserTalk has conditional statements. An if structure may include an else block. It will be executed if the expression is false.

    if answer > 6

       msg ("Big family!")

    else

       msg ("Not such a big family!")

A fileloop structure iterates through every item in a folder or on a disk (or even every disk), assigning the loop variable to each element in turn. The example below will use the message box facility (msg) to display the filename that the script finds.

    fileloop (f in path)

       msg (file.fileFromPath (f))

For more UserTalk examples, please see:

[http://www.fuzzygroup.com/go/?usertalkExamples](http://www.fuzzygroup.com/go/?usertalkExamples)

At the heart of UserTalk are a series of several hundred "verbs" (think statements in another language). All of these are documented online at the url: [http://docserver.userland.com/](http://docserver.userland.com/). Shown below is a table of the different categories of verbs that make up UserTalk.&nbsp;&nbsp; My thanks are extended to UserLand who let me use this material with permission.

| 

Verb Category

 | 

Uses, Comments and Notes

 |
| 

basic

 | 

Handle numbers, datatypes, objects, etc.

 |
| 

clock

 | 

Set and get system clock values. Time-stamp documents. Pause execution.

 |
| 

date

 | 

Get and set date values.

 |
| 

dialog

 | 

Display and return results from dialog boxes.

 |
| 

editMenu

 | 

Emulate behavior of Radio's Edit Menu, including fonts and styles

 |
| 

file

 | 

All file operations, including copy, delete, move, create, and rename. Looking at file and folder contents, read and write text files, deal with volumes, parse path names, lock and unlock files, handle Macintosh aliases, etc.

 |
| 

fileMenu

 | 

Emulate behavior of the Radio File menu.

 |
| 

Frontier

 | 

Turn agents on and off, make Radio the active application, and get information about Radio

 |
| 

kb

 | 

Determine if the Command, Control, Option, and/or Shift key is down.

 |
| 

launch

 | 

Open applications, control panels, documents, and code resources.

 |
| 

menu

 | 

Manage and manipulate the Radio menubar and menubar objects

 |
| 

mouse

 | 

Find out where the mouse is and if the button is being pressed.

 |
| 

op

 | 

Edit, navigate in, rearrange, expand, collapse, retrieve information from and otherwise manipulate Radio outline objects.

 |
| 

search

 | 

Handle Radio's internal find-and-replace operations

 |
| 

speaker

 | 

Define the sound the internal speaker will make and activate it.

 |
| 

string

 | 

Manage and manipulate string objects, including fields, word and sentences.

 |
| 

system

 | 

Deal with external applications and find out what version of the Operating System is in use.

 |
| 

table

 | 

Manipulate and interact with Radio Object Database tables and their contents.

 |
| 

target

 | 

Determine the Radio object that will receive the next action(s) taken in the environment.

 |
| 

window

 | 

Manage and manipulate Radio windows.

 |
| 

wp

 | 

Handle word processing objects and their contents, including setting properties, controlling the selection, formatting the appearance of text and changing its content.

 |

Beyond the standard UserTalk verbs, UserTalk also has a very sophisticated set of operators for comparisons, evaluation and more.

| 

**Operator**

 | 

**Purpose**

 |
| 

=

 | 

Assignment

 |
| 

+

 | 

Add numeric values or concatenate (join) string and character values

 |
| 

-

 | 

Subtract numeric values or remove the first occurance of one string from another

 |
| 

\*

 | 

Multiplication

 |
| 

/

 | 

Division (integer or real, depending on the datatypes)

 |
| 

%

 | 

Modulus (remainder of integer division)

 |
| 

==  
equals

 | 

Test for equality

 |
| 

!=  
notEquals

 | 

Test for inequality

 |
| 

\<  
lessThan

 | 

Less-than comparison

 |
| 

\<=

 | 

Less-than-or-equal comparison

 |
| 

\>  
greaterThan

 | 

Greater-than comparison

 |
| 

\>=

 | 

Greater-than-or-equal comparison

 |
| 

beginsWith

 | 

Compare one string to the beginning of another

 |
| 

contains

 | 

True if one string contains another

 |
| 

endsWith

 | 

Compare one string to the end of another

 |
| 

||  
or

 | 

Logical OR

 |
| 

&&  
and

 | 

Logical AND

 |
| 

!

 | 

Logical NOT

 |
| 

++

 | 

Increment

 |
| 

--

 | 

Decrement

 |
| 

@

 | 

Address-of

 |
| 

^

 | 

Dereference an address

 |

&nbsp;

## Hello World Revisited

The classic test for programming languages is always "Hello World" - a simple script that does nothing but write to the screen, console or dialog box "Hello World!".&nbsp; As programming environments get more and more sophisticated, the Hello World application always becomes interesting.&nbsp;

In Radio there are two ways to implement Hello World, Quick Script and as a saved script.&nbsp; Radio's Quick Script command is a text editor window where you can enter one or more lines of code and then execute them.&nbsp; A saved script is just that -- a script that has been saved into the Radio environment so that it can be called by another routine.

&nbsp;

We're going to start with a slight enhancement of our normal Hello World code to illustrate variable assignment and a function call along with just printing to the screen.&nbsp; What we need to do is:

1. Assign the text "Hello World!" to a variable, **s**. 

2. Force that text to be uppercase. 

3. Display that text. 

Here's our code for this:

    s = "Hello World!";

    s = string.upper ("Hello world!");

    dialog.notify (s);

&nbsp;

This is pretty standard development stuff.&nbsp; Here are some comments:

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 1

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 1 binds the text to the variable s.&nbsp;

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 1 also shows us that variables in UserTalk are untyped and dynamically converted between types as needed.&nbsp;

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The ";" is the delimiter between lines of code.

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 2

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string.upper is a string function which upper cases text.&nbsp; All UserTalk functions are organized into "categories" and then referenced by "category.specific\_function" syntax.

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Another example is strong.cleanMailAddress which normalizes an email address (this lowerUpperCase is standard in UserTalk for multiple word type things)

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Full documentation on UserTalk string functions is at: [http://docserver.userland.com/string/](http://docserver.userland.com/string/)

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 3

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dialog.notify pops up a dialog box with a notify icon.

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dialog.alert would popup the same dialog box but with a different icon

### Hello World with Quick Script

Here's how to write Hello World in UserTalk using Quick Script.

1. Go into Full Radio as described earlier in this section. 

2. Use Tools -\> Developers -\> Quick Script to open the Quick Script window. 

3. Enter this text into the window: 

    s = "Hello World!";

    s = string.upper ("Hello world!");

    dialog.notify (s);

1. Click the Run button and you should see something like this: 

![](http://radio.weblogs.com/0103807/images/an_exc12.gif)

**<font size="3">Writing Hello World as a Saved Script</font>**

Here's how to write Hello World in UserTalk as a script saved into the Radio environment.&nbsp; As discussed earlier, Radio has a unique outline based environment tied into its overall object database.&nbsp; The best way to think of Radio's object database is as a hierarchical set of name-value pairs.&nbsp; These are referred to as tables.&nbsp; The Radio object database stores the entire Radio environment including much of Radio's own code (above the level of system primitives, Radio is largely written in Radio).&nbsp; Since the environment is hierarchical, it is very analogous to a class browser based system like SmallTalk or the Common Lisp Object System (CLOS).&nbsp; In Radio the Jump command, CTRL+J, moves you into different sections of the system.&nbsp; For example, if you type CTRL+J and then "callbacks" you are taken to "system.callbacks".&nbsp; Note that Radio will automatically pre-pend "system." to your jump command if it's appropriate.&nbsp; Once you jump to something you can, of course, open the script associated with it.&nbsp; This is shown below in Figure 7-XXX.

![](http://radio.weblogs.com/0103807/images/an_exc13.gif)

In the UserTalk scripting environment, user code is stored in a table called "workspace".&nbsp; What we're going to do is:

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Go to workspace

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add a new script

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add our code

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Test it by calling it from QuickScript

Here are the steps

1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select Tools -\> Developers -\> Jump.

2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Type "workspace" (no quotes) and select Ok.

3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select Table -\> New Script.

4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Type "helloWorld" as the script name (again, no quotes) and select Ok.

5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Paste in the text from the Quick Script window (yes, it will still be there).

If you click the Run button at the top of the window code editing window, you will get this error message:

![](http://radio.weblogs.com/0103807/images/an_exc14.gif)

What this error message means is that at the context of helloWorld itself, it can't be run.&nbsp; However, if you go to the QuickScript window again and enter "workspace.helloWorld" and then click Run, this executes properly.&nbsp; If you want to run this from the context of the script itself then add the line "helloWorld()" to the end of the script.

&nbsp;

#### Copyright

<font size="2">Copyright (c) 2002, J. Scott Johnson. Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.1 or any later version published by the Free Software Foundation; with no Invariant Sections being, with no Front-Cover Texts, and with no Back-Cover Texts. A copy of the license is included in the section entitled "</font><font size="2">Appendix 1 - Terms of Use</font><font size="2">". </font>

<font size="2"><strong>Note:</strong> I'm new to writing a Free Documentation statement and the above might not be perfect. </font>

<script src="http://radiocomments.userland.com/comments?u=103807&amp;c=counts" type="text/javascript"></script>[comment&nbsp;[<script type="text/javascript" language="JavaScript">commentCounter ("stories/2002/08/20/scottsRadioAnExcursionIntoUsertalk")</script>]](http://radiocomments.userland.com/comments?u=103807&p=stories%2F2002%2F08%2F20%2FscottsRadioAnExcursionIntoUsertalk&link=http%3A%2F%2Fradio.weblogs.com%2F0103807%2Fstories%2F2002%2F08%2F20%2FscottsRadioAnExcursionIntoUsertalk.html "Click here to comment on this page.")

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

