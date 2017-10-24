---
layout: post
title: When Windows Profiles Fail and Why
category: story.radio.weblogs.com
tags: ["windows"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>When Windows Profiles Fail and Why</title>
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
 | Last updated: 9/6/2002; 10:06:38 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>When Windows Profiles Fail and Why</b></font>

**NOTE** : This has been on my website since April but I keep getting nice emails about it so I thought I'd blog it.&nbsp; Ignore if you saw it on my site.

![](http://www.fuzzygroup.net/writing/images/whenwi1.jpg)

<font size="2"><b>Oh those dirty monkeys! <br>Barbados monkey stealing fruit from breakfast</b></font>

### Windows Profiles: Just Pull the Power!&nbsp;

In another essay, I described how [I don't like to fix computers](http://www.fuzzygroup.net/writing/whensoundcardsfail.htm) when they break. I just went thru this twice recently with the same problem and I thought my experiences might be useful to someone else since even with the power of [Google](http://www.google.com/) and [QueryServer](http://www.queryserver.com/web.htm), I couldn't find an explanation.&nbsp; After some digging and thinking, I think I now understand it -- even if, perhaps, Microsoft doesn't want to admit to the problem.

Here's what happened:&nbsp;

- I had been using my computer the night before, doing some development with [PHP](http://www.php.net/) (if you care) and shut down 
- The next morning when I started up and logged in, I got a message from Windows that "My Profile Could Not Be Loaded" (if I can dig up the screen cap, I'll add it) 
- I was able to log in but every single customization, the Documents menu, Internet Explorer Favorites, Email settings, Access to my Outlook PST -- gone! 
- Windows recommended that I create a new account for myself since the profile was corrupted. 

Wonderful.&nbsp; Bloody wonderful.&nbsp; I dutifully followed Microsoft's directions after searches of [http://support.microsoft.com/](http://support.microsoft.com/) yielded not very much.&nbsp; It put me out of commission for a day or so recreating stuff.&nbsp; I wasn't happy but I dealt with it.

Then it happened again.&nbsp; On a different computer.&nbsp; And I got angry so it was time to figure it out.

Here are my machine configurations:

- First Crash 
  - Emachines Celeron Box 
  - 192 megs of Ram 
  - Windows 2000 Server 
- Second Crash 
  - Compaq Deskpro 
  - 256 megs of ram&nbsp; 
  - Windows 2000&nbsp; 

Now, perhaps I can rationalize the first crash as "[Emachines](http://www.emachines.com/) isn't all that good" (actually that's true, they really are excellent).&nbsp; But the second crash??? [Compaq](http://www.compaq.com/) makes damn good hardware.&nbsp; What the heck was going on...

The first step in debugging is looking for commonality:

- Both profiles were corrupted when I logged in.&nbsp; This pretty much means that the corruption had been sometime prior.&nbsp; Given that I generally leave my computers on 24x7, I generally remember my shutdowns. 
- On both machines I had followed my usual work style -- which is fairly intensive multitasking (see below) 
- On both machines I had gotten an unusual error message: Out of Memory.&nbsp; I haven't seen an out of memory error in literally years so this stood out in my memory&nbsp; 

I've had friends kid me about the amount of multitasking I do.&nbsp; I've also been known as "The King of Browser Windows".&nbsp; Shown below is a screen capture of my Windows task bar that shows the amount of Windows I generally have open:

### ![](http://www.fuzzygroup.net/writing/images/whenwi2.jpg)

Yes, I know that this amounts to a lot of Windows but here's why.

- Most of them are browser Windows, not programs.&nbsp; I generally don't run more than Project and FrontPage together along with Outlook and a lightweight code editor.&nbsp;&nbsp; 
- I view browser windows as "Virtual Paper".&nbsp; Just as I have a messy desk, I also have a messy set of Windows.&nbsp; Why?&nbsp; When you are doing technical work, you need to look stuff up and then test it.&nbsp; That usually adds up quickly as follows:&nbsp; 
  - A Browser open to Google 
  - Four or Five browser windows open to different technical topics, each one usually solving 1/8 to 1/3 of the current problem 
  - A window open to [Slashdot](http://www.slashdot.com/) for relieving development brain fry 
  - Two Browser windows open to my SQL database's web based admin tools, one for querying and the other for checking / inserting 
  - Four or five browser windows for testing different pages I am developing&nbsp; 

Its pretty easy to add that up and get up to 10 or 15 browser windows and then just add some random surfing to the mix and you get more.

Could it be that lots of browser windows add up to memory loss?&nbsp; As best as I can tell, the answer is "YES".&nbsp; I haven't been able to definitively confirm this but its the only answer I have and some links on the web (no, I don't have them handy right now) seem to agree with me.&nbsp; Even if this is true, why running out of memory affect the profile?

The key here lies in understanding running out of memory and when the Windows profile is saved.&nbsp; When you run out of memory on a computer, what happens is pretty, well, **random**.&nbsp; What seems to have happened to me is that when I ran out of memory, the parts of memory that contained the Windows profile were corrupted.&nbsp; Windows 2000 (and NT) seems to keep the user's profile entirely in memory at all times.&nbsp; For performance this makes a lot of sense.&nbsp; For robustness and safety, it doesn't.&nbsp; Anyway, this means that when the profile gets corrupted, you have a big problem.&nbsp; Now, here is the key point: Windows 2000 (and again NT) only writes the profile at Shutdown or Restart.&nbsp; Its at this point only when the corruption is an issue for you.&nbsp; If you can avoid the saving of the corrupted profile then you are ok.

### Don't Turn it Off: PULL THE PLUG (literally)!

Here is the key thing: If you want to NOT have your profile saved after an out of memory condition, the machine has to move into an off condition.&nbsp; Note that I didn't say "be turned off".&nbsp; On newer machines, the power switch actually triggers the Windows shut down process.&nbsp; It happens on my Compaq Deskpro and I've seen it on other machines.&nbsp;&nbsp;

Here's what you have to do: Pull The Plug!

This is definitely not advice that I want to give and it is something that you generally shouldn't do but... Here is my process for this:&nbsp;

- Close all open applications and browser windows 
- Email and IM too 
- Let your machine sit quietly for ten or minutes or so until you hear NO hard disc activity 
- Reach around the back and pull out the power cord 

The reason for this (fairly silly I'll admit) process is that what you don't want to do is turn the power off while the computer is actually writing to disc.&nbsp; This can cause a hard drive crash and that would be even worse than a corrupted profile.&nbsp; Still, with Windows (not Linux / Unix), as long as no drive activity is going on, you should be ok with this.

**Moral of the story** : Watch for this error message if you use Windows 2000 or NT.&nbsp; Pull the plug.&nbsp;

### Note to Microsoft: Fix Your Search Engine, Please!&nbsp;

Just a side note to Microsoft, could you please improve the search engine at [http://support.microsoft.com/](http://support.microsoft.com/).&nbsp; I can't remember the last time I had such a bad search experience.&nbsp; It looks better since Windows XP came out but seems to have the same bad experience underneath.&nbsp; Among my gripes are that you don't use " " marks for exact phrase searches. I have to open up the advanced options and then pick "Exact Phrase".&nbsp; Come on here...&nbsp; Pretty much every search engine on the Internet uses " " marks.&nbsp; There are some other things that I'll talk about another time.

- Links from support about "[Corrupt Profile](http://search.support.microsoft.com/search/default.aspx?Catalog=LCID%3D1033%26CDID%3DEN-US-KB%26PRODLISTSRC%3DON&Product=msall&Query=Corrupt%2520Profile&Queryc=Corrupt+Profile&REF=false&srchstep=0&KeywordType=PHRASE&Titles=false&numDays=&maxResults=25)" (3 results) 
- Links from support about "[Corrupted Profile](http://search.support.microsoft.com/search/default.aspx?Catalog=LCID%3D1033%26CDID%3DEN-US-KB%26PRODLISTSRC%3DON&Product=msall&Query=Corrupted%2520Profile&Queryc=Corrupted+Profile&REF=false&srchstep=0&KeywordType=PHRASE&Titles=false&numDays=&maxResults=25)" (8 results) 
- Links from Google about "[corrupted profile](http://www.google.com/search?hl=en&ie=UTF8&oe=UTF8&q=%22Corrupted+Profile%22+)" (188 results) 

<script src="http://radiocomments.userland.com/comments?u=103807&amp;c=counts" type="text/javascript"></script>[comment&nbsp;[<script type="text/javascript" language="JavaScript">commentCounter ("stories/2002/09/06/whenWindowsProfilesFailAndWhy")</script>]](http://radiocomments.userland.com/comments?u=103807&p=stories%2F2002%2F09%2F06%2FwhenWindowsProfilesFailAndWhy&link=http%3A%2F%2Fradio.weblogs.com%2F0103807%2Fstories%2F2002%2F09%2F06%2FwhenWindowsProfilesFailAndWhy.txt "Click here to comment on this page.")

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

