---
layout: post
title: UserTalk- The Radio Scripting Language
category: story.radio.weblogs.com
tags: ["blogging", "radio_userland", "usertalk"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>UserTalk: The Radio Scripting Language</title>
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
 | Last updated: 6/16/2002; 10:22:21 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>UserTalk: The Radio Scripting Language</b></font>

UserTalk is the underlying scripting language for Radio. From a technical perspective, UserTalk is an Algol-derived language with a syntax reminiscent of Pascal. Among UserTalk's unique features are: <?xml:namespace prefix = o />

- An integral object database for handling storage of variable length objects 

- Built in network connectivity and ability to script across different network protocols 

- A unique outline-based development environment that dramatically aids in managing the complexity of script development 

The examples below are by no means a full guide to UserTalk. When O'Reilly previously published a book on UserTalk, when it was named Frontier, the guide was 592 pages. Clearly this is more of a taste of UserTalk than a full meal.

## The UserTalk Development Environment

One of the most distinctive aspects of UserTalk beyond the language itself but actually the environment in which you develop UserTalk scripts. At the heart of Radio is an outliner and an outlining metaphor. This outliner can also be used to structure your code and manage large blocks of code with an expand and collapse approach.

To work in the UserTalk development environment, the first step is to go into "Full Radio", the non browser version of Radio, talked about in Chapter 3 under Republishing your entire blog.. Here's how.

On Mac OS X: Click the Radio icon in the Dock and choose Open Radio from the menu.  
On Windows: Right click the Radio icon and choose Open Radio from the menu.

The Radio development environment is displayed. Most of the Radio development features are located on the Tools -\> Developers menu as shown below.

<?xml:namespace prefix = v /><shapetype id="_x0000_t75" stroked="f" filled="f" path="m@4@5l@4@11@9@11@9@5xe" o:preferrelative="t" o:spt="75" coordsize="21600,21600"><stroke joinstyle="miter"></stroke><formulas><f eqn="if lineDrawn pixelLineWidth 0"></f><f eqn="sum @0 1 0"></f><f eqn="sum 0 0 @1"></f><f eqn="prod @2 1 2"></f><f eqn="prod @3 21600 pixelWidth"></f><f eqn="prod @3 21600 pixelHeight"></f><f eqn="sum @0 0 1"></f><f eqn="prod @6 1 2"></f><f eqn="prod @7 21600 pixelWidth"></f><f eqn="sum @8 21600 0"></f><f eqn="prod @7 21600 pixelHeight"></f><f eqn="sum @10 21600 0"></f></formulas><path o:connecttype="rect" gradientshapeok="t" o:extrusionok="f"></path><lock aspectratio="t" v:ext="edit"></lock></shapetype><shape id="_x0000_i1025" style="WIDTH: 324pt; HEIGHT: 267.75pt" o:ole="" type="#_x0000_t75"><imagedata o:title="" src="../../../DOCUME~1/SJOHNS~1.000/LOCALS~1/Temp/msoclip1/01/clip_image001.png"></imagedata></shape> ![](http://radio.weblogs.com/0103807/radiou1_usertalk.gif)

Here are the important commands that you need to know to take advantage of this environment.

- Jump -- lets you jump directly to routine within the overall UserTalk framework. Think of Jump as a way to go directly to a class. 

- Workspace -- creates a new "workspace" or environment for you to work in with a local set of database entries 

- Quick Script -- lets you enter a simple script in a text editor and run it. Ideal for simple utilities. 

Although the UserTalk environment has additional tools, Jump, Workspace and QuickScript are the ones you use most frequently. A picture of the overall environment including a workspace and the outline-based scripting is shown below.

<shape id="_x0000_i1026" style="WIDTH: 323.25pt; HEIGHT: 241.5pt" o:ole="" type="#_x0000_t75"><imagedata o:title="" src="../../../DOCUME~1/SJOHNS~1.000/LOCALS~1/Temp/msoclip1/01/clip_image003.png"></imagedata></shape> ![](http://radio.weblogs.com/0103807/radiou2_usertalk.gif)

## UserTalk Language Examples and Verbs

Now that you have seen the UserTalk development environment, here are some examples of how common programming tasks are accomplished. Please note that these examples were largely pulled from the UserLand documentation on UserTalk.

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

At the heart of UserTalk are a series of several hundred "verbs" (think statements in another language). All of these are documented online at the url: [http://docserver.userland.com/](http://docserver.userland.com/). Shown below is a table of the different categories of verbs that make up UserTalk.

<center>
<table style="mso-cellspacing: 1.5pt" cellpadding="0" width="876" border="0">
<tbody>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">Verb Category<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Uses, Comments and Notes<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">basic<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Handle numbers, datatypes, objects, etc.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">clock<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Set and get system clock values. Time-stamp documents. Pause execution.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">date<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Get and set date values.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">dialog<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Display and return results from dialog boxes.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">editMenu<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Emulate behavior of Radio's Edit Menu, including fonts and styles<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">file<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">All file operations, including copy, delete, move, create, and rename. Looking at file and folder contents, read and write text files, deal with volumes, parse path names, lock and unlock files, handle Macintosh aliases, etc.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">fileMenu<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Emulate behavior of the Radio File menu.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">Frontier<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Turn agents on and off, make Radio the active application, and get information about Radio<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">kb<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Determine if the Command, Control, Option, and/or Shift key is down.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">launch<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Open applications, control panels, documents, and code resources.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">menu<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Manage and manipulate the Radio menubar and menubar objects <span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p></p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">mouse<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Find out where the mouse is and if the button is being pressed.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">op<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Edit, navigate in, rearrange, expand, collapse, retrieve information from and otherwise manipulate Radio outline objects.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">search<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Handle Radio's internal find-and-replace operations<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">speaker<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Define the sound the internal speaker will make and activate it.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">string<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Manage and manipulate string objects, including fields, word and sentences.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">system<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Deal with external applications and find out what version of the Operating System is in use.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">table<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Manipulate and interact with Radio Object Database tables and their contents.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">target<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Determine the Radio object that will receive the next action(s) taken in the environment.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">window<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Manage and manipulate Radio windows.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="81">
<p class="MsoNormal">wp<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" width="781">
<p class="MsoNormal">Handle word processing objects and their contents, including setting properties, controlling the selection, formatting the appearance of text and changing its content.<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
</tbody>
</table>
</center>

Beyond the standard UserTalk verbs, UserTalk also has a very sophisticated set of operators for comparisons, evaluation and more.

<center>
<table style="mso-cellspacing: 0in; mso-padding-alt: 6.0pt 6.0pt 6.0pt 6.0pt" cellspacing="0" cellpadding="0" border="0">
<tbody>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal"><b>Operator</b><span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal"><b>Purpose</b><span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">=<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Assignment<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">+<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Add numeric values or concatenate (join) string and character values<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">-<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Subtract numeric values or remove the first occurance of one string from another<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">*<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Multiplication<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">/<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Division (integer or real, depending on the datatypes)<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">%<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Modulus (remainder of integer division)<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">==<br>equals<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Test for equality <span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p></p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">!=<br>notEquals<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Test for inequality<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">&lt;<br>lessThan<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Less-than comparison<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">&lt;=<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Less-than-or-equal comparison<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">&gt;<br>greaterThan<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Greater-than comparison<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">&gt;=<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Greater-than-or-equal comparison<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">beginsWith<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Compare one string to the beginning of another<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">contains<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">True if one string contains another<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">endsWith<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Compare one string to the end of another<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">||<br>or<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Logical OR<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">&amp;&amp;<br>and<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Logical AND<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">!<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Logical NOT<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">++<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Increment<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">--<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Decrement<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">@<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; BACKGROUND: whitesmoke; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Address-of<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
<tr>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">^<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
<td style="PADDING-RIGHT: 6pt; PADDING-LEFT: 6pt; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt" valign="top">
<p class="MsoNormal">Dereference an address<span style="FONT-SIZE: 12pt; FONT-FAMILY: 'Arial Unicode MS'"><p> </p></span></p>
</td>
</tr>
</tbody>
</table>
</center>

&nbsp;

## Hello World Revisited

The classic test for programming languages is always "Hello World" - a simple script that does nothing but write "Hello World!" to the screen, console or dialog box.&nbsp; As programming environments get more and more sophisticated, the Hello World application always becomes interesting.&nbsp;

In Radio there are two ways to implement Hello World, Quick Script and as a saved script.&nbsp; Radio's Quick Script command is a text editor window where you can enter one or more lines of code and then execute them.&nbsp; A saved script is just that -- a script that has been saved into the Radio environment so that it can be called by another routine.

&nbsp;

We're going to start with a slight enhancement of our normal Hello World code to illustrate variable assignment and a function call along with just printing to the screen.&nbsp; What we need to do is:

1. Assign the text "Hello World!" to a variable, **s**. 

2. Force that text to be uppercase. 

3. Display that text. 

Here's our code for this: 

&nbsp;

    Local (s = "Hello World!");

    s = string.upper (s);

    dialog.notify (s);

&nbsp;

An alternative to dialog.notify(s) would be to use return (s) and then call the macro from a web page or blog post as described in the next section.

&nbsp;

This is pretty standard development stuff.&nbsp; Here are some comments:

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 1

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 1 binds the text to the variable s.&nbsp;

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 1 also shows us that variables in UserTalk are untyped and dynamically converted between types as needed.&nbsp;

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The ";" is the delimiter between lines of code.

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 2

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string.upper is a string function which uppercases text.&nbsp; All UserTalk functions are organized into "categories" and then referenced by "category.specific\_function" syntax.

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Another example is strong.cleanMailAddress which normalizes an email address (this lowerUpperCase is standard in UserTalk for multiple-word-type things)

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Full documentation on UserTalk string functions is at: [http://docserver.userland.com/string/](http://docserver.userland.com/string/)

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Line 3

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dialog.notify pops up a dialog box with a notify icon.

o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dialog.alert would pop up the same dialog box but with a different icon

### Hello World with Quick Script

Here's how to write Hello World in UserTalk using Quick Script.

1. Go into Full Radio as described earlier in this section. 

2. Use Tools -\> Developers -\> Quick Script to open the Quick Script window. 

3. Enter this text into the window: 

    s = "Hello World!";

    s = string.upper ("Hello world!");

    dialog.notify (s);

1. Click the Run button and you should see something like this: 

<shape id="_x0000_i1027" style="WIDTH: 251.25pt; HEIGHT: 188.25pt" type="#_x0000_t75" alt=""><imagedata src="../../../DOCUME~1/SJOHNS~1.000/LOCALS~1/Temp/msoclip1/01/clip_image005.png" o:href="http://www.fuzzygroup.com/blogbook/pictures/c07_usertalk_helloworld_quick_script.gif"></imagedata></shape> ![](http://radio.weblogs.com/0103807/radiou3_usertalk.gif)

### Hello World as a Saved Script

Here's how to write Hello World in UserTalk as a script saved into the Radio environment.&nbsp; As discussed earlier, Radio has a unique outline-based environment tied into it's overall object database.&nbsp; The best way to think of Radio's object database is as a hierarchical set of name-value pairs.&nbsp; These are referred to as tables.&nbsp; The Radio object database stores the entire Radio environment including much of Radio's own code (above the level of system primitives, Radio is largely written in Radio).&nbsp; Since the environment is hierarchical, it is very analogous to a class-browser-based system like SmallTalk or the Common Lisp Object System (CLOS).&nbsp; In Radio the Jump command, CTRL+J, moves you into different sections of the system.&nbsp; For example, if you type CTRL+J and then "callbacks" you are taken to "system.callbacks".&nbsp; Note that Radio will automatically pre-pend "system." to your jump command if it's appropriate.&nbsp; Once you jump to something you can, of course, open the script associated with it.&nbsp; This is shown below in Figure 7-XXX.

<shape id="_x0000_i1028" style="WIDTH: 280.5pt; HEIGHT: 209.25pt" type="#_x0000_t75" alt=""><imagedata src="../../../DOCUME~1/SJOHNS~1.000/LOCALS~1/Temp/msoclip1/01/clip_image007.png" o:href="http://www.fuzzygroup.com/blogbook/pictures/c07_usertalk_helloworld_jump_callbacks.gif"></imagedata></shape> ![](http://radio.weblogs.com/0103807/radiou4_usertalk.gif)

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

<shape id="_x0000_i1029" style="WIDTH: 306pt; HEIGHT: 57pt" type="#_x0000_t75" alt=""><imagedata src="../../../DOCUME~1/SJOHNS~1.000/LOCALS~1/Temp/msoclip1/01/clip_image009.png" o:href="http://www.fuzzygroup.com/blogbook/c07_usertalk_helloworld_error.gif"></imagedata></shape> ![](http://radio.weblogs.com/0103807/radiou5_usertalk.gif)

What this error message means is that at the context of helloWorld itself, it can't be run.&nbsp; However, if you go to the QuickScript window again and enter "workspace.helloWorld" and then click Run, this executes properly.&nbsp; If you want to run this from the context of the script itself then add the line "helloWorld()" to the end of the script.

  
  

<script language="JavaScript" type="text/javascript"><!--
	var imageUrl = "http://subhonker6.userland.com/weblogStats/count.gif";
	var imageTag = "<img src=\"" + imageUrl + "?group=radio1&usernum=103807&referer=" + escape (document.referrer) + "\" height=\"1\" width=\"1\">";
	document.write (imageTag);
	//--></script>

 | ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 |
| ![](http://radio.weblogs.com/0103807/images/trans60x60.gif)  
 | Copyright 2002 © The FuzzyStuff  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif)  
 |

