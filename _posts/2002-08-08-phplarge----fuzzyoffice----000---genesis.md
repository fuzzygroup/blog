---
layout: post
title: PHPLarge -- FuzzyOffice -- 000 - Genesis
category: story.radio.weblogs.com
tags: ["php"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>PHPLarge :: FuzzyOffice :: 000 - Genesis</title>
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
 | Last updated: 8/9/2002; 5:50:38 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>PHPLarge :: FuzzyOffice :: 000 - Genesis</b></font>

Well, all I have to say is that you really have to blame Alex for this series of articles / stories / essays / diatribes / fill in potentially derogatory statement here.&nbsp; Let me explain.&nbsp; Alex is also known as [www.nosuch.org](http://www.nosuch.org).&nbsp; Yesterday he popped into my IM space with a highly reasonable request.&nbsp; And we began chatting, discovered&nbsp;we have more in common than one would have suspected and then he&nbsp;made&nbsp;the responsible statement:

> mrnosuch (08:57:04 AM): But my exp. is limited, and I'm just getting my head around the changes in 4.2.  
> mrnosuch (08:57:15 AM): I want to make sure I do things the "right way" (i.e. the secure way).  
> fuzzygroup (08:57:21 AM): Oh. 4.2. ACK FOO.  
> fuzzygroup (08:57:22 AM): [http://www.fuzzygroup.net/products/fuzzyoffice/](http://www.fuzzygroup.net/products/fuzzyoffice/)  
> mrnosuch (08:57:29 AM): Unforunately oodles of code examples and writings don't address it.  
> mrnosuch (08:57:45 AM): Well, if you have existing code, yeah, it can be a headache.  
> fuzzygroup (08:57:53 AM): Oh totally.  
> mrnosuch (08:57:57 AM): I don't have a lot, luckily, and I'd rather make sure I do things right going forward.  
> fuzzygroup (08:58:03 AM): do you control your php.ini ? Ah. Nvr mind.  
> mrnosuch (08:58:20 AM): Yeah, I do. But I actually don't use much PHP now.  
> mrnosuch (08:58:30 AM): The comment system, the glossary, cheap hacks.  
> fuzzygroup (08:58:38 AM): Ah.   
> fuzzygroup (08:58:43 AM): It's good for hacks too  
> mrnosuch (08:58:53 AM): But as I get a bit more clever, I want to be clever the RIGHT way.   
> fuzzygroup (08:58:59 AM): Yup.  
> mrnosuch (08:59:04 AM): And very little example code does it the new right way.  
> mrnosuch (08:59:11 AM): Being a coder, I learn best by example.  
> fuzzygroup (08:59:17 AM): I strongly discourage the php and html intermizxing that is so common  
> mrnosuch (08:59:28 AM): \<- whistles innocently.  
> fuzzygroup (08:59:40 AM): lol  
> mrnosuch (08:59:44 AM): I agree, though.  
> fuzzygroup (08:59:52 AM): Almost all my stuff starts with switch($action) these days  
> fuzzygroup (08:59:59 AM): and when $action is null it goes to default:   
> fuzzygroup (09:00:17 AM): which just falls thru to a template driven page   
> mrnosuch (09:00:23 AM): Makes sense.  
> fuzzygroup (09:00:27 AM): it seems to be a \_nice\_ approach.   
> mrnosuch (09:00:42 AM): It's frustrating that so little out there really talks about full web app development in PHP.

So you see people -- it's all Alex's fault.&nbsp; He prodded me.&nbsp; He placed the idea in my head.&nbsp; And then when I found out that he's about to get married to Connie, my sole thought was "It's a damn virtual wedding present".&nbsp; (Sure&nbsp;it won't do anything for Connie but do the place settings you get in a wedding ever do anything for&nbsp;the man?&nbsp; This is something that Alex even asked for!&nbsp; I&nbsp;mean&nbsp;a wedding present that a&nbsp;man actually picked out himself.&nbsp;&nbsp;How strange).&nbsp; And,&nbsp;with that introduction, I give you ...

Building a Large Scale Application in PHP: FuzzyOffice: Genesis

&nbsp;I have a confession to make.&nbsp; If my life was an adventure game, it would resemble this all too closely:

"You are trapped in a maze of twisty, windy urls, passwords, tasks, events,   
email messages, bookmarks and more, all alike.&nbsp; None will be accessible to you  
if you leave your home computer.&nbsp; No password, bookmark or url will be memorable.&nbsp;   
Your reaction will be Rage.&nbsp; Extreme Rage.  
Have a NICE day"

I'm sorry people.&nbsp; That's my life.&nbsp; I have something like 15 different logins, 4 or 5 passwords (minimum), more bookmarks than you can swing a cat at (but my cats \_hate\_ it when I swing them; 'nuff on that topic) and I'm increasingly mobile.&nbsp; So, in the spirit of damn near all Open Source applications, I need to "scratch my own niche".&nbsp;   
  
PS -- please don't tell me "Dude!&nbsp; Normalize your logins and passwords."&nbsp; Sorry.&nbsp; When some logins are 5 char max, some 7 char minimum and when you believe in security, not going to happen.&nbsp; And don't even get me started on the idiotic limitations on password length even on high security sites like Charles Schwab (where at least the last time you checked you could have no less than a 6 character password but no more than an 8 character password -- and they have my damn money????).

Now you need to bear in mind some characteristics about me to understand my solution:

- 
Highly technical
- 
Been lucky enough to work with brilliant folks (I'm kinda smart but the people I look up to make me feel like a drooling idiot who can sorta count with his fingers).&nbsp; Still I've had exposure to the right way, if I was a spiritual sort, I'd refer to it as "the manifold path".&nbsp; I know how software should be built since I've done it and seen it
- 
Tons and tons of product management / product design experience
- 
Never, ever, ever found a product I didn't want to add features to
- 
Can't stand what I think is poor design (note that I is clearly subjective)
- 
Highly mobile
- 
Outlook / Exchange user since July 1996; have \>&nbsp;2 gigs of data in Outlook PST archives; every message sent or received since July 1996.
- 
The data that defines me is my daily stuff -- mail, tasks, calendar, bookmarks, etc.&nbsp; 
- 
Need all my daily data accessible to me at all times from any computer with web access
- 
Highly mail centric; highly.&nbsp; This will be a recurring theme.
- 
Huge, huge, huge, huge believer in incrementalism and designing to a problem space driven by actually doing it, finding out it don't work and then redoing it.&nbsp; I'm the last person who'd sit down and do an ER diagram for a 100 table database.&nbsp; I'd do 2 tables as SQL statements and then build it up by importing data in place, designing queries, swearing, pulling my hair and redoing it.&nbsp; My buddy Ed taught me about incrementalism a long time ago and I never forgot it.&nbsp; Systems are too complex now a days to avoid an incremental approach (but the classic wisdom is that complex systems demand tons of pre-planning; the success of Open Source argues with that proposition).
- 
Can't remember a url / bookmark / etc to save my life (not really true but this is a problem we all have as we age and, at the advanced age of 34, my neurons are starting to fade).&nbsp; What I can do though is deal with a predictable, consistent name space.&nbsp; I can "remember" by anticipating what I might have "logically" done.
- 
Trying hard to pull together multiple discrete projects, web sites, tasks and such and finding that classical approaches like Outlook / Project just don't work for my needs.&nbsp; I need to go broad across multiple projects, not deep within a single project.
- 
A firm belief that things are "deeply intertwingled" as Ted Nelson would say.&nbsp; Application boundries currently separate tasks from emails from calendar entries when these are all just different aspects of the same.

So, given the above, it wouldn't probably surprise you that my answer is "Write Code.&nbsp; Write Lots of Code.&nbsp; Engineer (Hack) Together an Application."&nbsp; Yup.&nbsp; And, so, I give you FuzzyOffice.&nbsp; What's that?&nbsp; Don't like the name?&nbsp; Tough.&nbsp; Fork the code and change the name (it'll be ultimately GPL'd once I get a CVS server and such up and get it to a decent state).&nbsp; Seriously, the name actually can be rationalized as this:

- 
It's unique
- 
It reflects my organization
- 
It reflects my bias towards non boolean logic models and the need for "fuzzy" approaches like approximate text matching, soundex, full text searching, simple / silly natural language processing and more.
- 
It made the cats that I and my consulting partner, Gretchen, happy.&nbsp; They're all fuzzy.

Well, ok.&nbsp; We have a name.&nbsp; We have an application language, PHP.&nbsp; We can assume that an RDBMS will figure heavily.&nbsp; But, what oh sensei, should FuzzyOffice do?&nbsp; See

[http://www.fuzzygroup.net/products/fuzzyoffice/](http://www.fuzzygroup.net/products/fuzzyoffice/)   
[http://www.fuzzyoffice.com/](http://www.fuzzyoffice.com/) (damn little there now)

for the answer to that question.&nbsp; Basically it's PIM software that inverts the P (personal) and assumes that most stuff is shared.&nbsp; Even if no one else in the universe ever uses it, it's dramatically improving the productivity that Gretchen and I have and that's wicked cool.&nbsp; Also everyone else that I've run the idea by seems to like it.

### Postscript

Since I posted a request for "should I do this or not", I've gotten more Yes's than I have for any blog topic and absolutely 0 No's.&nbsp; So I guess I have a new recurring topic.&nbsp;

### Acknowledgements and Thanks Extended to:

My usual cast of friends and colleagues with some additions:

- 
Gretchen who not only encouraged this but also agreed on releasing it via the GPL.&nbsp; My favorite statement she ever has made "If Microsoft doesn't like the GPL then that's what we should use".&nbsp; My response "You Go Girl!!!"
- 
[Kjartan](http://www.natrak.net/)for confirming I'm not cuckoo for cocoa puffs (a U.S. commercial that would kinda indicate I'm insane, for all of those out there without U.S. media)
- 
Lawrence Furneval for taking 2 hours out of OSCON to go over this with me, look at incomplete software and point out how it could be highly useful for academia
- 
Guy K. Haas for a long, long IM session 2 months ago when I ranted about the "tyranny of the folder" which has been fermenting in my back brain ever since and has manifested itself here in a many to many data architecture which takes folders, bopps them on the head like little bunny foo foo, and puts them in their place as secondary data elements, not primary data elements
- 
Libby who I think this may help (and that's not a slam at all, learning this stuff without examples is \_\_hard\_\_)
- 
[Elaine](http://radio.weblogs.com/0111188/) for watching demos and being interested in learning PHP (this should help)
- 
[Demetrious](http://www.apokalyptik.com/) who bails my ass out on \*nix problems all the damn time and whose belief in the GPL (not Open Source but the GPL) made me really think
- 
[Eszter](http://campuscgi.princeton.edu/~eszter/weblog/) for confirming my suspicions on bookmarks
- 
[Alex](http://www.nosuch.org/) and Connie, 'nuff said since it's discussed above
- 
Phil and Alex for once upon a time, long ago, showing how to write an entertaining software engineering book
- 
[Paolo](http://paolo.evectors.it/) for general discussion and good thinking
- 
[Joe Friend](http://radio.weblogs.com/0103361/)who also saw the need
- 
[Jim O'Halloran](http://www.kendle.com.au/) for encouragement
- 
Dan Thompson for encouragement
- 
[Andy Meadows](http://www.347.com) for encouragement
- 
Tim Bishop for encouragement
- 
[John Engler](http://www.englers.org/) for encouragement
- 
[Simon Wilson](http://www.incutio.com/)for encouragement
- 
O'Reilly and Associates for by so turning me off of the commerical computer book publishing industry made me not have any desire to serialize this in a commercial book (and if you think that's a slam?&nbsp; you'd be correct)
- 
[Mark Pilgrim](http://www.diveintomark.org/) for showing the way of a continuous focused stream of blog articles adding up to a virtual book

I'm sure there are others I should thank but they don't come to mind.&nbsp; Thanks anyway.

  
  

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

