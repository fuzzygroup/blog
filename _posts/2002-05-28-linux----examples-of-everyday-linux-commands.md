---
layout: post
title: Linux -- Examples of Everyday Linux Commands
category: story.radio.weblogs.com
tags: ["linux"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Linux :: Examples of Everyday Linux Commands</title>
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
 | Last updated: 6/16/2002; 10:20:39 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Linux :: Examples of Everyday Linux Commands</b></font>

or "Scott's Ongoing Linux Struggle"

Co Author: [Kjartan Mannes](http://www.natrak.net/)

I have been using Unix (SunOS) since 1986 on Sun 2s.&nbsp; Despite this I find myself constantly asking stupid Linux questions whenever I encounter a more knowledgable Unix admin.&nbsp; For me the problem isn't lack of understanding -- it's poor memory.&nbsp; This document gives examples for common Linux commands like "how do I shut down Apache", "how do I view the last 100 entries in an error log" and so on.&nbsp; It's arranged topically by section.&nbsp; And, where I felt appropriate, I added general Linux advice like the section on GUI Admin Tools.

My heartfelt thanks go out to Kjartan who suffered through my silly questions with not a single trace of the all too common Unix Sys Admin arrogance or "Stupid user, how dare you ask me that.&nbsp; Off with your head!".

## GUI Admin Tools

If you need a GUI admin tool for remote Linux administration then run, do not want, to Webmin.&nbsp; [www.webmin.com](http://www.webmin.com).&nbsp; Highly recommended.&nbsp;

## Editors

There are a plethora of Linux editors.&nbsp; Tons.&nbsp; Even more than tons.&nbsp;&nbsp;There are three editors that are almost always present on a given Linux box:

- VI
- Emacs
- Pico

Editors are like religion and I don't go near religious debate.

## Chown and Chmod

chown and chmod are the two Linux commands that you use most frequently for web development, particularly if you are a Perl programmer.&nbsp; chown changes the ownership of a file while chmod changes it's "mode" i.e. read, write, execute, etc.

## User Management

&nbsp;

## MySQL

### Question: How do I restart MySQL?

It's either of these two commands (determine which by looking at the ps example below):

- mysqld
- safe-mysqld

### Question: How do I shutdown MySQL?

Use: mysqladmin shutdown

### Question: How do I check if MySQL is still running?

Use: ps aux | grep sql

You'll get back something like this:

    mysql 5381 0.0 0.5 108260 6100 ? S May21 0:00 /usr/sbin/mysqldmysql 5382 0.0 0.5 108260 6100 ? S May21 0:05 /usr/sbin/mysqldmysql 5383 0.0 0.5 108260 6100 ? S May21 0:00 /usr/sbin/mysqldmysql 25949 0.0 0.5 108260 6100 ? S May24 0:58 /usr/sbin/mysqldmysql 27913 0.0 0.5 108260 6100 ? S May26 0:11 /usr/sbin/mysqld

Or you can use just mysql and check from the user interface.&nbsp; I prefer ps myself.

## Client Side Errors that Make you Think it's Server Side

Two things:

Just as a general comment

es (05:41:25 AM): MSIE in its infinate wisdom repots dns errors when servers have in fact crashed

## CVS

kjartanmannes (05:57:38 AM): try a cvs up  
kjartanmannes (05:57:44 AM): maybe something is confliting  
fuzzygroup (05:57:54 AM): ok.  
fuzzygroup (05:58:11 AM): can I get the exact syntax so I don't muck it up (I'll learn over time, I promise)  
fuzzygroup (05:59:41 AM): mvr mind  
fuzzygroup (05:59:42 AM): found it  
kjartanmannes (05:59:44 AM): cvs update  
kjartanmannes (05:59:45 AM):

## Apache

fuzzygroup (05:42:07 AM): Apache logs are most recent last, so is there a simple command line to get the last 100 lines?  
kjartanmannes (05:42:30 AM): tail -100 logfile

## PHP

kjartanmannes (06:11:57 AM): its almost as if your PHP process crashes while parsing the page  
fuzzygroup (06:12:26 AM): how do I check for a php crash?  
kjartanmannes (06:12:46 AM): you have the command line interface running?  
kjartanmannes (06:12:53 AM): IE: can you access php from the shell  
fuzzygroup (06:13:03 AM): Not sure. will phpinfo tell me?  
fuzzygroup (06:13:33 AM): if so [http://www.inboxbuddy.com/version.php](http://www.inboxbuddy.com/version.php) has it.  
kjartanmannes (06:13:51 AM): just try typing php  
kjartanmannes (06:14:03 AM): if it gives you command not found you are outta luck

  
  

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

