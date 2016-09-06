---
layout: post
title: Scotts Radio -- Radio Exposed or I Delve Deep Under the Hood of Radio
category: story.radio.weblogs.com
tags: ["blogging"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Scotts Radio :: Radio Exposed or I Delve Deep Under the Hood of Radio</title>
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
 | Last updated: 8/20/2002; 9:21:20 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Scotts Radio :: Radio Exposed or I Delve Deep Under the Hood of Radio</b></font>

# Radio UserLand Exposed

# <font size="3">When Things Break, You're Still Probably Ok<br>Version 0.9</font>

J. Scott Johnson edited by Guy K. Haas

* * *

![](http://fuzzygroup.net/writing/radiou1.jpg)

| 

<font size="2"><b>Cliveden House, England</b></font>

 | &nbsp; |

&nbsp;

<center>
<table id="AutoNumber1" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="3" width="552" border="1">
<tbody>
<tr>
<td width="542" bgcolor="#c0c0c0">
<p align="center">PREFACE</p>
</td>
</tr>
<tr>
<td width="542">
<font size="2">This document was written after my Radio weblog up and ate itself one fine Sunday morning.  I recovered everything after some interesting excursions into Radio and at least one prayer session while facing towards Silicon Valley.</font> 
<p align="center"><font size="2">Please send suggestions, comments and flames to <a href="mailto:sjohnson@fuzzygroup.com"></a><a href="mailto:sjohnson@fuzzygroup.com">sjohnson@fuzzygroup.com</a>.</font></p>
</td>
</tr>
</tbody>
</table>
</center>
### &nbsp;

It should be noted that I'm not writing this because these materials don't exist elsewhere.&nbsp; I don't know if they exist elsewhere but I don't think that there is this comprehensive a treatment of [Radio Exposed](http://radio.weblogs.com/0103807/2002/04/15.html#a55) and I hope it's useful to someone other than myself.

[Scott](http://www.fuzzygroup.com/radioworks/)

### Table of Contents

The following topics are covered in this document:&nbsp;

- **DISCLAIMER:** If you are a Mac user, read this.
- When Your Data Goes Away or "Don't Worry Be Happy"
- Understanding How Radio Works
  - Looking Back at My "When" Error
  - What is a .root File? 
- How Radio Produces HTML
- What Directories Does Radio Store Content In?
- How I Fixed the "When" Problem and Rescued my Weblog
- Tools that Made this Possible
- The Original Version of This
- Thanks
- Distribution of this Document 

### When Your Data Goes Away or Don't Worry Be Happy

This document was written after two to three hours of hacking away at Radio after one Sunday morning, when, GULP, my weblog disappeared.&nbsp; And, I don't mean just locally, I mean on radio.weblogs.com.&nbsp; I add "Don't Worry Be Happy" because there is a happy ending -- I got everything back.

Anyway, here's what happened.

- I posted my last entry Saturday night before going to bed. 
- I went to post an entry Sunday morning and I had the interesting experience of clicking the post and publish button only to have "Poof" -- it just went away.&nbsp; I've seen this before as documented here so I wasn't too worried. 
- I pasted the entry back in and tried again (note -- I always, always, always do a CTRL+A, CTRL+C i.e. Select All, Copy before posting and so should you, cheap insurance). 
- Same thing.&nbsp; Nothing.&nbsp; Sigh.&nbsp; "What now?" I wondered.&nbsp; I restarted Radio and everything seemed ok.&nbsp; So I got my posting in.&nbsp; 
- I went away, did some other stuff, went back to my weblog and saw this:   
  
[Macro error: Can't evaluate the expression because the name "when" hasn't been defined.]  
&nbsp; 
- Uh Oh.&nbsp; "That can't be good" went through my somewhat sluggish brain.&nbsp; I also noticed that all of the posts on my desktop website home page were gone.&nbsp; I've seen references to this kind of thing periodically in the support forums so I figured (silly, stupid me) that doing a Publish Entire Website would fix this.&nbsp; 
- I went into the full Radio client software (this is the non-browser version of Radio as [described here](http://fuzzygroup.net/writing/radiouserland_part01.htm)) and did a Publish Entire Website.&nbsp; At this point I had just done the equivalent of jumping off a bridge but I just hadn't hit the bottom yet and I wasn't even aware of it. 
- I checked the desktop website home page.&nbsp; Same thing.&nbsp; Sigh. 
- I copied everything in program filesradio userland to program filesradio userland backup and re-installed Radio figuring that this was some kind of system level glitch. 
- Same thing.&nbsp; Sigh.&nbsp; What now I wondered? 
- I inadvertently clicked on the Home link to my public site on radio.weblogs.com and saw that, **horrors** , my weblog was gone!&nbsp; Or, as I like to describe it, _ **Radio Ate My Weblog.&nbsp; Tasty.&nbsp; Burp.** _ 

At this point I realized that I had a real problem and started to think (or panic).&nbsp;

### Understanding How Radio Works

The first thing that I did was search my backup directory for some keywords I knew that I had used in my weblog entries.&nbsp; This confirmed that, yes, I did still have a local copy of my data.&nbsp; Knowing that I had a copy of my data let me breathe easier.&nbsp; Even if I had to reformat it or change it somehow, I figured that I'd at least still have the raw text.&nbsp; Still, I didn't want to do that (lazy).&nbsp; I figured that there had to be a way to restore my Radio installation.

#### Looking Back at My "when" Error

The first thing that I did was think about the very first error I saw or:

> [Macro error: Can't evaluate the expression because the name "when" hasn't been defined.]  
> &nbsp;

Knowing that a weblog is chronological in nature, I came to the initial conclusion:

> "when" must be some kind of meta level object that is used to define a date (hey, it's \_when\_) and then when I published the entire website, because it couldn't decide what date was going on, it didn't insert ANY DATA into each day's page template, thus overwriting each weblog entry.

From this I decided that there must be some [Table of Contents](http://radio.weblogs.com/0103807/stories/2002/05/24/tableOfContents.html) somewhere that defines "when".&nbsp; My guess was that "when" must have gotten broken somehow and if I could only fix it, I would be back in business.&nbsp; This brought me to the mysterious and unusual .root files.

#### What is a .root File?

When Radio is installed, several files with the extension of .root are installed.&nbsp; These are:

- program filesradio userlandradio.root 
- program filesradio userlanddata fileshotlistData.root 
- program filesradio userlanddata filesmanilaBloggerBridgeData.root 
- program filesradio userlanddata filesweblogData.root 
- program filesradio userlanddata filesaggregatorData.root 
- program filesradio userlanddata filesweblogsComData.root 
- program filesradio userlandtoolsmanilaBloggerBridge.root 
- program filesradio userlandtoolsmyPictures.root 
- program filesradio userlandtoolsstaticSites.root 
- program filesradio userlandtoolswhoIs.root 

A .root file is really a small database, specifically an object database.&nbsp; These .root files can contain virtually anything that Radio deals with including scripts, macros and, tada, the text of every post you make.&nbsp; Here is what each Radio.root file does:

- radio.root -- The master .root file.&nbsp; This file actually defines Radio itself.&nbsp; Be very careful with it. 
- data fileshotlistData.root - This is information about the 100 most subscribed to weblogs.&nbsp; It's automatically updated. 
- data filesmanilaBloggerBridgeData.root - Data from when Manila integrates with Blogger. 
- **data filesweblogData.root - This is the magic file.&nbsp; It contains every single post you ever make!**
- data filesaggregatorData.root - Your news aggregator. 
- data filesweblogsComData.root - Data from weblogs.com. 
- toolsmanilaBloggerBridge.root - The actual manila-to-Blogger bridge. 
- toolsmyPictures.root - The Radio myPictures tool. 
- toolsstaticSites.root - The staticSites tool. 
- toolswhoIs.root - The whoIs Tool. 

I figured out that weblogData.root was the right file by a couple of things, specifically:

- It was updated today so it was logical to be the culprit 
- The filename seemed right. 
- I found some hints in different discussion forums that it was right.&nbsp; Here is the [cross reference](http://radio.userland.com/discuss/msgReader$11359?mode=topic&y=2002&m=3&d=5). 

Before I go into how I fixed this, it's worth talking about how Radio produces HTML, and about its directory structure.

### How Radio Produces HTML

If you have ever looked inside the wwwyearmonthday directory, you have probably seen files named "01.txt", "02.txt" and so on.&nbsp; These files represent your weblog posts.&nbsp; Here is what one of these contains:

> #flHomePage true  
> #flArchivePage true  
> #archiveDate "2002/04/13"  
> \<%radio.macros.viewWeblog ()%\>  
> &nbsp;

This is basically telling Radio to view the weblog for 04/13/2002.&nbsp; Remember, I said "represent", not that it was the post.&nbsp; In essence Radio reads this file and then fills in the content when it [upstreams](http://fuzzygroup.net/writing/radiouserland_faq.htm#glossary::upstreaming) your weblog posting to the server.&nbsp; Looking at this file is one of the things that convinced me that my data must exist somewhere else.&nbsp; The question was where.

### What Directories Does Radio Store Content In?

At this point, you will probably be relieved to know that Radio automatically makes an archive of your content in the directory:  
  
program filesRadio UserLandbackupsweblogArchive

This contains an XML-tagged archive of all of your weblog entries.&nbsp; This includes all posts.&nbsp;&nbsp;

In the directory:&nbsp;  
  
program filesRadio UserLandbackupsrendering

there is a backup of all posts, stories and categories in HTML format.&nbsp; Note that even though this exists when you use the Publish Entire Website command from within Radio, it can get overwritten when Radio regenerates your HTML.&nbsp; Here's a tip: Periodically Zip the whole directory tree.&nbsp; Disk space is cheap and your weblog is valuable.&nbsp; If you want to go a step further, download SecondCopy from [www.secondcopy.com](http://www.secondcopy.com/) which can automatically Zip directories for you.&nbsp;

Here is a UserLand article on [Radio's directory structure](http://radio.userland.com/stories/storyReader$7039).

### How I Fixed the "When" Problem and Rescued my Weblog
<center>
<table id="AutoNumber5" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="3" width="552" border="1">
<tbody>
<tr>
<td width="542" bgcolor="#ff0000">
<p align="center"><b>WARNING</b></p>
</td>
</tr>
<tr>
<td width="542">Make a backup copy of webLogData.root before doing this.  It can get mucked up when you start fiddling with it and you need to be bloody well careful!  You've been warned.  </td>
</tr>
</tbody>
</table>
</center>

This is what you have all been waiting for.&nbsp; I went into the [full version](http://fuzzygroup.net/writing/radiouserland_part01.htm) of Radio and selected from the Window command to go to webLogData.root.&nbsp; This looks like this:&nbsp;

![](http://fuzzygroup.net/writing/images/exposedradiou4.jpg)

<center></center>

Here's what you see at first.&nbsp; If you don't see this then go to the Outline menu and select CollapseEverything.

![](http://fuzzygroup.net/writing/images/exposedradiou12.jpg)

Double click the triangle and you should get this:&nbsp;

![](http://fuzzygroup.net/writing/images/exposedradiou13.jpg)

Do it again but this time on Posts to get:&nbsp;

![](http://fuzzygroup.net/writing/images/exposedradiou14.jpg)

Now do it on an individual post.&nbsp; You should get something like this:&nbsp;

![](http://fuzzygroup.net/writing/images/exposedradiou15.jpg)

Notice the **"when"** field in the picture above.&nbsp; This indicates when the post was published.&nbsp; Somehow, and I don't really understand how, the **"when"** value for three last posts had gotten set to "" (i.e. nothing).&nbsp; All I need to do to get my weblog back was this:&nbsp;

1. 

Right click on each post with no value in the **"when"** field and click Cut.

2. 

Save the webLogData.root file with the Save command on the File menu.

3. 

Use Radio \> Publish \> Entire Website as shown below:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

![](http://fuzzygroup.net/writing/images/exposedradiou16.jpg)

I checked my [weblog](http://radio.weblogs.com/0103807/) and, voila, like magic, all my posts were restored.&nbsp; There now, that wasn't so hard, was it?

### What Archives Can I Recover From if I Can't Solve this Problem?

In the event that you have this or another problem and cannot recover your webLogData.root file, Radio helpfully archives every single weblog posting that you make to [.XML](http://fuzzygroup.net/writing/radiouserland_faq.htm#xml) files on your local hard drive.&nbsp; These files have an appearance like that shown below:

**<font face="Courier New" color="#ff0000"> </font>** <font color="#0000ff"><span class="m">&lt;?</span><span class="pi">xml version="1.0" </span><span class="m">?&gt;</span></font>

[**<font face="Courier New" color="#ff0000">-</font>**](http://fuzzygroup.net/writing/radiouserland_radioexposed.htm#) <font color="#0000ff">&lt;</font><font color="#990000">table name</font><font color="#0000ff">="</font> **00000005** <font color="#0000ff">"&gt;</font>

**<font face="Courier New" color="#ff0000"> </font>** <font color="#0000ff">&lt;</font><font color="#990000">boolean</font> <font color="#990000">name</font><font color="#0000ff">="</font> **flNotOnHomePage** <font color="#0000ff">"</font><font color="#990000"> value</font><font color="#0000ff">="</font> **false** <font color="#0000ff">" /&gt;</font>

**<font face="Courier New" color="#ff0000"> </font>** <font color="#0000ff">&lt;</font><font color="#990000">string</font> <font color="#990000">name</font><font color="#0000ff">="</font> **text** <font color="#0000ff">"</font><font color="#990000"> value</font><font color="#0000ff">="</font> **\<H3\>\<FONT face=Verdana,Geneva,Arial,Helvetica,Sans-Serif\>A Fleeting Glimpse of Fame\</FONT\>\</H3\> \<P\>Interesting.&nbsp; \<A href="http://www.scripting.com/"\>Dave Winer\</A\> just linked to me.&nbsp; Hmmm...&nbsp; I guess I have to write some more about Radio.&nbsp; It really is a fascinating product and I am starting to understand it more.&nbsp; \</P\> \<P\>&nbsp;\</P\>** <font color="#0000ff">" /&gt;</font>

**<font face="Courier New" color="#ff0000"> </font>** <font color="#0000ff">&lt;</font><font color="#990000">string</font> <font color="#990000">name</font><font color="#0000ff">="</font> **title** <font color="#0000ff">"</font><font color="#990000"> value</font><font color="#0000ff">="</font> **A Fleeting Glimpse of Fame** <font color="#0000ff">" /&gt;</font>

**<font face="Courier New" color="#ff0000"> </font>** <font color="#0000ff">&lt;</font><font color="#990000">date</font> <font color="#990000">name</font><font color="#0000ff">="</font> **when** <font color="#0000ff">"</font><font color="#990000"> value</font><font color="#0000ff">="</font> **Sun, 31 Mar 2002 20:27:13 GMT** <font color="#0000ff">" /&gt;</font>

**<font face="Courier New" color="#ff0000"> </font>** <font color="#0000ff">&lt;/</font><font color="#990000">table</font><font color="#0000ff">&gt;</font>

These archives are stored in the directory: Program FilesRadio UserLandbackupsweblogArchive in the "posts" and "categories" subdirectories.

Here is the Radio [documentation](http://radio.userland.com/discuss/msgReader$6997?mode=day) on its archiving.&nbsp; Here is some more [information](http://frontier.userland.com/stories/storyReader$8130).&nbsp; There is also more information on this [earlier in this article](http://fuzzygroup.net/writing/radiouserland_radioexposed.htm#whatdirectoriesdoesradiostorecontentin).

### Tools that Made this Possible

Learning all this about Radio would not have been possible without the following resources:

- 

The Radio Discussion forums at [http://radio.userland.com/discuss/](http://radio.userland.com/discuss/)

- 

My own Google-based Radio UserLand search tool at [http://www.fuzzygroup.com/radiosearch/](http://www.fuzzygroup.com/radiosearch/)

### The Original Version of This

This discovery and analysis process can be seen from the beginning at:

> [http://radio.userland.com/discuss/msgReader$13330#13341](http://radio.userland.com/discuss/msgReader$13330#13341)

These are a series of discussion group postings that I made looking for help.&nbsp;&nbsp;

### Thanks

My sincere thanks are extended to Lawrence Lee of UserLand who gave me exactly the right answer which I got after I had fixed the problem only because of the East Coast - West Coast time difference.&nbsp; If I'd been on the West Coast, Lawrence would have had me up and running in no time.

<center>
<h3 align="left">
<a name="distribution"></a>Distribution of this Document</h3>
<h4 align="left">
<a name="distribution::overview"></a>See Below.</h4>
<h3>If You're a Mac User</h3>
</center>

**DISCLAIMER:** This document, while not Macintosh hostile, is written from the perspective of a Windows user and the examples reflect this.&nbsp; Please direct the obligatory violent, hostile platform flames to [sjohnson@fuzzygroup.com](mailto:sjohnson@fuzzygroup.com).&nbsp;&nbsp;  
  
**Note:** I also have an iMac.

#### Copyright

<font size="2">Copyright (c) 2002, J. Scott Johnson. Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.1 or any later version published by the Free Software Foundation; with no Invariant Sections being, with no Front-Cover Texts, and with no Back-Cover Texts. A copy of the license is included in the section entitled "</font><font size="2">Appendix 1 - Terms of Use</font><font size="2">". </font>

<font size="2"><strong>Note:</strong> I'm new to writing a Free Documentation statement and the above might not be perfect. </font>

<script src="http://radiocomments.userland.com/comments?u=103807&amp;c=counts" type="text/javascript"></script>[comment&nbsp;[<script type="text/javascript" language="JavaScript">commentCounter ("stories/2002/08/20/scottsRadioRadioExposedOrIDelveDeepUnderTheHoodOfRadio")</script>]](http://radiocomments.userland.com/comments?u=103807&p=stories%2F2002%2F08%2F20%2FscottsRadioRadioExposedOrIDelveDeepUnderTheHoodOfRadio&link=http%3A%2F%2Fradio.weblogs.com%2F0103807%2Fstories%2F2002%2F08%2F20%2FscottsRadioRadioExposedOrIDelveDeepUnderTheHoodOfRadio.html "Click here to comment on this page.")

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

