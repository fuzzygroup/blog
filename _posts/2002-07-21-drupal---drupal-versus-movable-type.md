---
layout: post
title: Drupal - Drupal Versus Movable Type
category: story.radio.weblogs.com
tags: ["drupal", "movable_type"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Drupal : Drupal Versus Movable Type</title>
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
 | Last updated: 7/21/2002; 7:22:36 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Drupal : Drupal Versus Movable Type</b></font>

<font size="2">
<p>Sorry for the slow reply but I've been stuck working all week.</p>
<p>&gt; Flexible data storage The system supports both MySQL and Berkeley DB for</p>
<p>&gt; your data storage, with plans to support for PostgreSQL and Oracle in the</p>
<p>&gt; future. Berkeley DB is available on almost all systems with Perl installed.</p>
<p>&gt; [SJ] Same for Drupal but no berkley support.</p>
<p>Drupal supports MySQL and does work on PostgreSQL but we need a person</p>
<p>to maintain the table definitions. We should be able to support other db</p>
<p>types (and we would like to), but we need someone who is skilled at</p>
<p>other dbs, has time and makes a commitment to support it.</p>
<p>&gt; XML-RPC API implements the Blogger and MetaWeblog XML-RPC APIs, allowing</p>
<p>&gt; you to use existing client tools (BlogBuddy, Bloggar, BlogApp, etc) to</p>
<p>&gt; manage your blog.</p>
<p>&gt; [SJ] Yup. I've used it and it's great.</p>
<p>Drupal supports the Blogger API as that is the one mostly used still.</p>
<p>Currently nobody has requested MetaWeblog API, but it shouldn't be a</p>
<p>big job to modify the blogger api module.</p>
<p>&gt; Extensible, library-driven code if you have experience programming in</p>
<p>&gt; Perl, you can write custom dynamic applications using the Movable Type</p>
<p>&gt; libraries.</p>
<p>&gt; [SJ] Same. Very nice module interface.</p>
<p>Drupal is written in PHP which is easier to master for most people. It</p>
<p>also has a very modular structure, so much so we can use it for other</p>
<p>purposes besides content.</p>
<p>&gt; Elegant, intuitive interface View some sample screenshots.</p>
<p>&gt; [SJ] Not as elegant. Needs some work.</p>
<p>It is being worked on and should be implemented in a future release.</p>
<p>There was a thread on the mailing list about this a while back and there</p>
<p>is some discussion on drupal.org as well.</p>
<p>&gt; TrackBack Movable Type's TrackBack system allows peer-to-peer</p>
<p>&gt; communication and conversations between weblogs. For more information on</p>
<p>&gt; TrackBack, see this document.</p>
<p>&gt; [SJ] Not sure. Kjartan? I know that Drupal has distributed authentication</p>
<p>&gt; that's pretty cool.</p>
<p>We have distributed authentication (supports jabber and yahoo logins as</p>
<p>well as some others). I've done some work on distributed posting which</p>
<p>will let you post content to multiple Drupal sites at once (or any site</p>
<p>that supports Blogger API.</p>
<p>&gt; Support The support forums are staffed by both a dedicated set of Movable</p>
<p>&gt; Type users and the creators of the software, allowing you fast access to</p>
<p>&gt; answers from expert users of the system.</p>
<p>&gt; [SJ] See this url for an example of Drupal community support:</p>
<p>&gt; <a href="http://radio.weblogs.com/0103807/documents/opensource_performance.pdf">http://radio.weblogs.com/0103807/documents/opensource_performance.pdf</a></p>
<p>All the core Drupal developers are active on the support list and forums.</p>
<p>Sometimes we prioritize development over support, but there are plenty</p>
<p>of other knowledgeable Drupal users helping out.</p>
<p>&gt; Import data allows you to import your entries and comments from other</p>
<p>&gt; content management systems (Blogger, GreyMatter, NewsPro), then manage those</p>
<p>&gt; posts through Movable Type.</p>
<p>&gt; [SJ] Not sure. I'll be implementing a radio import myself since I have to</p>
<p>&gt; do it for my own blog.</p>
<p>There is a PHP-Nuke script around somewhere, but we haven't made import</p>
<p>tools from other systems. We would welcome an effort to make it happen,</p>
<p>or able to give some used databases we can use to make a script to do</p>
<p>it. The biggest problem is that I don't want to setup blogs in other</p>
<p>systems and use them for a while so I have some data to convert.</p>
<p>&gt; Multiple output templates enables one-click publishing to multiple</p>
<p>&gt; destinations and formats: XML RSS headlines from your site, HTML indexes,</p>
<p>&gt; etc.</p>
<p>&gt; [SJ] The architecture is there and RSS support is integral. I think that</p>
<p>&gt; the UI needs some work to better support it.</p>
<p>We have RSS export and it would be very easy to make new modules to</p>
<p>support other forms of output. Just a matter of knowing a little PHP and</p>
<p>the output format desired.</p>
<p>&gt; Support for multiple weblogs/journals one Movable Type installation can</p>
<p>&gt; support as many blogs as you wish.</p>
<p>&gt; [SJ] Same.</p>
<p>We support it, but we have ideas on how to make it better.</p>
<p>&gt; Support for multiple authors register multiple authors, and set their</p>
<p>&gt; access levels using Movable Type's role-based permissions system.</p>
<p>&gt; [SJ] Same.</p>
<p>There should be some major changes to this in the future. There is some</p>
<p>talk about making some more advanced workflow as well so you could use</p>
<p>Drupal for an intranet site and have a dedicated editor etc.</p>
<p>&gt; Entry categorization group your entries into categories for your own</p>
<p>&gt; reference, for archiving purposes, and for display in your blog. You can</p>
<p>&gt; assign multiple categories to a single entry (for example, if an entry about</p>
<p>&gt; a book you read belongs in both "Reading List" and "Daily Activities").</p>
<p>&gt; [SJ] Full Taxonomy support, very, very powerful.</p>
<p>And it will just keep getting better. Currently we have two people</p>
<p>working putting all the categories into proper use and find some</p>
<p>exciting new ways to use it.</p>
<p>&gt; Search and replace save time by performing a global search and replace on</p>
<p>&gt; all of your entries; use the search feature to look up a particular entry.</p>
<p>&gt; [SJ] Search but not search and replace.</p>
<p>I don't really understand how this works but it would be easy to make a</p>
<p>module to do it.</p>
<p>&gt; Multiple archiving options create monthly, weekly, and daily archives of</p>
<p>&gt; your content; individual pages for each entry; and archives by category.</p>
<p>&gt; Archive file names are fully customizable, and you can associate multiple</p>
<p>&gt; archive templates with each archive type, allowing you to create, for</p>
<p>&gt; example, several versions of your archives: printer-friendly, PDA, normal,</p>
<p>&gt; etc.</p>
<p>&gt; [SJ] Not 100% sure yet.</p>
<p>We have some of it, but someone with some time should be able to make</p>
<p>modules to support it. We have a few people hanging around with nothing</p>
<p>much to code so if someone could spec up features like this I'm sure</p>
<p>someone with time will pick it up and implement it.</p>
<p>&gt; Built-in comment system allow your visitors to post comments on your</p>
<p>&gt; entries and engage in conversations. Movable Type supports comments either</p>
<p>&gt; inline in your blog, or in popup windows; it also allows you to selectively</p>
<p>&gt; exclude commenting on certain posts.</p>
<p>&gt; [SJ] Very nice comment model although popup support not currently there but</p>
<p>&gt; I think would be fairly trivial.</p>
<p>&gt; Comment IP Banning lock out unwanted visitors from commenting on your site</p>
<p>&gt; by banning their IP addresses.</p>
<p>&gt; [SJ] Not sure but simple to add if not there.</p>
<p>We have some banning on IPs, but I don't remember if it supports this.</p>
<p>I've never had a need to do it.</p>
<p>&gt; Email notification system maintain lists of users to whom notification</p>
<p>&gt; messages can be sent when you post a new entry.</p>
<p>&gt; [SJ] No but I'm planning on adding it anyway.</p>
<p>New stories and comments can be sent out regularly to users. Currently</p>
<p>you can't specify which type of content you want sent (other than nodes</p>
<p>or comments), but its planned for a future release.</p>
<p>&gt; Integration of file and image uploads upload files and images into any of</p>
<p>&gt; your blog directories, then seamlessly integrate them into new posts.</p>
<p>&gt; [SJ] Not at present. See next.</p>
<p>&gt; Thumbnail creation automatically create thumbnails from uploaded images.</p>
<p>&gt; [SJ] I have a photoblog module in the works for drupal.</p>
<p>We have an image module that supports uploads and categorization of</p>
<p>images, and they can easily be included in posts. Has a bunch of other</p>
<p>features as well, and there are plenty of things on the TODO list that</p>
<p>are being worked on.</p>
<p><a href="http://cvs.drupal.org/viewcvs.cgi/contributions/modules/image/?cvsroot=contrib">http://cvs.drupal.org/viewcvs.cgi/contributions/modules/image/?cvsroot=contrib</a></p>
<p>&gt; Bookmarklets post to your site from anywhere on the web, without entering</p>
<p>&gt; the Movable Type system.</p>
<p>&gt; [SJ] Cool idea. I'd be willing to do this definitely.</p>
<p>I have a bookmarklet that opens up my Drupal site and lets me post a new</p>
<p>blog entry with a reference and quote selected text.</p>
<p>&gt; Template-based site customization combine Movable Type's template tags</p>
<p>&gt; with standard HTML (or whatever markup language you choose) to build and</p>
<p>&gt; customize your site.</p>
<p>&gt; [SJ] There is a full template architecture in Drupal.</p>
<p>&gt; Pre-date or post-date entries Movable Type allows you to override an</p>
<p>&gt; entry's date stamp.</p>
<p>&gt; [SJ] Don't know.</p>
<p>You can change the date of entries. If you date it to the future it</p>
<p>won't show up till that date, date it to the past and it will end up in</p>
<p>the past.</p>
<p>&gt; Delete entries Movable Type allows for true entry deletion, allowing you</p>
<p>&gt; to clean out old or unwanted entries.</p>
<p>&gt; [SJ] I believe so.</p>
<p>We support complete deletion of content, or just to disable the post but</p>
<p>keep the data there.</p>
<p>&gt; Hold/Release status allow for content editorial and approval by setting</p>
<p>&gt; entries to "Hold", then let an editor approve by marking "Release", at which</p>
<p>&gt; point the entries will be published on your site.</p>
<p>&gt; [SJ] Yup.</p>
<p>&gt; Publicity and notification sends XML-RPC pings to weblogs.com and the</p>
<p>&gt; movabletype.org Recently Updated List.</p>
<p>&gt; [SJ] Yup (weblogs.com, don't know about movabletype.org but would be</p>
<p>&gt; trivial)</p>
<p>Drupal pings weblogs if enabled to do so.</p>
<p>&gt; Mail this entry allow visitors to your site to mail your entries to</p>
<p>&gt; friends, driving traffic to your site.</p>
<p>&gt; [SJ] Easy to add at the template level in about 5 lines of code.</p>
<p>Yup.</p>
<p>-- </p>
<p>Kjartan &lt;<a href="mailto:kjartan@drupal.org&amp;gt">kjartan@drupal.org&amp;gt</a>; (<a href="http://natrak.net/">http://natrak.net/</a>)</p>
<p>:: "Women are made to be loved, not understood." - Oscar Wilde</p>
<p> </p>
<p> </p></font>

  
  

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

