---
layout: post
title: Understanding The Owl Document Management Permissioning Model
category: story.radio.weblogs.com
tags: []
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			The FuzzyBlog! : Understanding The Owl Document Management Permissioning Model
			</title>
		<meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT"> 
<style type="text/css">
body {
				margin:10px 80px 10px 80px;
				background: #5385AA url('http://radio.weblogs.com/0103807/images/blueBG.jpg');
				font-size: 90%;
				font-family: verdana, arial, helvetica, sans-serif;
				line-height:160%;
				color:#333
				}
td {
				font: 11px verdana, arial, helvetica, sans-serif;
				line-height:15px;
				}
			A {
				color: #345877; font-family: verdana, arial, sans-serif;
				font-size:10px;
				text-decoration: none;
				font-weight:bold;
				} 
			A:link {
				color: #345877;
				text-decoration: none;
				} 
			A:visited {
				color: #4C80AD;
				text-decoration: none;
				} 
			A:active {
				color: #99CC66;
				} 
			A:hover {
				color: #000;
				text-decoration: underline;
				}
			#banner {
				font-family:verdana, arial, sans-serif;
				color:#FFF;
				font-size:28px;
				line-height: 11px;
				font-weight:bold;
				padding-left:20px;
				padding-right:20px;
				padding-top:40px;
				text-align: left;
				}
			.description {
				font-family:verdana, arial, sans-serif;
				font-style: italic;
				line-height: 11px;
				color:#FFF;
				font-size:10px;
				font-weight:bold; 
				}      
			#content {
				background:#FFF;
				margin:15px;
				min-width: 500px;
				border-bottom: 2px solid;
				border-top: 1px solid;
				border-left: 1px solid;
				border-right: 2px solid;
				border-color: #000;
				}
			#links {
				background:#345877;
				color: #FFF;
				font-weight: bold;
				text-align: left;
				margin-top: 4px;
				margin-left: 4px;
				margin-right: 4px;
				padding-right: 5px;
				padding-left: 5px;
				padding-bottom: 3px;
				padding-top: 2px;
				text-transform: lowercase;
				padding-right:15px;        
				border-bottom: 1px solid #000;
				border-top: 0px solid #FFF;
				border-left: 0px solid #FFF;
				border-right: 0px solid #FFF;
				}
			.navigatorLink {
				font: 11px verdana, arial, helvetica, sans-serif;
				color:#B5B0C4;
				font-size:11px;
				font-weight:bold;
				line-height:16px;
				}
			a.navigatorLink:link
				{
				color: #A0C2D6;
				text-decoration: none;
				letter-spacing: normal;
				}
			a.navigatorLink:visited
				{
				color: #8BA9BA;
				text-decoration: none;
				letter-spacing: normal;
				}
			a.navigatorLink:hover
				{
				color: #ffffff;
				text-decoration: underline;
				letter-spacing: normal;
				}
			.blogbody {
				color:#333;
				font-weight:normal;
				background:#FFF;
				margin-top: 0px;
				margin-bottom: 4px;
				margin-left: 4px;
				margin-right: 4px;
				padding-left:50px;  
				padding-right:50px;
				padding-top:30px;      
				padding-bottom:50px;      
				border-bottom: 1px solid #4C80AD;
				border-top: 0px solid #345877;
				border-left: 1px solid #345877;
				border-right: 1px solid #4C80AD;
				}  
			.title { 
				font-family: verdana, arial; 
				font-size: 17px; 
				color: #345877; 
				font-weight:bold;  
				margin-bottom: 15px;
				margin-top: 3px;
				}  
			.newsItems { 
				padding-left: 15px;
				}  
			.footer {
				padding-top:30px;
				margin-top:30px;
				border-top:1px solid #345877;
				}
			.date { 
				font-family:verdana, arial, sans-serif;
				color:#345877;
				font-size:11px;
				font-weight:bold;
				background:#FFF;
				line-height:14px;
				padding:2px;
				margin-top:15px;
				margin-bottom:30px;
				border-bottom: 1px solid;
				border-color: #345877;
				}
			.calendar {
				float:right;
				font-weight:normal;
				background:#FFF;
				line-height:15px;
				margin-top: 0px;
				margin-bottom: 15px;
				margin-left: 15px;
				margin-right: 15px;
				border: 1px solid #345877;
				padding:10px;
				width:180px;
				}  
			.hCalendarMonthYearRow, .dCalendarMonthYearRow
				{ 
				font-family:verdana, arial, sans-serif;
				color:#345877;
				font-size:13px;
				font-weight:bold;
				text-align:left;
				line-height:14px;
				padding-bottom:4px;
				border-bottom: 1px solid #A0C2D6;
				}
			.hCalendarDayNameRow, .dCalendarDayNameRow
				{
				color:#345877;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:bold;
				line-height:14px;
				padding:0px;   
				}
			.hCalendarDayRow, .dCalendarDayRow
				{
				color:#345877;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:normal;
				line-height:14px;
				padding:0px;    
				}
			.hCalendarDayLinked, .dCalendarDayLinked
				{
				color:#FFF;
				background-color: #EEE;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:normal;
				line-height:14px;
				padding:0px;   
				}
			.hCalendarDayCurrent, .dCalendarDayCurrent
				{
				color: #FFFFFF;
				background-color: #A0C2D6;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:normal;
				line-height:14px;
				padding:0px;   
				}
			.radioMenuLinkFont {
				font-family:verdana, arial, sans-serif;
				color:#5385AA;
				font-size:10px;
				font-weight:bold;     
				}    
			.radioMenuLink {
				font-family:verdana, arial, sans-serif;
				color:#5385AA;
				font-size:10px;
				font-weight:bold;     
				} 
			a.radioMenuLink:link {
				color: #5385AA;
				text-decoration: none
				}  
			a.radioMenuLink:visited {
				color: #5385AA;
				text-decoration: none
				}
			a.radioMenuLink:hover {
				color: #000;
				text-decoration: underline
				}        
			.small { 
				font-family:verdana, arial, sans-serif;
				font-size:9px;
				line-height:11px;
				}
	#banner {
				font-family:verdana, arial, sans-serif;
				color:#FFF;
				font-size:28px;
				line-height: 11px;
				font-weight:bold;
				padding-left:20px;
				padding-right:20px;
				padding-top:40px;
				text-align: left;
				}
			.description {
				font-family:verdana, arial, sans-serif;
				font-style: italic;
				line-height: 11px;
				padding-left:20px;
				text-align: left;
				color:#FFF;
				font-size:12px;
				font-weight:bold; 
				}      
			</style>
		<script language="JavaScript" type="text">
			<!-- Begin hiding from older browsers
			//End hiding-->
			</script> 
		</head>

