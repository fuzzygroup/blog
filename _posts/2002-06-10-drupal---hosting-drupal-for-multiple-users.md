---
layout: post
title: Drupal - Hosting Drupal for Multiple Users
category: story.radio.weblogs.com
tags: ["drupal"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Drupal : Hosting Drupal for Multiple Users</title>
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
 | Last updated: 6/16/2002; 10:22:16 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Drupal : Hosting Drupal for Multiple Users</b></font>

## Installation

It's a CVS & Linux & MySQL thing.&nbsp; Harder than Radio in some ways, easier in others (if you are experienced).&nbsp; Average install time is now less than 5 minutes.&nbsp; No I didn't leave off a 0.&nbsp; 5 minutes.&nbsp; I've done it a few times so allow yourself 20 minutes or so.

## Changing the Default URL I Used

(If you aren't a \*nix user then ignore this section and move onto the next since your admin will have done it for you already)

I installed this drupal site into:

[http://www.blogsig.com/joefriend/drupal/](http://www.blogsig.com/joefriend/drupal/)

I then went into the Drupal directory and moved all the \*.php files up one directory so his url is now:

[http://www.blogsig.com/joefriend/](http://www.blogsig.com/joefriend/)

And I used ln -s to make symbolic links to each of the directories below the drupal directory.&nbsp; This means I don't have to modify the source at all.

  
  

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

