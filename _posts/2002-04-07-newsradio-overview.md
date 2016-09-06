---
layout: post
title: NewsRadio Overview
category: story.radio.weblogs.com
tags: ["blogging"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>NewsRadio Overview</title>
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
 | Last updated: 6/5/2002; 8:34:15 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>NewsRadio Overview</b></font>

## <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">An Overview of the "NewsRadio" Application</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">The more I use Radio, the more impressed I am with the thoughtfulness of its design.  However, and there's always a however, it seems that certain features need expansion to improve their overall usefulness.   Right now I'm thinking a lot about News.</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">The name "NewsRadio" is humorous, not intended to infringe trademarks, etc.  It just felt right as a development name.</font>

### <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">My Problems with the News Application</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">I really like the News aggregator in Radio.  However, I see some problems: </font>

- <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif"><strong>Lack of  persistence</strong>.  Its currently only a day at a time.  When I get deeply involved in a project, I often don't choose to focus on anything other than that project.  This means that I lose the advantage of quickly scanning over items in the news page and choosing what items to read -- they've scrolled off.  To me, persistence means storing not a day or a week but a month or year.  A historical trail is hugely useful for any type of knowledge worker.  Disc space is cheap.  User time spent wondering either what changed or user time spent looking for something they know they've read but can't find is expensive.</font>
- <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">User Interface Inflexibility.  I understand exactly why the News interface is designed as it is -- its right for Radio.  Still, its not what I want.  I'd like an outline of everything from Scripting or Matsuko, etc.  I'd also like to be able to sort it, etc.</font>
- <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Searching.  Nuff said.  </font>
- <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Dynamic formatting based on user navigation.  Like most people I suspect, I have subscribed to more than I actually read but the tabular interface makes it hard to distinguish.  The clear way to handle this is to implement a tracking redirector that logs what you've followed and then: </font>
  - <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Dynamically alters the formatting of future entries from that source to make it stand out more (internal note to self -- inverse of current Inbox Buddy turn spam gray approach)</font>
  - <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Take into account frequency of clicks to move items to the top.  Example, if you always read John Robb, move him to the top.</font>
  - <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Reduce noise words, apply Andrew's clustering algorithms (porter's stemming) and extract words and phrases based on links followed.  Build overall concept maps for what people are interested in.  Has to be totally in the background.</font>
  - <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Implement background level "correlation searches" to extract information from the news stream using dmoz as a source of correlation data.  Example, if you subscribe to news.com and you are someone at verity.com then anything from news.com that references someone in the same dmoz category is probably a competitor or partner of yours and this needs to be flagged.  (internal note -- use existing dmoz parsing code for this)</font>
- <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Communities of interest.  If you took a collection of weblogs and eliminated those that everyone reads (sorry Dave) then taking the 3 people that read weblog x, this is a potential community of interest that could be dynamically created to facilitate collaboration, knowledge management, etc.</font>

### <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Relational Schema</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Listed below are starting table schema for user and item tables.</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">create table newradio_items (<br>item_id INT(7) NOT NULL PRIMARY KEY AUTO_INCREMENT, <br>-- writer or router if I can figure it out<br>type INT(2),<br>source char(75),<br>sourceurl CHAR(75),<br>url CHAR(75),<br>domain CHAR(50),<br>date CHAR(10),<br>time CHAR(10),<br>title CHAR(75),<br>content TEXT,<br>)</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">-- Note, need to allow for this table defining pushes as well as pulls</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">create table newsradio_users (<br>user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, <br>username char(30) UNIQUE, <br>password char(25), <br>emailaddress char(75), <br>language CHAR(2),<br>hintquestion char(50), <br>hintanswer, char(50),<br>type int(2), <br>date datetime, <br>radiourl CHAR(75), <br>radiopassword CHAR(30)<br>)</font>

### <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Approach</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Hack together a workable prototype implementing persistence.  Get that running and then pull in functionality bit by bit.  Never go dark, never break it if possible.  Clearly I don't have all the time for this but ...</font>

### Revised DB Schema

-- items for the feed  
create table newradio\_items (  
&nbsp; item\_id INT(7) NOT NULL PRIMARY KEY AUTO\_INCREMENT,   
&nbsp; -- writer or router if I can figure it out, 0=writer,1=router,2=both  
&nbsp; type INT(2),  
&nbsp; source\_id INT,  
&nbsp; user\_id INT,  
&nbsp; itemurl CHAR(75),  
&nbsp; date CHAR(10),  
&nbsp; time CHAR(10),  
&nbsp; title CHAR(75),  
&nbsp; content TEXT,  
)

-- table definition for sources that you are subscribed to on a per user basis  
create table newradio\_sources (  
&nbsp; source\_id INT(7) NOT NULL PRIMARY KEY AUTO\_INCREMENT,   
&nbsp; user\_id INT,   
&nbsp; -- writer or router if I can figure it out.&nbsp; 0=writer, 1=router, 2=both  
&nbsp; type INT(2),  
&nbsp; source char(75),  
&nbsp; sourceurl CHAR(75),  
&nbsp; title CHAR(75),  
)

-- Tabel definition for tracking which items a user has followed   
create table newsradio\_itemtrackers (  
&nbsp; tracker\_id INT NOT NULL PRIMARY KEY AUTO\_INCREMENT,   
&nbsp; source\_id INT,  
&nbsp; item\_id INT,  
&nbsp; date DATETIME,  
)

&nbsp;

&nbsp;

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

