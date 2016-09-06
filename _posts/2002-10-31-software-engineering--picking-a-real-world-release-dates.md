---
layout: post
title: Software Engineering- Picking a Real World Release Dates
category: story.radio.weblogs.com
tags: []
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			The FuzzyBlog! : Software Engineering: Picking a Real World Release Dates
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

  

Software Engineering: Picking a Real World Release Dates

My Inbox Buddy partner and lead developer (Brian Giedt) and I recently had to choose the release date for the Inbox Buddy 1.0 version.&nbsp; We feel really good about this version.&nbsp; It's had a longer gestation period and more testing than I think **anything** we've ever done.&nbsp; And I honestly mean this.&nbsp; He and I have been running Inbox Buddy daily since at least March and perhaps longer.&nbsp; And we've been in public beta for more than a month now.&nbsp; And, ouf course, our current beta version is about to expire and stop working.&nbsp; So here were our options:

- Release the 1.0 today.&nbsp; This would mean rushing the final QA and rechecking most things from 5:00 pm yesterday through this morning. 
- Release in 2 weeks.&nbsp; It doesn't make sense to release a beta for just 1 week when the beta has a timed expiration date built in so we first discussed 2 weeks.

And you know what we chose?&nbsp; Release in 3 weeks.&nbsp; Here's the question I asked Brian that determined the answer:

> When does Giedt **version 3** arrive?

That's right.&nbsp; Brian has a new baby on the way.&nbsp; I view Brian as "Giedt version 1" and his lovely daughter Megan as "Giedt version 2" so the new baby can only be "Giedt version 3".&nbsp; According to Brian the baby is due in approximately 10 days.&nbsp; That's not work days of course but calendar days.&nbsp; Now this is the first baby for his wife Jackie so you have to figure that it will be late by at least a few days.&nbsp; This means that if we chose 2 weeks then Brian would be dealing with the inevitable release issues (something always crops up) when the new baby has just arrived.&nbsp; And 1 week is too damn close in case the baby is early / on time.&nbsp; And that's not good.&nbsp; Hence 3 weeks.&nbsp; And this lengthy series of events brings us to today's lesson.

### Software Engineering in the Real World

I've worked in big software companies, teeny tiny small software companies and worked with software companies all over the globe.&nbsp; And one thing remains constant: we all screw up release dates with the regularity of snow at the North Pole.&nbsp; I have to think that a big part of it is that managers fail to take into account one simple thing:

I'm a person first.&nbsp; A worker second.

Now don't get me wrong, I'm not saying anyone's not dedicated or a hard worker.&nbsp; All I'm saying is that the real world correctly takes precedence.&nbsp; If you have any kind of development schedule longer than 1 month or with more than 1 developer, you're going to hit one or more of these:

- Someone moves
- Someone gets sick
- Someone has a baby
- Someone gets married
- There is a major holiday
- Someone has an anniversary / birthday
- Someone's significant other breaks up with them
- Someone has to go to a wedding that is a long way away&nbsp;

People get sick, developers have babies, sh\*t happens.&nbsp; Whenever I plan a release schedule, I look at what I call the "Don't Shoot these 4 Guys" syndrome.&nbsp; For any software release, no matter what the team size, it always seems to come down to between 1 and 4 key people.&nbsp; And they aren't all developers.&nbsp; Examples:

- It could be the lead developer who's just plain brilliant and knows ever nook and cranny of the code
- It could be the QA guy who's like the energizer bunny -- he keeps testing and testing and testing
- It could be a product manager who's always around is just the heart and soul of the release
- It could be a junior developer who's trying really hard and just keeps at it 

The point is that any release is dependent not on any developer and not on every developer but on the **key** developers -- the people that you **cannot** shoot.&nbsp; If any of these people have the issues from above the release date will slip if you don't take them into account.&nbsp; It really is&nbsp;just that simple.&nbsp; We'd love to think that our engineering isn't affected by these kinds of things but that's just unrealistic.&nbsp; So here's I handle it when the proposed release date nears:

1. Figure out who the key people are if I don't already know.&nbsp;   
**Sidebar** : If you don't know this already then you have another problem.&nbsp; Do not pass Go, Do not collect $200 and hand in your managers license.  
  
2. Juxtapose the proposed release date against a calendar looking for holidays anywhere within 1 month of the proposed date.&nbsp; Since slipping is so damn common you have to always look into the future.  
  
3. Take each of the key people out for coffee or lunch gently probing their personal life along the dimensions above.  
  
4. Add any dates gleaned from step 3 to the calendar.&nbsp; Looking at the calendar events gives you a set of possible release dates.  
  
5. Make sure that the possible dates are viable with respect to the amount of engineering work going on.&nbsp; If you have to still implement a major feature and your only install date is a week away before a full month of dates that don't look good, that's bad.  
  
6. Hold a release meeting with all development staff, QA folk and related parties going over the calendar subject to any privacy issues from #3.  
  
7. Try and pick a release date that isn't too severely impacted by #3, #4 and #5.&nbsp; 

In step&nbsp;7 I try and pick a release date that isn't killed by the events in people's lives.&nbsp; Now you have to bear in mind that this is subject to management issues, customer promises and the like.&nbsp; Many times you'll have to plan a release date that is exactly when your lead developer has a baby.&nbsp; In that case you need to capture as much knowledge as possible, make sure you know how to do the build (AND HAVE TESTED IT), give them a laptop, a cell phone and a pager and hope for the best.&nbsp; It's obviously not perfect but sometimes it's the best you can do.

Realistic Shipping Dates.&nbsp; People are people first and workers second.&nbsp; What concepts !

| |

 This Page was last update: 4/6/2003; 3:13:56 AM  
 Copyright 2003 The FuzzyStuff  
 Theme Design by [Bryan Bell](http://www.bryanbell.com)  
  
[![Click here to visit the Radio UserLand website.](http://radio.weblogs.com/0103807/images/radioBadge.gif)](http://radio.userland.com/) [![Subscribe to "The FuzzyBlog!" in Radio UserLand.](http://radio.weblogs.com/0103807/images/xmlCoffeeCup.gif)](http://127.0.0.1:5335/system/pages/subscriptions?url=http://radio.weblogs.com/0103807/rss.xml "Click on the XML coffee mug to subscribe to "The FuzzyBlog!" in Radio UserLand.") [![Click to see the XML version of this web page.](http://radio.weblogs.com/0103807/images/xml.gif)](http://radio.weblogs.com/0103807/rss.xml "Click to see the XML version of this web page.") [![Click here to send an email to the editor of this weblog.](http://static.userland.com/shortcuts/images/qbullets/mailto.gif)](http://radio.xmlstoragesystem.com/rcsPublic/mailto?usernum=0103807 "Click here to send an email to the editor of this weblog.")  

