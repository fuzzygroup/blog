---
layout: post
title: From Design Geek to Web Geek- Part 01- File Transfer to and From Unix using SCP
category: story.radio.weblogs.com
tags: []
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>From Design Geek to Web Geek: Part 01: File Transfer to and From Unix using SCP</title>
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
 | Last updated: 8/21/2002; 5:44:49 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>From Design Geek to Web Geek: Part 01: File Transfer to and From Unix using SCP</b></font>

To: Gretchen  
From: Scott  
Re: Moving Files From Windows to Unix and Unix to Windows using SCP

Disclaimer: This document is part of the "From Design Geek to Web Geek" series of articles that I am writing to train my consulting partner, Gretchen,&nbsp;in core web technologies.&nbsp; She would currently be described as a design geek that gets more and more technical as our business grows.&nbsp; [More...](http://radio.weblogs.com/0103807/stories/2002/07/19/fromDesignGeekToWebGeekPart0Introduction.html)&nbsp; Even though it's an internal training document, there is enough reusable content here to make it generally applicable hence the decision to blog these as I write them.

## Background

Transferring files between computers is what I would call an "atomic" action.&nbsp; I.e. it is so fundamental that you simply have to be able to do it in order to really us a computer.&nbsp; Back in the day we used to copy files to and from floppies.&nbsp; Then it was over a local area network.&nbsp; And now it generally is move to Unix from Windows or move from Unix to Windows (and I know that OS X coverage is needed here but our iBook isn't in front of me now so that will be done in a revision).

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
- I recommend that you create a C:UPLOAD directory on your windows box and then put any files to move up to Unix in that directory.&nbsp; This centralizes the file move process in 1 place.&nbsp; I'd also make a C:UPLOADDONE directory where you can periodically move files that you've uploaded but not yet tested.

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

The simplest way to use pscp to copy files from Unix to Windows is like this:

pscp [USERNAME@DOMAIN.EXT:/DIRECTORY/FILENAME](mailto:USERNAME@DOMAIN.EXT:/DIRECTORY/FILENAME) .

Notes:

- The . indicates to copy the file into the current directory 
- Set your current directory to the directory where you want the files copied to 
- See notes from the section above -- they still apply

&nbsp;

Examples:

> To copy the file index.php in the directory /home/htdocs/test from a Unix host named "blogsafe.com" with the "gcahaly" account and place it in the c:download directory you would use:
> 
> pscp gcahaly@blogsafe.com:/home/blogsafe.com/htdocs/test/index.php c:download
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
> 
> C:uploadinboxbuddyinboxbuddy>pscp -p -r -unsafe sjohnson@Blogsafe.com:/home/inboxbuddy.com/htdocs/docs/* .
> 
>  
## More

<script src="http://radiocomments.userland.com/comments?u=103807&amp;c=counts" type="text/javascript"></script>[comment&nbsp;[<script type="text/javascript" language="JavaScript">commentCounter ("stories/2002/07/19/fromDesignGeekToWebGeekPart01FileTransferToAndFromUnixUsingScp")</script>]](http://radiocomments.userland.com/comments?u=103807&p=stories%2F2002%2F07%2F19%2FfromDesignGeekToWebGeekPart01FileTransferToAndFromUnixUsingScp&link=http%3A%2F%2Fradio.weblogs.com%2F0103807%2Fstories%2F2002%2F07%2F19%2FfromDesignGeekToWebGeekPart01FileTransferToAndFromUnixUsingScp.html "Click here to comment on this page.")

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

