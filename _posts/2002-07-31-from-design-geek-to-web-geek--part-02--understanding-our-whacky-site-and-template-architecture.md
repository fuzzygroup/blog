---
layout: post
title: From Design Geek to Web Geek- Part 02- Understanding Our Whacky Site and Template Architecture
category: story.radio.weblogs.com
tags: ["startup"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>From Design Geek to Web Geek: Part 02: Understanding Our Whacky Site and Template Architecture</title>
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
 | Last updated: 7/31/2002; 9:41:01 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>From Design Geek to Web Geek: Part 02: Understanding Our Whacky Site and Template Architecture</b></font>

To: Gretchen  
From: Scott  
Re: Understanding Our Whacky Site and Template Architecture

Disclaimer: This document is part of the "From Design Geek to Web Geek" series of articles that I am writing to train my consulting partner, Gretchen,&nbsp;in core web technologies.&nbsp; She would currently be described as a design geek that gets more and more technical as our business grows.&nbsp; [More...](http://radio.weblogs.com/0103807/stories/2002/07/19/fromDesignGeekToWebGeekPart0Introduction.html)&nbsp; Even though it's an internal training document, there is enough reusable content here to make it generally applicable hence the decision to blog these as I write them.

## Background

.

## What is SCP?

SCP stands for "secure copy" (the "cp" is the Unix copy command).&nbsp;&nbsp; SCP, unlike FTP, is "secure" which means that passwords aren't sent over the Internet, unencrypted.&nbsp; Even though passwords are rarely sniffed, security is DAMN important hence the advent of SCP.&nbsp; SCP functions similarly to a DOS copy command although the syntax is different.&nbsp; The nice thing about SCP is that it lets you move large groups of files to and from systems with just a few keystrokes.

## Where Do I Get SCP for Windows?

The SCP version that we use is PSCP which is part of the PUTTY SSH (secure shell) package.&nbsp; PSCP is free and can be downloaded from this url:

[http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)

Download the pscp.exe file and make sure that you save it into the winnt directory (or where ever Windows is installed).&nbsp; By saving it to this directory then the pscp program will always be available to you since the main Windows directory is always in your path statement.

## How Do I Install SCP for Windows?

No need. You did it above.

## How Do I Copy Files from Windows to Unix?

The simplest way to use pscp to copy files to a Unix host is like this:

pscp FILENAME [USERNAME@DOMAIN.EXT:/DIRECTORY](mailto:USERNAME@DOMAIN.EXT:/DIRECTORY)

Notes:

- PSCP is used from a DOS command line which you get under Windows 2000 by typing "CMD" into the Run command from the Start Menu. It's also available as an Icon but I have no idea where it's located. 
- The first time you use PSCP on a given computer for a given domain, it will ask you if the encryption key is valid. The general answer is yes. 
- After you press ENTER when using PSCP you will be asked for your password. Type it in and press ENTER to begin transfering files. 
- In the examples below the website blogsafe.com is implemented as a normal Unix user with a /home/blogsafe.com/ user directory and a standard htdocs directory below that 

Examples:

> To copy the file c:index.php to a Unix host named "blogsafe.com" with the "gcahaly" account and place it in the /htdocs/test directory you would use:
> 
> pscp c:index.php gcahaly@blogsafe.com:/home/blogsafe.com/htdocs/test
> 
> To copy the file index.php in the current directory to a unix host named "blogsafe.com" with the "gcahaly" account and place it in the /htdocs/test directory you would use:
> 
> pscp index.php gcahaly@blogsafe.com:/home/blogsafe.com/htdocs/test
> 
> To copy the file index.php in the current directory, AND preserve the file date and time, you need to use the -p (preserve) option, to a unix host named "blogsafe.com" with the "gcahaly" account and place it in the /htdocs/test directory you would use:
> 
> pscp -p index.php gcahaly@blogsafe.com:/home/blogsafe.com/htdocs/test
> 
> To copy all .JPG files in the current directory in the current directory, AND preserve the file date and time, you need to use the -p (preserve) option, to a unix host named "blogsafe.com" with the "gcahaly" account and place it in the /htdocs/test directory you would use:
> 
> pscp -p *.jpg gcahaly@blogsafe.com:/home/blogsafe.com/htdocs/test
> 
> To copy all files in the in the current directory and all subdirectories, AND preserve the file date and time, you need to use the -P (preserve) and -R (recurse) options, to a unix host named "blogsafe.com" with the "gcahaly" account and place it in the /htdocs/test directory you would use:
> 
> pscp *.* -p -r gcahaly@blogsafe.com:/home/blogsafe.com/htdocs/test
## How do I Copy Files from Unix to Windows?

## More

  
  

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

