---
layout: post
title: Optimizing Email Addresses for Remote, Mobile Workers in an Age of Spam
category: story.radio.weblogs.com
tags: ["email", "spam"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Optimizing Email Addresses for Remote, Mobile Workers in an Age of Spam</title>
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
 | Last updated: 6/27/2002; 12:03:38 PM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Optimizing Email Addresses for Remote, Mobile Workers in an Age of Spam</b></font>

This document talks about an approach of optimizing SMTP addresses, i.e. standard email addresses, for a user base of remote, mobile, disconnected users -- with the additional challenge of minimizing spam if possible.

Disclaimer: This is a complex way to handle email.&nbsp; I am not giving any pretensions that this is simple.&nbsp; But, when you are a consultant, email is essentially mission critical.&nbsp;

## Introduction

My email has gotten so extensive that I have had to turn off the normal 3 minute email fetch in Outlook.&nbsp; Why?&nbsp; Because I send messages constantly and this is now affecting my ability to communicate with customers since I don't get my email often enough.&nbsp; As I analyze the problem, it becomes clear that what's absolutely killing me are all the mailing lists that I am on.&nbsp; I used to use a separate address for mailing lists but&nbsp;I can't do that anymore since so many all lists now require you to verify with a response from that address -- and Outlook 2000, my "main" email client, can't do that.&nbsp; Additional problems include the fact that I am out of the office regularly and often need frequent access to past emails --- AND my laptop connectivity is spotty at best due to both networking troubles and REPEAT hardware failures.&nbsp;

## Platform Assumptions

Here are the technology and other assumptions that I am making:

- The user has a real desktop or laptop computer that can run a rich email client like Outlook or Entourage
- The user regularly does not have full access to that machine when remote for 1 or more reasons (connectivity, tired of schlepping it around, dead hard drive) 
- The user has the ability to create or have created multiple email addresses and the ability to use lots of space on his or her mail server
- The user has a webmail solution like the powerful triad of Q-Mail / VPopMail and SQ Mail available to them

### Solution

Here's the approach that I have taken for myself and my partner, Gretchen.&nbsp; This is actually working very well for us.

1. Create a primary set of addresses such as [scott@fuzzygroup.com](mailto:scott@fuzzygroup.com) and [gretchen@fuzzygroup.com](mailto:gretchen@fuzzygroup.com).&nbsp; These are the desktop addresses that will be sucked into Outlook or Entourage or some other rich mail client regularly.
2. Create a secondary set of addresses such as [scottr@fuzzygroup.com](mailto:scottr@fuzzygroup.com) and [gretchenr@fuzzygroup.com](mailto:gretchenr@fuzzygroup.com)&nbsp; (the r stands for remote).&nbsp; Set QMail up so that all messages sent to [scott@fuzzygroup.com](mailto:scott@fuzzygroup.com) and [gretchen@fuzzygroup.com](mailto:gretchen@fuzzygroup.com) are automatically carbon copied to these two accounts.&nbsp; Set the passwords for these two accounts to match the passwords for the primary account.&nbsp; Remove the limits for these mailboxes or at least set them to be large.&nbsp; The benefit of the name **R** accounts is that these will be solely accessed via web mail so that when we are remote we have full access to all current Inbox contents.&nbsp; It also means that if we leave the office with Outlook running, and automatically receiving mail every 3 minutes, we still can see all messages.
3. Inform your users that "If you want something in Sent Items" to be accessible then bcc it to [scottr@fuzzygroup.com](mailto:scottr@fuzzygroup.com) or to [gretchenr@fuzzygroup.com](mailto:gretchenr@fuzzygroup.com).&nbsp; An alternative would be to create&nbsp;[scottsentitems@fuzzygroup.com](mailto:scottsentitems@fuzzygroup.com) and&nbsp;[gretchensentitems@fuzzygroup.com](mailto:gretchensentitems@fuzzygroup.com) &nbsp;
4. Document the heck out of this.

&nbsp;

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

