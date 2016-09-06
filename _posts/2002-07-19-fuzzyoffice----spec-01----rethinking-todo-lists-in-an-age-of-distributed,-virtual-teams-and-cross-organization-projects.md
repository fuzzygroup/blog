---
layout: post
title: FuzzyOffice -- Spec 01 -- Rethinking Todo Lists in an Age of Distributed, Virtual Teams and Cross Organization Projects
category: story.radio.weblogs.com
tags: []
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>FuzzyOffice :: Spec 01 :: Rethinking Todo Lists in an Age of Distributed, Virtual Teams and Cross Organization Projects</title>
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
 | Last updated: 7/19/2002; 2:52:33 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>FuzzyOffice :: Spec 01 :: Rethinking Todo Lists in an Age of Distributed, Virtual Teams and Cross Organization Projects</b></font>

<font face="Arial" size="2">It's painfully clear, at least to myself, that the traditional model of the humble todo list no longer meets the requirements placed upon on it.  Todo items are at the root of every organization, every individual and every project.  We need to re-think todo lists in order to handle today's ever changing environment.</font>

<font face="Arial" size="2"></font>&nbsp;

<font face="Arial" size="2">Problems with Classical Todo Items</font>

<font face="Arial" size="2">A classic todo list has multiple problems including: </font>

- <font face="Arial" size="2">Being inherently single user which hinders collaboration</font>
- <font face="Arial" size="2">Being tied to a singel machine at a point when individuals travel more than ever </font>
- <font face="Arial" size="2">Not allowing easy delegation such as Gretchen asking Scott to do something except by emailing someone which they then either lose track of in their inbox </font>
- <font face="Arial" size="2">Not allowing Person A to check on Person B's todo items -- essential in a cooperative workgroup environment where the people may be collaborating but geographically separate </font>
- <font face="Arial" size="2">Not maintaining a history of done items that can be viewed, checked and verified</font>
- <font face="Arial" size="2">Not being tied into a billing system</font>
- <font face="Arial" size="2">Complex todo items are insufficiently described by a short item.  A body of content is needed to explain a complex item.</font>
- <font face="Arial" size="2">Tasks Only Have Boolean States -- done or not done -- when you need to really have options like in progress, deferred, etc.</font>
- <font face="Arial" size="2">Tasks Lack Relationships to Other Tasks</font>
- <font face="Arial" size="2">People and the Environment Have Changed Significantly.  </font>
  - <font face="Arial" size="2">People - busier, less focused, more interrupt driven, more communications centric than ever before</font>
  - <font face="Arial" size="2">Environment -- Projects are faster paced than ever before along with a higher degree of concurrency.  So not only are projects cut short, they are interrupted and resumed regularly.</font>

<font face="Arial" size="2">Solution</font>

<font face="Arial" size="2">The solution being proposed is to shift todo items from being single user to multi user, stored on the web and managed via a database.  Todo items can be created by emailing a message to an address <a href="mailto:todo@domain.com"></a><a href="mailto:todo@domain.com">todo@domain.com</a> and then cc'ing a person other than yourself to delegate a task.  This fits nicely with the email centric culture that we have become.  An email client is not only ubiquitous but allows offline functionality allowing delegation to occur even when a user is offline.</font>

<font face="Arial" size="2"></font>&nbsp;

<font face="Arial" size="2">Properties of Todo Items</font>

<font face="Arial" size="2">A todo item can have these properties:</font>

- <font face="Arial" size="2">Context: </font>
  - <font face="Arial" size="2">Work or Personal</font>
- <font face="Arial" size="2">Date</font>
  - <font face="Arial" size="2">none</font>
  - <font face="Arial" size="2">today - <a href="mailto:today@domain.com"></a><a href="mailto:today@domain.com">today@domain.com</a></font>
  - <font face="Arial" size="2">weekend - <a href="mailto:weekend@domain.com"></a><a href="mailto:weekend@domain.com">weekend@domain.com</a> </font>
  - <font face="Arial" size="2">week - <a href="mailto:week@domain.com"></a><a href="mailto:week@domain.com">week@domain.com</a></font>
  - <font face="Arial" size="2">month - <a href="mailto:month@domain.com"></a><a href="mailto:month@domain.com">month@domain.com</a></font>
  - <font face="Arial" size="2">year - <a href="mailto:year@domain.com"></a><a href="mailto:year@domain.com">year@domain.com</a></font>
  - <font face="Arial" size="2">Specific -- pulled by parsing from the Subject or Body of the item</font>
- <font face="Arial" size="2">Project</font>
  - <font face="Arial" size="2">By adding "NAME: blah, blah, blah" in the subject the NAME token is treated as the name of a project</font>
  - <font face="Arial" size="2">Example: BLN: Rewrite Project Documentation  would add a todo item of "Rewrite Project Documentation" with a project of BLN </font>
- <font face="Arial" size="2">Sub Project(s)</font>
  - <font face="Arial" size="2">By adding NAME: NAME1: NAME2: NAME3: NAME4: the additional name tokens are treated as sub projects building a virtual hierarchy of todo items allowing a tree rather than a list to be displayed</font>
- <font face="Arial" size="2">Attributes</font>
  - <font face="Arial" size="2">A series of automatically recognized attributes such as </font>
    - <font face="Arial" size="2">client name</font>
    - <font face="Arial" size="2">project</font>
    - <font face="Arial" size="2">Time Spent</font>

<font face="Arial" size="2">Allowable States for Tasks</font>

<font face="Arial" size="2">The following states should be supported for tasks:</font>

- <font face="Arial" size="2">Null (the default)</font>
- <font face="Arial" size="2">Done</font>
- <font face="Arial" size="2">In Progress</font>
- <font face="Arial" size="2">Deferred </font>
- <font face="Arial" size="2">Rejected</font>

<font face="Arial" size="2"></font>&nbsp;

<font face="Arial" size="2">Data Format</font>

<font face="Arial" size="2">The following data formats should be supported</font>

- <font face="Arial" size="2">Subject Line becomes the todo item</font>
- <font face="Arial" size="2">A series of bulleted items within the body of the email become a series of todo items</font>

<font face="Arial" size="2">Email Addresses</font>

<font face="Arial" size="2">A work todo item for yourself can be handled by sending a message to <a href="mailto:todo@domain.com"></a><a href="mailto:todo@domain.com">todo@domain.com</a> from any email addresses known to represent yourself.</font>

<font face="Arial" size="2"></font>&nbsp;

<font face="Arial" size="2">A personal todo item for yourself can be handled by sending a message to <a href="mailto:todo@domain.com"></a><a href="mailto:todo@domain.com">todo@domain.com</a> &amp; cc'ing it to <a href="mailto:personal@domain.com"></a><a href="mailto:personal@domain.com">personal@domain.com</a>.</font>

<font face="Arial" size="2"></font>&nbsp;

<font face="Arial" size="2">A todo item for yourself that needs to be done today can be handled by sending a message to <a href="mailto:todo@domain.com"></a><a href="mailto:todo@domain.com">todo@domain.com</a> and cc'ing it to <a href="mailto:today@domain.com"></a><a href="mailto:today@domain.com">today@domain.com</a>.</font>

<font face="Arial" size="2"></font>&nbsp;

<font face="Arial" size="2">A future item can be sent to <a href="mailto:remindme@domain.com"></a><a href="mailto:remindme@domain.com">remindme@domain.com</a> such as </font>

<font face="Arial" size="2">subject: Next Year</font>

<font face="Arial" size="2">body: Take Gretchen to Shabu * Restaurant</font>

<font face="Arial" size="2"></font>&nbsp;

  
  

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

