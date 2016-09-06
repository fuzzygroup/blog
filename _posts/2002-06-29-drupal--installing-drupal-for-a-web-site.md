---
layout: post
title: Drupal- Installing Drupal for a Web Site
category: story.radio.weblogs.com
tags: ["drupal"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Drupal: Installing Drupal for a Web Site</title>
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
 | Last updated: 6/29/2002; 9:31:31 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Drupal: Installing Drupal for a Web Site</b></font>

I've written positively about Drupal for quite a while now.&nbsp; But I haven't done a lot to document it (I have cleaned up the English on several of the source modules although not as many as I wanted to).&nbsp; This document lays out how to configure Drupal for a single website.&nbsp; It assumes the following:

- \*nix 
- Apache
- The website is a named user under Unix that matches the name of the domain i.e. if the domain of the Drupal site is [www.scottsweblog.com](http://www.scottsweblog.com) then the Unix user name is scottsweblog.com
- All content is in a /htdocs/ directory below /home/username/
- Drupal itself is installed into a drupal subdirectory below /home/username/htdocs/ or /home/username/htdocs/drupal/

Please note that these restrictions are how I chose to configure this installation.&nbsp; These aren't Drupal requirements -- Drupal is a supremely flexible system.

## Step 1: Read This

[http://www.drupal.org/node.php?id=320](http://www.drupal.org/node.php?id=320)

Set

&nbsp;

  
  

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

