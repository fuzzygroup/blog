---
layout: post
title: PhotoBlog Spec 01
category: story.radio.weblogs.com
tags: ["blogging"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>PhotoBlog Spec 01</title>
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
 | Last updated: 7/19/2002; 6:10:11 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>PhotoBlog Spec 01</b></font>

This document is a spec for the new concept, to be implemented (most likely) as a standalone php code and as a Drupal module.

Digital pictures are a compelling application for virtually all users.&nbsp; The core, visceral appeal that images have for all users is immediately apparent on watching someone's eyes when they are shown digital pictures.&nbsp; Despite this, for most users, effectively using digital pictures is beyond their grasp.&nbsp; There are (at least) three basic ways to use digital pictures:

- As a slideshow of related images, shown successively, in some type of progression 
- As a "photo-story" where an introduction sets up the story and then captions at the photo level develop the story as the images are shown one by one.&nbsp; [Example](http://www.oddpost.com/photoOdyssey.html). 
- As a browsable collection or collections of images 
- As a searchable collection or collections of images

The purpose of the "PhotoBlog" module is to handle the above tasks as well as provide a management interface for digital photos.&nbsp;

Desired URL Structure

This is a photoblog url:

[http://www.fuzzygroup.net/photoblog/?c=paolo\_italy\_trip01&amp](http://www.fuzzygroup.net/photoblog/?c=paolo_italy_trip01&amp);photo\_id=39&view=slideshow

[http://www.fuzzygroup.net/photoblog/?c=paolo\_italy\_trip01&amp](http://www.fuzzygroup.net/photoblog/?c=paolo_italy_trip01&amp);photo\_id=39&view=photostory&name=bigchair

&nbsp;

  
  

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

