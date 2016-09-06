---
layout: post
title: PHP Free Space Monitor Code
category: story.radio.weblogs.com
tags: ["php"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			The FuzzyBlog! : PHP Free Space Monitor Code
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

  

PHP Free Space Monitor Code

\<?php  
# script to get the amount of free space with df -h and email it  
# to me daily

include "../z/class.phpmailer.php";

&nbsp; $freespace = mysystem("df -h");  
&nbsp; $fortune = mysystem ("/usr/games/fortune");

&nbsp; $email = "[scott@fuzzygroup.com](mailto:scott@fuzzygroup.com)";  
&nbsp; [//setup](//setup) the email object & params  
&nbsp; $mail = new phpmailer();  
&nbsp; $mail-\>IsMail();  
&nbsp; $mail-\>From = "[webmaster@fuzzygroup.com](mailto:webmaster@fuzzygroup.com)";  
&nbsp; $mail-\>FromName = "Free Space Mailer";  
&nbsp; $mail-\>AddAddress("$email");  
&nbsp; $mail-\>AddReplyTo("[scott@fuzzygroup.com](mailto:scott@fuzzygroup.com)");  
&nbsp; $mail-\>IsHTML(false);  
&nbsp; $mail-\>Subject = "Free Space On FuzzyGroup Server";  
&nbsp; $mail-\>Body&nbsp;&nbsp;&nbsp; = $freespace . "\n\n\n\n" . $fortune;

&nbsp; if(!$mail-\>Send())  
&nbsp; {  
&nbsp;&nbsp;&nbsp; echo "Error -- Can't Email User Info\<p\>";  
&nbsp;&nbsp;&nbsp; echo "Mailer Error: " . $mail-\>ErrorInfo;  
&nbsp;&nbsp;&nbsp; exit;  
&nbsp; }  
&nbsp; else {  
&nbsp;&nbsp;&nbsp; print "\<pre\>$freespace \<BR\>\<BR\>$fortune\</PRE\>";  
&nbsp;&nbsp;&nbsp; exit;  
&nbsp; }

function mysystem($command) {  
&nbsp;if (!($p=popen("($command)2\>&1","r"))) {  
&nbsp; return 126;  
&nbsp;}

&nbsp;while (!feof($p)) {  
&nbsp; $line=fgets($p,1000);  
&nbsp;&nbsp; $out .= $line;  
&nbsp;}  
&nbsp;pclose($p);  
&nbsp;return $out;  
}

?\>

| |

 This Page was last update: 4/16/2003; 10:20:40 AM  
 Copyright 2003 The FuzzyStuff  
 Theme Design by [Bryan Bell](http://www.bryanbell.com)  
  
[![Click here to visit the Radio UserLand website.](http://radio.weblogs.com/0103807/images/radioBadge.gif)](http://radio.userland.com/) [![Subscribe to "The FuzzyBlog!" in Radio UserLand.](http://radio.weblogs.com/0103807/images/xmlCoffeeCup.gif)](http://127.0.0.1:5335/system/pages/subscriptions?url=http://radio.weblogs.com/0103807/rss.xml "Click on the XML coffee mug to subscribe to "The FuzzyBlog!" in Radio UserLand.") [![Click to see the XML version of this web page.](http://radio.weblogs.com/0103807/images/xml.gif)](http://radio.weblogs.com/0103807/rss.xml "Click to see the XML version of this web page.") [![Click here to send an email to the editor of this weblog.](http://static.userland.com/shortcuts/images/qbullets/mailto.gif)](http://radio.xmlstoragesystem.com/rcsPublic/mailto?usernum=0103807 "Click here to send an email to the editor of this weblog.")  

