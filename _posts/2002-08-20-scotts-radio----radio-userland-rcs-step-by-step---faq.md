---
layout: post
title: Scotts Radio -- Radio UserLand RCS Step by Step / FAQ
category: story.radio.weblogs.com
tags: ["blogging"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Scotts Radio :: Radio UserLand RCS Step by Step / FAQ</title>
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
 | Last updated: 8/20/2002; 9:19:13 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Scotts Radio :: Radio UserLand RCS Step by Step / FAQ</b></font>

# Radio UserLand RCS Step by Step / FAQ  
version 0.9

J. Scott Johnson, Guy K. Haas

* * *

![](http://fuzzygroup.net/writing/radiou1.jpg)

| 

<font size="2"><b><a name="cliveden"></a>Cliveden House, England</b></font>

 | &nbsp; |

&nbsp;

<center>
<table id="AutoNumber1" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="3" width="422" border="1">
<tbody>
<tr>
<td width="412" bgcolor="#c0c0c0">
<p align="center"><b>IMPORTANT</b></p>
</td>
</tr>
<tr>
<td width="412">
<font size="2">This is a draft document.  Its a work in progress, it isn't complete.  I'm still working on it.  </font>
<p><font size="2">Please send suggestions, comments and flames to <a href="mailto:sjohnson@fuzzygroup.com"></a><a href="mailto:sjohnson@fuzzygroup.com">sjohnson@fuzzygroup.com</a>.  The Table of contents lists the intended content.  If an item on the Table of Contents isn't linked then its just not written yet. </font></p>
</td>
</tr>
</tbody>
</table>
</center>
### &nbsp;

**DISCLAIMER:** This document, while not Macintosh hostile, is written from the perspective of a Windows user and the examples reflect this.&nbsp; Please direct the obligatory violent, hostile platform flames to [sjohnson@fuzzygroup.com](mailto:sjohnson@fuzzygroup.com).&nbsp;&nbsp;Note: I also have an iMac too.

### Table of Contents

The following topics are covered in this document:&nbsp;

- Understanding RCS -- What is It?
  - Overview
  - Who Are You?&nbsp; Why Do You Care?
  - What Else Should I Read? 
  - Licensing: How many copies do I need to buy? 
- Installation
  - Overview
  - Installation Steps
  - Configuration
  - IMPORTANT: Put Radio in Startup! 
- How to Build an Extranet with your Cable Modem, Radio and RCS
- Day to Day Use
  - Overview
  - Platform Issues: Macs and PCs
  - How do I create my Weblog?
  - Letting Others Create Their Own Weblog
  - Using Categories to Segment Your Weblog for Different Types of Readers
  - Using Stories for Long Documents
  - Adding Pictures to Your Radio Documents
  - Applying News within the Firewall
  - Publishing Office Documents, Word, Etc through Radio
  - Using a Weblog as a Daily Knowledge Management Tool
  - Using a Weblog to Communicate with Clients
  - How do I maintain a public weblog at radio.weblogs.com and a weblog on my copy of RCS? 
- Maintenance and Support
  - Overview
  - How do I get Technical Support?
  - Are there Additional Support Options?
  - How do I Back it Up?
  - Can I Get a List of Usernums?
  - Understanding Events
  - What Events are there?
  - What is this Nightly Update?
  - What Type of Reporting is in RCS? 
- Restricting Radio / RCS to within Your Firewall
  - 

Setting Radio and RCS Prefs

  - 

Modifying Radio.root, RadioCommunityServer.Root and RadioCommunityServerData.Root

- [Term Glossary](http://fuzzygroup.net/writing/radiouserland_faq.htm#glossary)
- Credits
- Distribution of this Document
  - Can I distribute this? 

### What is It?

#### Overview

Radio RCS is an add-on product for the Radio UserLand weblogging system.&nbsp; It adds the following features:&nbsp;

- Local operation within your own firewall 
- Operate either as a way to create a single weblog read within your organization or as a tool to support multiple end user weblogs within your organization 
- Allow a single desktop machine to support multiple end user weblogs 

At its core, Radio produces a regularly updated web page, a weblog.&nbsp; Weblogs can cover any topic imaginable and do.&nbsp; Take a look at [www.weblogs.com](http://www.weblogs.com/) for more.

If you already are a Radio user then the best way to think of RCS is "radio.weblogs.com/myownsetofusernums" within your own firewall.&nbsp; In other words, with RCS,&nbsp;

When you download RCS, if you aren't a long term Radio user, your first reaction may be "Huh!"&nbsp; or "Where's the actual program?"&nbsp; RCS is contained entirely within a single file, Radio.root, which you install by downloading and copying to your Tools folder.&nbsp; Its not a normal .EXE program or Windows service which is what you were probably expecting.&nbsp; Here's why: .root files **are programs** to Radio.&nbsp; Inside Radio are, at a minimum, the following components:

- A sophisticated scripting language called UserTalk 
- An object database 
- A scheduler 
- A network engine that speaks TCP/IP, HTTP, FTP, SMTP, RSS and other Internet protocols&nbsp; 

RCS is an application that is built on top of Radio as a native "radio application".&nbsp; It is actually written in UserTalk and does its magic through Radio's scheduler and network engine.&nbsp;

#### Who are you?&nbsp; Why do you care?

I'm an avid weblogger, programmer and I offer commercial services for Radio / RCS including comprehensive technical support.&nbsp; I also spent 3 1/2 years designing and implementing enterprise Knowledge Management software so I know Knowledge Management like the back of my hand.&nbsp; Weblogs and Radio/RCS are a next generation knowledge capture tool and hugely interesting to me.&nbsp; My KM software was from Dataware, a company which is now defunct, so I have archived the product literature [here](http://fuzzygroup.net/dataware/).

#### What Else Should I Read?

If you are a new Radio user, there is **a lot** to read.&nbsp; Here are some places to start:

- 

#### Licensing: How Many Copies Do I Need to Buy?

At the present time, RCS is actually free.&nbsp; UserLand has released it to spread the Radio word and drive weblog based Knowledge Management within the firewall.&nbsp; So, the question is not, how many copies of RCS you need to buy, but how many copies of Radio you need to but.&nbsp; That's simple: one per weblog author.&nbsp; If you are running RCS to disseminate a single internal weblog then you need only one copy of Radio.&nbsp; If you start having additional internal weblogs (say, one per project team, written by the team lead) then you need n copies of radio where n is number of internal weblogs.

NOTE: I'm am asking UserLand to review this answer specifically to make sure that it is correct.&nbsp;

### Installation

#### Overview

The first step is to decide where RCS is going to run.&nbsp; RCS is actually a server product that can operate on your desktop as well.&nbsp; For example, you could install RCS on a dedicated server or on your desktop machine.&nbsp; Either way will work but for a server application, you want it always available.&nbsp; If your desktop is frequently rebooted then this would be bad since it would make your weblog unavailable.

#### Installation Steps

Here are the basic installation steps.

1. Install Radio first.&nbsp; Even if you aren't weblogging on that machine (for example, you are installing RCS on a server machine), Radio needs to be there. 
2. Download RCS from UserLand.&nbsp; Save it into the program filesRadio UserLandTools directory on the machine where you want to install it. 
3. Go into Radio ON THAT MACHINE and select the Tools link from the command bar. 
<center>
<table id="AutoNumber5" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="3" width="422" border="1">
<tbody>
<tr>
<td width="412" bgcolor="#c0c0c0">
<p align="center">Example: Radio on a Server</p>
</td>
</tr>
<tr>
<td width="412">
<font size="2">Let's say that you have Radio on your desktop and Radio / RCS on a server.  What you want to do is go that machine's IP address or network name and then into Radio.   </font>
<p align="center"><font size="2">Further Details:</font></p>
<p><font size="2">Your machine is <a href="http://192.168.1.43/">http://192.168.1.43/</a> and your server is <a href="http://192.168.1.90/">http://192.168.1.90/</a> then you want to go to: <a href="http://192.168.1.90:5335/">http://192.168.1.90:5335/</a> or <a href="http://192.168.1.90/">http://192.168.1.90/</a> to configure RCS via the Tools link.  The reason that two links are stated is that the port Radio runs on can be configured differently.  These are the two normal options.   </font></p>
</td>
</tr>
</tbody>
</table>
</center>&nbsp; 

Further configuration is covered below under "Configuration".&nbsp; This can be a bit complicated so it has its own section.

#### Configuration
Guy, I need some help here.&nbsp; Do you still have your notes? 
#### IMPORTANT: Put Radio in Startup!

Whether or not you run Radio on your machine or on a server, you want to definitely put Radio in that machine's Startup folder!&nbsp; If you don't and that machine is rebooted then your weblog will be unavailable.&nbsp;

### How to Build an Extranet with your Cable Modem, Radio and RCS

### Getting Started

&nbsp;

### Day to Day Use

#### Overview

#### Platform Issues: Macs and PCs

#### How do I create my Weblog?

A good overview of this is [here](http://radio.userland.com/weblogHowTo).

#### Letting Others Create Their Own Weblog

#### Using Categories to Segment Your Application

#### Using Stories for Long Documents

#### Adding Pictures to Your Radio Documents

#### Applying News

#### Publishing Office Documents, Word, Etc through Radio

#### Using a Weblog as a Daily Knowledge Management Tool

#### Using a Weblog to Communicate with Clients

#### How do I maintain a public weblog at radio.weblogs.com and a weblog on my copy of RCS?

The answer here is pretty simple: Two separate computers.&nbsp; I'm not actually joking here.&nbsp; Radio simply isn't to produce two separate weblogs targeted at different destinations.&nbsp; Yes, you could, perhaps, make it work.&nbsp; I wouldn't recommend it.&nbsp; My solution was to use my desktop to run the copy of Radio / RCS that maintains my client weblogs and to use my laptop to run the copy of Radio that I use for radio.weblogs.com.

**NOTE:** I can still do all my authoring from one machine, my desktop with the nice keyboard, by just going to the IP address of whichever machine I want to publish from.&nbsp;

### Maintenance / Support

#### Overview

When you are publishing a personal weblog, maintenance isn't a big deal.&nbsp; If you are doing it internally, it's a huge issue.&nbsp; In this section, I have outlined most of the major maintenance issues from technical support through backups and event logging..&nbsp;

#### How do I get technical support?&nbsp;&nbsp;

Support on Radio from UserLand is available through their discussion forum, [http://radio.userland.com/discuss/](http://radio.userland.com/discuss/).&nbsp; No phone support or additional support plans are currently available.

#### Are there additional support options available?&nbsp;&nbsp;

As a service of The Radio Works, I offer extended support plans for internal Radio / RCS use.&nbsp; Please see the home page for [The Radio Works](http://fuzzygroup.net/radioworks/).

#### How do I back it up?

To back up Radio /RCS, you want to regularly backup the following directories and files:&nbsp;

- program filesRadio UserLand\*.root 
- program filesRadio UserLandTools\*.root 
- program filesRadio UserLandwww\*.\* 

The .root files are the underlying Radio object database and program code.&nbsp; Think of this as a Registry file or .INI file on steroids.&nbsp; Just as one of these files can get corrupted at times and need to be restored, so can a .root file.&nbsp; My recommendation is that you back these up and keep the past two weeks or so available.&nbsp; I've never had a corruption problem but I don't believe in playing fast and loose with backups and neither should you.

All user data for Radio / RCS is stored in the www directory.&nbsp; Specifically there is a users directory where the weblogs for each user is stored according to their Usernum.

#### Can I get a list of Usernums?

When you start dealing with backup and there is more than one weblog on the machine running RCS, you will quickly learn about "Usernums".&nbsp; The way that RCS operates is that a user running Radio "publishes" their weblog to RCS.&nbsp; This process, also called upstreaming, takes the content of the user's weblog and moves it to the RCS machine as static HTML and image files.&nbsp; This approach, which deliberately avoids dynamic content, very intelligently maximizes performance so that even a low end machine can serve hundreds if not thousands of users.&nbsp; Each user's weblog is stored in the directory program filesradio userlandwwwusernum directory where "usernum" is the number of the user.&nbsp; These are zero padded numbers, seven digits long.&nbsp; For example, your first usernum is "0000001" which has a directory of program filesradio userlandwww0000001.

At present time there doesn't seem to be a way to generate a list of usernums to human names or email addresses.&nbsp; I am working on a utility for this and please contact me at [sjohnson@fuzzygroup.com](mailto:sjohnson@fuzzygroup.com) if you need this feature.

#### Understanding Events

If you have ever used the Windows Event Viewer then Radio's Events feature will make you feel right at home.&nbsp; Events logs everything that Radio does in an easy to understand list that you can periodically example.&nbsp; A picture is shown below.

![](http://fuzzygroup.net/writing/images/radiou4.gif)

The following items are described for every event:

- 

Event

- 

What Happened

- 

Time

- 

Secs

#### What Events are there?

The following system level events appear in the event log:

- Update Themes.&nbsp; Every night Radio looks for new look and feel templates or themes as they are called and saves them to your system if they are available. 
- Please notify.&nbsp; The meaning of this is unclear at the present time. 
- Hourly scan.&nbsp; Every hour, Radio looks for new feed items based on the news feeds to which you subscribe. 
- Upstream.&nbsp; The process of moving information up to your RCS server. 
- Weblogs.&nbsp; The process of notifying [www.weblogs.com](http://www.weblogs.com/) that your server has an updated weblog.&nbsp; If you are running within your firewall, even if you see this event, no one can get into your firewall so you don't need to worry (unless, of course, your weblog is extranet accessible in which case you should worry). 
- Glossary read.&nbsp; The glossary is a core component of Radio which is regularly updated. 
- Hot List.&nbsp; The hotlist of the top 100 most subscribed to weblogs is regularly loaded. 
- Nightly update.&nbsp; Every night Radio will update itself looking for the latest code. 

#### What is this Nightly Update?

The bulk of Radio / RCS exists in the files Radio.root and RadioCommunityServer.root.&nbsp; Every night these files are updated.&nbsp; In an internal corporate application, this may not be acceptable i.e. what if the update has bugs and takes down our internal Knowledge Management weblog?&nbsp; This can be configured on the Prefs page as described below under "Restricting Radio / RCS to within Your Firewall".&nbsp; If you want the updates but also the equivalent of a "radio condom" then a work around is to use an automated tool like [SecondCopy](http://www.secondcopy.com/) which, on a schedule basis, can archive (zip format) specified files such as the .root files.&nbsp; This has worked quite well for me.

#### What type of reporting is in RCS?

RCS can be configured to deliver an hourly report as shown below:&nbsp;

<font size="2">
<blockquote>
<p>Hourly status report for Radio Community Server.</p>
<p>Server: 24.128.62.203 (192.168.1.100).</p>
<p>0 subscriptions deleted in the last hour, 0 subscriptions remaining.</p>
<p>In the last hour, 0 files were upstreamed, combined size: 0K.</p>
<p>There are 1 signed on users, out of a total of 4 users.</p>
<p>Number of users who have upstreamed at least once: 4.</p>
<p>Number of users who have upstreamed at least 10 times: 4.</p>
<p>Number of new users in the last hour: 0.</p>
<p>4/14/2002; 7:00:01 AM</p>
</blockquote></font>

As with any reporting tool, you need to read it regularly to make sure that problems do not get ignored.

### Restricting Radio / RCS to within Your Firewall

A huge concern of corporate users is restricting Radio / RCS so that your internal information never leaves the firewall.&nbsp; There are two ways to handle this.&nbsp; Each is documented below.

#### Setting Radio and RCS Prefs 

There are two separate issues, incoming data and outgoing data.&nbsp; Incoming data refers to things like news feeds, themes and updates.&nbsp; Outgoing data is where Radio does something like updating [www.weblogs.com](http://www.weblogs.com/) that your weblog has changed.

To turn off incoming and outgoing data, use the following steps in Radio itself:

1. 

Turn off all News Feeds by going to the News link on the Radio command bar and deleting any News Feeds to which you have subscribed.

2. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "Participate in the Weblogs.com Community".&nbsp; Turn off the checkbox on this screen and click the submit button.

3. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "Remote Access and Security".&nbsp; For maximum security, turn off all checkboxes and click the Submit button.&nbsp; Otherwise use good judgement.

4. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "Periodic Updates".&nbsp; For maximum security, turn off all checkboxes and click the Submit button.&nbsp; Otherwise use good judgement.

5. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "Event Logging".&nbsp; For maximum security, turn ON all checkboxes.&nbsp; This gives maximum logging which is always a good idea.&nbsp;

6. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "XML-RPC and SOAP in Radio".&nbsp; For maximum security, turn off the option "Check this box to allow incoming XML-RPC and SOAP messages."&nbsp; You could also limit the messages to only coming from the loopback address 127.0.0.1 or localhost.

7. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "The Blogger API in Radio".&nbsp; For maximum security, turn off this option.

8. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "Enable the Aggregator".&nbsp; Turn this option off.&nbsp; Yes, I did have you turn off all news feeds earlier.&nbsp; This is a "belt and suspenders" step.

9. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "Scan on Startup".&nbsp; Turn this option off.&nbsp; Yes, I did have you turn off all news feeds and the aggregator earlier.&nbsp; This is, again, a "belt and suspenders" step.&nbsp; Additionally, I would personally turn off all News related options, but that's just my own paranoid self.

10. 

Go into the Prefs page by going to the Prefs link on the Radio command bar and follow the link "Upstream directory.opml".&nbsp; Turn this option off.&nbsp;&nbsp;

Once you have configured Radio as talked about above, you need to configure RCS with similar settings.&nbsp; This is shown below.

&nbsp;

#### Modifying Radio.root, RadioCommunityServer.Root and RadioCommunityServerData.Root

&nbsp;

### Credits

I'd like to thank several people for making this FAQ possible:

- 

[Dave Winer](http://www.scripting.com/) for making a product good enough for third parties to write documentation for free

- 

[Russ Lipton](http://radio.weblogs.com/0100059/) whose Radio Tutorials taught me a lot

- 

Jenny the Shifted Librarian who made Navigator Links clear for the first time&nbsp;

- 

Guy Haas, Software Exegete in Silicon Valley who helped a lot

- 

The makers of WinAmp, Diet Coke, Dunkin Donuts and Krispy Kreme

Special thanks to Guy Haas who edited large parts of this, without request, fixing several egregious errors that I made.&nbsp; Any errors in this document are, of course, my own and I take full responsibility for them.&nbsp; Punishment by lashes with a wet noodle or flaming emails happily accepted.

### Distribution of this Document

#### Can I distribute this?

Yes.&nbsp; Please feel free to distribute this or link to it provided that it is complete (including what's just below) and that the copyright notice is intact.&nbsp; Thanks.

&nbsp;

### The Radio Community Server

#### Overview

TBD

#### Getting Started

TBD

#### Where do I download it?

[http://rcs.userland.com/download](http://rcs.userland.com/download)

#### Architecture

TBD

#### Where's the FAQ for RCS?

Take a look here: [http://rcs.userland.com/frequentlyAskedQuestions](http://rcs.userland.com/frequentlyAskedQuestions)

#### Installation

Download it from the url above.&nbsp; When you have to save the file, select that you want to save it into the program filesradio userlandtools directory.&nbsp;

#### How do I set the port where Radio runs?

In installing RCS, you may well have to modify the port where the Radio application runs.&nbsp; This is done as follows:

1. Go into the main Radio environment (Right click on the Radio icon in your lower right task bar area and then choose Open Radio). 
2. Select From the Radio menu "Web Server". 
3. Select from this menu "Set Port".&nbsp; Enter the port that you want to use. 

Common ports that you might want to use are: 80 (the default port for web servers, you can only use this if there ISN'T a web server on the machine already or if its not running on port 80), 5335 (Radio's default port when 80 is used) and 8080 (Radio's second default port).

**NOTE** -- If you need to do this then you may also need to disable a port.&nbsp; Here's a quote: "In the radioStartupCommands.txt in the Radio UserLand folder, you can add this command to disable port 5335:  
user.inetd.config.http2.startup = false;" [Read Original](http://radio.userland.com/discuss/msgReader$13050?mode=topic&y=2002&m=4&d=8).

#### Understanding the Full Peer Concept

This is interesting.&nbsp; Take a look here: [http://www.userland.com/whatIsAFullPeer](http://www.userland.com/whatIsAFullPeer)

#### How do I reset my default browser in Radio?

[http://radio.userland.com/discuss/msgReader$7818?mode=topic](http://radio.userland.com/discuss/msgReader$7818?mode=topic)

note -- this actually goes somewhere else in this FAQ.&nbsp;

&nbsp;

Now, to the questions ...

![](http://fuzzygroup.net/writing/radiou2.jpg)

&nbsp;

Here's another:&nbsp;

![](http://fuzzygroup.net/writing/radiou3.jpg)

And there's more:&nbsp;

![](http://fuzzygroup.net/writing/radiou4.jpg)

&nbsp;

&nbsp;

<center></center>
### Advanced Stuff

#### Overview

Radio is a sophisticated product but even advanced stuff isn't all that hard.&nbsp; A lot of it is just taking advantage of the fact that what Radio produces is just a web page and all the standard tricks that you know for web pages are applicable to Radio.

#### How do I make my weblog automatically update the user's screen every few minutes?&nbsp; 

This is also known as the "I want to be just like Dave feature".&nbsp;&nbsp;If you have ever read the [www.scripting.com](http://www.scripting.com/) weblog, you may have noticed that if you leave it open on your desktop, periodically there will be new content.&nbsp; This is actually a simple HTML trick, not a sophisticated Radio thing.&nbsp; What you need to do is take the HTML below and insert it into the Template for your home page.

\<meta http-equiv="refresh" content="6000; url=/"\>

Here are the steps in your copy of Radio:

1. 

Click on the Prefs link in the command bar at the top of the screen

2. 

Scroll down to Templates

3. 

Select Home page template

4. 

In the editing box, put your cursor after the first \<HEAD\> tag

5. 

Press ENTER to add a blank line.

6. 

Add this line by pasting it in.

7. 

Click Submit

8. 

Visit your page on radio.weblogs.com (or your own server) and verify that its in the page by Viewing the Source.

#### How do I make my weblog searchable?

You'd be surprised how quickly content on your weblog adds up.&nbsp; A post here, a post there and pretty soon you have lots of posts.&nbsp; Now you need a search engine.&nbsp; Or so I think.&nbsp; A lot of webloggers would disagree.&nbsp; They're wrong.&nbsp;

Any of the different free web search engines can make your weblog searchable.&nbsp; I chose [www.atomz.com](http://www.atomz.com/) since I think they are really great.&nbsp; Sign up for Atomz (its free) and they'll end up giving you html like that shown below (don't use this since its for my site, not yours!):

\<!-- Atomz Search HTML for FuzzyStuff Weblog --\>  
\<CENTER\>  
\<form method="get" action="http://search.atomz.com/search/"\>  
\<B\>Search:\</B\> \<input size=15 name="sp-q"\>\<input type=submit value=[Search](http://search.userland.com/)\>  
\<input type=hidden name="sp-a" value="sp1001f48f"\>  
\<input type=hidden name="sp-f" value="iso-8859-1"\>  
\</CENTER\>\</form\>

You can add this to your home page in the same way that we added the refresh tag above only we need to put it in a different place.&nbsp; Here are the steps:

1. 

Click on the Prefs link in the command bar at the top of the screen

2. 

Scroll down to Templates

3. 

Select Home page template

4. 

In the editing box, scroll down to where you want it.  
  
NOTE: This does require at least a basic understanding of HTML.&nbsp; To make it easy, lets assume that you want it at the top of the page.  
&nbsp;

5. 

To figure out where the top of the page is, you have to find it among all the HTML tags.&nbsp; What you are looking for is: \<%bodytext%\> .&nbsp; This is a Radio macro which tells Radio where the text of your web log posting should be inserted.&nbsp; If you are using Internet Explorer then you can press CTRL+F and search for it.&nbsp; If not, you'll have to scroll down and look for it.

6. 

Paste in the search form you got from Atomz in at this spot and click the Submit button.

7. 

Check out your weblog on radio.weblogs.com (or your own server) to see if the search box is ok.&nbsp; You may need to go back and forth playing with the HTML to get it looking just right.&nbsp; That's normal.

<font size="2">
<h4 align="left">Copyright</h4>
<p align="left"></p></font><font size="2">Copyright (c) 2002, J. Scott Johnson. Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.1 or any later version published by the Free Software Foundation; with no Invariant Sections being, with no Front-Cover Texts, and with no Back-Cover Texts. A copy of the license is included in the section entitled "</font><font size="2">Appendix 1 - Terms of Use</font><font size="2">". </font>

<font size="2"><strong>Note:</strong> I'm new to writing a Free Documentation statement and the above might not be perfect. </font>

<script src="http://radiocomments.userland.com/comments?u=103807&amp;c=counts" type="text/javascript"></script>[comment&nbsp;[<script type="text/javascript" language="JavaScript">commentCounter ("stories/2002/08/20/scottsRadioRadioUserlandRcsStepByStepFaq")</script>]](http://radiocomments.userland.com/comments?u=103807&p=stories%2F2002%2F08%2F20%2FscottsRadioRadioUserlandRcsStepByStepFaq&link=http%3A%2F%2Fradio.weblogs.com%2F0103807%2Fstories%2F2002%2F08%2F20%2FscottsRadioRadioUserlandRcsStepByStepFaq.html "Click here to comment on this page.")

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