<script language="JavaScript" type="text/javascript"><!--
	var imageUrl = "http://radio.xmlstoragesystem.com/weblogStats/count.gif";
	var imageTag = "<img src=\"" + imageUrl + "?group=radio1&usernum=103807&referer=" + escape (document.referrer) + "\" height=\"1\" width=\"1\">";
	document.write (imageTag);
	//--></script>

<font size="+3">
<b><a href="http://radio.weblogs.com/0103807/" style="color:white; text-decoration:none">
The FuzzyBlog!</a></b></font>

<font class="description"><p><i>Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am.</i></p></font>

[Home](http://radio.weblogs.com/0103807/)|[FuzzyGroup](http://www.fuzzygroup.net/)|[About Us](http://www.fuzzygroup.net/about/)|[Our Services](http://www.fuzzygroup.net/services/)

  

Understanding The Owl Document Management Permissioning Model

Owl is a Open Source document management system (download link at the end of this document)&nbsp;written in PHP that my company, the FuzzyGroup, recently installed for a client.&nbsp; The client asked us for additional documentation on the permissioning model that Owl uses and rather than write it solely for this client, we thought it better to blog the information for permanent reference.&nbsp;&nbsp;To be specific, our client asked us:

> There are a lot of options to chose from under restrictions when uploading. Could you explain some of the terms you used. i.e. write? Does that mean you can write on the downloaded document? Could you please just clarify the options and which ones are best?
### Users, Groups and Permissions

The first thing to understand about Owl is that it has its own Users, Groups and Permissions.&nbsp; Although it is normally used on Unix systems in a hosted environment, it doesn't share Unix users, groups or permissions.&nbsp; Instead it has its own user and group model as follows:

- To use the system you must be a user although there is now (as of version 0.7) an anonymous user 
- Every user belongs to at least one group, the Primary group 
- Every user can also belong to additional groups, "Member Groups"

When you add a user to the system, you see a screen like this:

![](http://www.fuzzygroup.net/osblog/images/docs_owl_adduser.gif)

Groups are simply collections of users and they are non-hierarchical.&nbsp; In addition to groups that you create yourself there is also an Administrators group as well as an administrative user.&nbsp; Members of the Adminstrators group can override all permission options described below.

### Permissions and Uploading Files

All files within Owl are owned by either a user or a group depending on how the permissions are set when the file is uploaded.&nbsp; When the user uploads a file they see a screen similar to that below:

![](http://www.fuzzygroup.net/osblog/images/docs_owl_addfile.gif)

The drop down list "Permissions" defines what a user in the system can do once the file has been submitted.&nbsp; There are four basic concepts:

- 
Read -- the ability to access a document within the system.&nbsp; If you can't access a document then you can't do anything with it.
- 
Write -- the ability to update or change a document within the system such as uploading a new version, checking it out, checking in a new version, editing its properties such as title or keywords.
- 
Delete -- the ability to remove a document from the system.
- 
Download -- the ability to transfer the document to your local system.

The different permission options along with comments on their user are (the option shown to the user is the 1st bulletted item and the description is on the second line):

- 
Everyone can read/download&nbsp;  
i.e. unrestricted viewing access -- anyone with access to Owl can read or download this document  

- 
Everyone can read/write/download   
i.e. totally unrestricted access -- anyone with access to Owl can rad or download or change this document  

- 
The selected group can read/download   
i.e. anyone in the group can read it or download it  

- 
The selected group can read/write/download   
i.e. anyone in the group can read it or download it  

- 
Only you can read/download/write   
i.e. the document is private to you -- only you can read, change or download it   

- 
The selected group can read/write/download, No Delete   
i.e. anyone in the group can read it, change it or download it BUT they cannot delete it  

- 
Everyone can read/write/download, No Delete   
i.e. anyone can read it, change or update it and download it but NOT delete it  

- 
The selected group can read/write/download & everyone else can read   
i.e. anyone in the group can read, change or download it and anyone else with access to Owl can read it  

- 
The selected group can read/write/download (No Delete) and everyone elese can read   
i.e. anyone in the group can read it, change it or download it but they cannot delete it and anyone else with access to Owl can read it

### Which Permission Option is Best?

Answering the question of which permission option is "best" is unfortunately like answering "how high is up".&nbsp; The answer is, of course, it depends.&nbsp; However if we look at some examples it may be more clear:

- 
You are writing a report for work and you are the sole author.&nbsp; You are about to leave for vacation and you want to make your incomplete work to date available to coworkers.&nbsp; You intend to finish the project when you return.&nbsp; I would submit this as "The selected group can read/download".&nbsp; This gives people access to it but doesn't allow anyone else to change it in the system.  

- 
You are the boss of your workgroup and you have a new policy you want to make available but it isn't finished yet.&nbsp; Still you don't want it solely on your hard drive.&nbsp; I would submit this as Only you can read/download/write.&nbsp; This ties it to yourself and lets you access it from home but doesn't give access to anyone else.  
  

- 
You write&nbsp;a regular status report and need to check in a template for others on your team to use.&nbsp; I would submit this as Everyone can read/write/download, No Delete.&nbsp; This gives people the ability to update the template but not delete it.&nbsp; If others shouldn't be able to update the template then I'd use The selected group can read/download.&nbsp;&nbsp;

### Conclusion

The Owl Document Management system offers an easy to use web based document management system with a flexible and powerful set of user, group and permission options.&nbsp;

### Consulting

The FuzzyGroup offers web development, site creation, PHP consulting and implementation services centered around Open Source applications.&nbsp; Not only are we able to install and host the Owl Document Management System but also the Drupal portal / blogging engine, Squirrel Mail&nbsp;web based email complete with Spam Assassin spam detection, Web Calendar multi-user web based calendaring and more.&nbsp; See our site at [www.fuzzygroup.com](http://www.fuzzygroup.com) for more on our services.<font size="2"></font>

### More on Owl / Downloading Owl 

Owl can be downloaded from SourceForge [here](http://owl.sourceforge.net/).

| |

 This Page was last update: 4/6/2003; 3:14:02 AM  
 Copyright 2003 The FuzzyStuff  
 Theme Design by [Bryan Bell](http://www.bryanbell.com)  
  
[![Click here to visit the Radio UserLand website.](http://radio.weblogs.com/0103807/images/radioBadge.gif)](http://radio.userland.com/) [![Subscribe to "The FuzzyBlog!" in Radio UserLand.](http://radio.weblogs.com/0103807/images/xmlCoffeeCup.gif)](http://127.0.0.1:5335/system/pages/subscriptions?url=http://radio.weblogs.com/0103807/rss.xml "Click on the XML coffee mug to subscribe to "The FuzzyBlog!" in Radio UserLand.") [![Click to see the XML version of this web page.](http://radio.weblogs.com/0103807/images/xml.gif)](http://radio.weblogs.com/0103807/rss.xml "Click to see the XML version of this web page.") [![Click here to send an email to the editor of this weblog.](http://static.userland.com/shortcuts/images/qbullets/mailto.gif)](http://radio.xmlstoragesystem.com/rcsPublic/mailto?usernum=0103807 "Click here to send an email to the editor of this weblog.")  

