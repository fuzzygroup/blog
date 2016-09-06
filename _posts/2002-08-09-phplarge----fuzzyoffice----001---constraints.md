---
layout: post
title: PHPLarge -- FuzzyOffice -- 001 - Constraints
category: story.radio.weblogs.com
tags: ["php"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>PHPLarge :: FuzzyOffice :: 001 - Constraints</title>
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
 | Last updated: 8/15/2002; 6:20:28 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>PHPLarge :: FuzzyOffice :: 001 - Constraints</b></font>

To: Interested, Geeky Parties  
From: A Geeky Scott  
Re1: Engineering a Large Scale Application in PHP  
Re2: System Constraints  
Date: Sometime in August, 2002 (see the blog entry date since I don't know when this will be posted)  
Where: Starbucks

NOTE: I hope this will be the last FuzzyOffice without at least \_some\_ code for a while.&nbsp; That probably won't be the case but I hope so.

Constraints, constraints, constraints. This is the set of initial decisions that you make -- with terror, fear and loathing -- that ultimately come to define your system.&nbsp; Now the single best lesson I learned while studing engineering (before I became a management droid) was that you need to clearly define constraints **up front**.&nbsp; And, in my fairly typical overachieving fashion, I've carried it into lots of different areas.&nbsp; For example -- whenever I'm working at someone else's home, the first question I ask, usually within 15 minutes of arrival, is "How long are we working?"&nbsp; That's a constraint.&nbsp; That way I can figure out what needs to get done within that time period.&nbsp;

Now the hardest part here is that you always, always make wrong choices when you choose constraints.&nbsp; We all know that we're going to make the wrong choices when we decide on constraints,&nbsp;so we don't want to do it and then the overall system design suffers.&nbsp; And this project is even more terrifying since it's being engineered in the open and publicly.&nbsp; This means that when I screw up, and I will, people will call me on it.&nbsp; Ah well... That's just plain life in the blogosphere.

Here then are the constraints that I am making for FuzzyOffice:

- User Load 
  - The system is inherently designed to support small workgroup productivity. Our sweet spot is intended to be up to 50 odd users. It may well scale better. It may well not. Stay tuned.   
  
- Data Model 
  - The bulk of our data will be stored in a database in a (basically) normalized database structure. 
  - Everything needs to be full text searchable.&nbsp; Everything.&nbsp; How to achieve that is unclear. 
  - Some data will exist in the file system; namely rich file objects like images, documents, etc.  
  
- Platform 
  - The target platform will be Apache 1.3 or later, PHP 4.2 or later (although 4.1 should work fine) and MySQL + a "data database" (clarified below) 
  - The supported "data" databases, those databases that store user data, will be either MySQL or Postgres. Initial support will be intentionally bound to MySQL with the introduction of an abstraction layer later in the process.&nbsp; Why? This approach gives working functionality sooner since I know MySQL quite well and do not have Postgres configured today.&nbsp; Right now I actually have real production customre data inside FuzzyOffice and implementing an abstraction layer would slow me from building the tools that I really, really need on a daily basis. 
  - The server platform is intended to be a relatively light load on an industry standard 1U box. 
  - We're targeting a cross platform browser model as much as possible.&nbsp; We ourselves use Windows, OSX and Linux daily.&nbsp; We need it for ourselves.  
  
- Installation 
  - It should be flexible enough for a user to install only 1 or 2 modules outside of a core module like security. 
  - Installation should be easy  
  
- Sharing and Privacy 
  - The system needs to be highly shareable yet still clearly preserve user privacy (hey just as an example we all bookmark things that we don't want others to see). 
  - The granularity of sharing needs to be down to the level of a single "object" (term loosely used intentionally).&nbsp; 
  - Sharing needs to be implemented thru simple urls that can be emailed or IM'd. 
  - Sharing needs to be supported within and across organizational lines while still preserving intellectual property 
  - Sharing needs to be time bound (example -- This url is only good for 10 days)  
  
- Security 
  - This is NOT a high, high, high security application.&nbsp; It's not Groove.&nbsp; 
  - Still the ability to function in https mode is desired 
  - Security needs to function at the: 
    - Application level -- some users need to be denied access to an entire application 
    - Content Level -- Read, Write, Edit, Create levels of access are needed 
    - Share Level -- The ability to share content with or without passwords is needed.&nbsp;   
  
NOTE: Sharing without passwords will be handled by the creation of unique, unguessable urls with a time expiration  
  
- Bookmarkability and Urls 
  - Things within in the system need to be bookmarkable 
  - Urls need to be short enough to NOT break email.&nbsp; None of this 80+ character long url that breaks email and IM clients 
  - NOTE: This will already break a lot of existing FuzzyOffice code.&nbsp; Sigh. 
  - Urls need to be predictable for authors / content owners but NOT predictable and utterly unguessable for shared content  
  
- Identity 
  - FuzzyOffice needs to recognize that the same person might have multiple SMTP addresses, multiple IM addresses but still represent a single identity 
  - FuzzyOffice needs to recognize that an external person might have multiple addresses but still be the same person.&nbsp; Handled via the contacts someone responding to cont  
  
- User Model 
  - There are two aspects to the user model: Users and Organizations 
    - A user is just that -- a person with a login for FuzzyOfice 
    - An organization is a collection of users with a common purpose (and yes that's very, very vague)
  - The user model needs to be very, very flexible to&nbsp;allow for users working with different people in MULTIPLE organizations 
  - The basic user model is that a single user&nbsp;can: 
    - Have multiple ways of being identified 
    - Belong to different "organizations"

As I write this, I realize that there is another constraint on FuzzyOffice.&nbsp; A significant constraint: **Time**.&nbsp; Right now there is exactly one developer on FuzzyOffice (and I'm not asking for more; just stating a fact).&nbsp; There are a lot of implications of time being a constraint.&nbsp; You'll see me make decisions that, perhaps, defy normal logic.&nbsp; Here's an example -- I will probably just dump all development files and images into 1 honkingly large directory.&nbsp; Why?&nbsp; It makes the installation process just plain easy.&nbsp; There are less settings for inexperienced people to screw up and that means less technical support email.

Here's another constraint: We're already using it and extending it daily.&nbsp; This means that things like the data models we're using are going to be very, very rough initially and that we'll fine tune them over time.&nbsp;&nbsp; When you look at my table structures, you may well laugh.&nbsp; Perhaps even laugh a lot.&nbsp; Bear in mind that we're whipping this out and will go back and normalize stuff later.&nbsp; And if you think that this doesn't happen in real companies all the time then you've never worked on a deadline in a software development company.&nbsp; It happens all the time.&nbsp; We all design stuff and then start working and, ahem, flexibility happens.

Here's another constraint: **Readable Code**.&nbsp; I am far, far, far more concerned that the code be readable and extensible by non-experts than I am about perfect, optimized code.&nbsp; For example -- if there is an if statement that could be handled by a single negative test, I'm likely to write that as an if statement with nothing in the body of the if and then an else statement where the logic exists.&nbsp; Why?&nbsp; Because negative logic can be difficult to follow.

Here's another constraint: **Practicality**.&nbsp; My ultimate goal is a system where the HTML and ALL STRINGS AND OTHER TEXT MESSAGES are cleanly isolated from the source code.&nbsp; This will take time.&nbsp; It will not be done initially.&nbsp; What will happen is that we'll build the application and then do it over time.&nbsp; This means that there will be working code significantly sooner but we will be doing "refits" along the way.&nbsp; So be it.

NOTE: As you can get tell from the writing in this section, it evolved over a period of days with constraints continually being added as I sought to explain (or justify) my approach.

  
  

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

