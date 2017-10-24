---
layout: post
title: Drupal - Drupal from a Radio User's Perspective
category: story.radio.weblogs.com
tags: ["blogging", "drupal"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Drupal : Drupal from a Radio User's Perspective</title>
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

<font size="+1"><b>Drupal : Drupal from a Radio User's Perspective</b></font>

I've recently begun playing with Drupal, [www.drupal.org](http://www.drupal.org), for a bunch of reasons, at least one major one is that a) it's written in PHP, b) Kjartan, one of the team leads, is a reader of my blog and is now someone I consider a friend and c) Kjartan has a better committment to software quality than anyone I've ever met in my life (and that may well include myself).&nbsp; So, I figured that since I know Radio, it would probably be useful to write about this tool from the perspective of a seasoned Radio user.&nbsp; I just got up a Drupal site for Joe Friend to experiment with and I figured that what I did for him was just generally useful.

**Warning**.&nbsp; There are a lot of big screen captures here.&nbsp; It was a fast way to author this document.&nbsp; Bear that in mind when you read it.

## Installation

I'm going to assume that Drupal is already installed and functional but no user has yet logged in.&nbsp; Installation will be covered in a future document.

## Getting Started: The Very First Thing

When the very first user logs into a Drupal site, he or she is made the site administrator.&nbsp; This essentially means the "Radio user" i.e. the person using Drupal as a blogging environment.&nbsp;

## Set Your Permissions

A big difference between Drupal and Radio is that Drupal is much more multi user than Radio.&nbsp; This means that you need to correctly set your permissions.&nbsp; My first few times I mucked this up fairly badly so, this time, I got Kjartan to verify my work.&nbsp; Here's how you set them:

![](http://radio.weblogs.com/0103807/images/drupal_permissions_for_radio_users.gif)

The difference in Drupal between anonymous user and authenticated user is pretty

## Configuring Your Modules 

The next step you want to take is configuring your modules.&nbsp; A module is a loadable component which gives you one or more features.&nbsp; Here is the current (June 10, 2002) set of modules installed by default with Drupal:

![](http://radio.weblogs.com/0103807/images/drupal_module_administration.gif)

I turned a few modules off as shown here:

![](http://radio.weblogs.com/0103807/images/drupal_module_administration_modules_turned_on.gif)

## Turning On the Blogger API Module 

Now Joe is a Radio user (as am I).&nbsp; You's used to Radio.&nbsp; As am I.&nbsp; If we turn on the Blogger API support in Drupal and then turn on the Blogger-Manila bridge in Radio, anything Joe puts into Radio automatically goes into Drupal.&nbsp; That's pretty cool.&nbsp; Here's how to do that from the Main administration page shown above.

Now that you have turned on the Blogger API support in Drupal, you need to enable it in Radio as shown below:

&nbsp;

NOTE: There is seemingly a bug in Radio which prevents edits to blogged posts from being sent back to the target system via the blogger API.&nbsp; I checked the code for Drupal myself and it does accept

## News Aggregator 

We all know and love Radio's News Aggregator.&nbsp; Drupal has one too so we'll start by setting this up.&nbsp; Setting up the Aggregator is done with the Newsfeeds command in Site Administration while actually blogging an item is done from the main user menu.

Click on Administer my Drupal site and the choose News Feeds.

![](http://radio.weblogs.com/0103807/images/drupal_module_newsfeeds_no_feeds.gif)

&nbsp;

![](http://radio.weblogs.com/0103807/images/drupal_module_newsfeeds_add_feed.gif)

&nbsp;

![](http://radio.weblogs.com/0103807/images/drupal_module_newsfeeds_one_feed_added.gif)

Clicking on update items gives us this:

![](http://radio.weblogs.com/0103807/images/drupal_module_newsfeeds_one_feed_added_and_updated.gif)

Now you can use add new feed to add more feed items.&nbsp; Shown below are 3 feeds in Drupal.

![](http://radio.weblogs.com/0103807/images/drupal_module_newsfeeds_multiple_feeds.gif)

Click on Home to exit the System Administration portion of Drupal.&nbsp;

![](http://radio.weblogs.com/0103807/images/drupal_module_mynewsfeeds_newsitems.gif)

&nbsp;

![](http://radio.weblogs.com/0103807/images/drupal_module_mynewsfeeds_newsitems_post_preview.gif)

&nbsp;

![](http://radio.weblogs.com/0103807/images/drupal_module_mynewsfeeds_newsitems_blogged_and_done.gif)

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

## Comments: Very, Very Different -- But Better

W

## What's Missing?

Here are some of the things that you'll find, as a Radio user, are missing:

- Anonymous Email Responder, the little Mail icon 
- 

&nbsp;

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

