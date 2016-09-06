---
layout: post
title: SysAdmin- When the SysAdmin Is Forced to Leave the Building
category: story.radio.weblogs.com
tags: []
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>SysAdmin: When the SysAdmin Is Forced to Leave the Building</title>
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
 | Last updated: 6/25/2002; 1:06:44 PM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>SysAdmin: When the SysAdmin Is Forced to Leave the Building</b></font>

I woke up this morning with a really nasty nightmare about something that happened at a company I was at a few years ago: We had to fire a SysAdmin.&nbsp; This still gives me cold sweats.&nbsp; Here's the reasons: He's the guy with the keys to the kingdom.&nbsp; If you have a good SysAdmin then he probably has all kinds of access.&nbsp; I know we made a few mistakes in disabling his access so I thought I'd write it down and update it for a pure Internet company (i.e. we're no longer really worried about a SysAdmin's Novell accounts; I said it was a few years ago, didn't I?).

The best way to do all these tasks is in parallel, not in serial, before the SysAdmin is fired.&nbsp; Ideally you get someone to take him or her out for lunch so he or she has no access while all this is going on.&nbsp; And then you do it -- but you treat them professionally and well -- there are often lots of backdoors that are \*damn\* hard to close (example: router passwords are often forgotten as are PBX passwords).&nbsp; I always have given a pretty generous package to departing SysAdmins.&nbsp; Why take risks when you don't have to?&nbsp; A little bit of additional severance is \*cheap\* insurance against a disgruntled employee who could (covertly) muck with your systems from afar.

1. Disable his or her Unix account on all Unix servers.&nbsp; If you don't have a central login system that means, sigh, every single Unix box.&nbsp; Deal with it.&nbsp; Don't delete the account -- you may need it someday -- just disable it. 
2. Change all contact info and all passwords on all domain entries.&nbsp; If you registered domains thru multiple places, you still do this. 
3. Change all passwords on all web based control panels for externally hosted web sites.&nbsp; DON'T FORGET THE FTP ACCOUNTS!&nbsp; Or the email accounts.&nbsp; Sometimes these are disconnected from the main control panel password. 
4. Change his or her password on any managed servers such as ones by RackSpace, RackShack, etc. 
5. Change his or her password on any web based admin tools like webmin. 
6. Change his or her password on all routers. 
7. Change his or her password on all mail servers. 
8. Change his or her password on all firewalls. 
9. Change his or her password on all PBXes. 
10. Change his or her NT / 2000 / XP domain controller logins. 
11. Change the credit card numbers of any company or executive personal credit cards that the SysAdmin may have had access to for online transactions. 
12. Change the password on all database servers at the server level and database level (if needed). 
13. Change all application logic on web applications where that password was accessed (and if you haven't used an include file model for this, I guarantee that after this you will). 
14. Change the password on all Samba servers. 
15. Call ALL vendors where the SysAdmin as a designated contact and UNDESIGNATE HIM immediately.&nbsp; Why?&nbsp; BEcause if you don't he can either incur a bill or have himself added to an account. 
16. Initiate a Full Scale Backup Of All Servers Immediately. 
17. If you have any pirated software internally -- purge it immediately.&nbsp; The #1 cause of software license compliance audits is disgruntled employees. 
18. Drink Heavily. 
19. Pray. 
20. Write off any company hardware or software that the SysAdmin has at home.&nbsp; You almost certainly aren't going to get it back. 
21. For the next 2 to 4 weeks, or until the SysAdmin finds another job, make sure that two people are responsible for log audits on http servers, mail servers and the firewall.&nbsp; Why two?&nbsp; Because this is BORING and people do make mistakes.&nbsp; Two people is my "Belt and Suspenders" approach to boring tasks.

I'd virtually guarantee that I have missed at least 3 critical systems in the above lists.&nbsp; If you have suggestions, comments or thoughts, I'll definitely add them to the above list and give credit of course.&nbsp; This is the kind of lesson that you do not learn in school -- it's a nasty, dirty thing that people don't want to talk about.&nbsp; And, yes, there are ways to integrate logins and security and such -- but they often don't work all that well and rarely are implemented at the 100% level.

You may think I am joking about "Pray" (3rd from the end).&nbsp; I'm not.&nbsp; Firing a SysAdmin is a very dangerous thing.&nbsp; Of course, no one likes to be fired -- and rightly so.&nbsp; But there are lots of times when people's job performance just isn't good.&nbsp; And you need to do the right thing for the organization.&nbsp;

Updates from a Really Smart (and Practical) Reader

I just got a really great enhancement from a reader who pointed out "_you know the worst part about sysadmins? We most likely know the passwords of all the executives_".&nbsp; This is totally true.&nbsp; And you need to add a new item to the list above:   
  
  
**"Change passwords for all executives".**

Thanks&nbsp;[Kjartan](http://www.natrak.net/)!&nbsp;

  
  

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

