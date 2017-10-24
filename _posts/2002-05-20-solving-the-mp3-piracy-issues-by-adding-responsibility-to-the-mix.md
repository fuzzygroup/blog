---
layout: post
title: Solving the MP3 Piracy Issues By Adding Responsibility to the Mix
category: story.radio.weblogs.com
tags: ["mp3"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Solving the MP3 Piracy Issues By Adding Responsibility to the Mix</title>
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
 | Last updated: 6/5/2002; 8:35:18 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Solving the MP3 Piracy Issues By Adding Responsibility to the Mix</b></font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">I don't now and never have understood what the problem with MP3 piracy is.  To me solving this is so simple that it's just plain obvious.  As with most of my essays, we'll start with the basic assumptions, add some common sense and then tie it together.</font>

### <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Assumptions</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Here are my assumptions on piracy of digital music.</font>

1. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">It's just going to happen.  There is no alternative.  There are just too many damn MP3 files out there to stop them.  100 Million?  Billions?  Probably.  The record companies can't remove the essentially entropic spread of MP3s (the record/cd used to be relatively orderly i.e. it was sold in a store, through a channel; now it's chaotic since it's literally everywhere).</font>
2. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Users don't want anything other than MP3.  To me MP3 = Audio.  Yes, the format isn't as high fidelity as it could be.  Doesn't matter.  For me unless hardware plays MP3 files natively I just won't buy it.  Sony's proprietary players?  I spit on them.  They have no honor.  Seriously, with the quantity of hardware that plays MP3s natively, every single day MP3=Audio becomes more entrenched.</font>
3. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">You can't do anything about existing music that's out there.  And you probably can't get existing Kazaa / iMesh / Gnutella users to stop.  It's entirely unclear to me or anyone that they'd buy it if they had to.  These are the people that previously copy CD's from friends, etc.  Would they ever really buy if they had to?</font>
4. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">What you can do is design an online system that gives the benefits of Napster but makes it so that people can a) use standard MP3s and b) actively encourages them to not give MP3s to friends.</font>
5. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Any solution that wants to encourage users to not pirate MP3s has to take #1 - #4 into account.</font>
<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">
<h3><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">It's All About Shame and Fear of Being Caught</font></h3>
<p><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">If you think about this, the real problem with #4 is the standard MP3 format issue, or is it?  If I was building this kind of system, here's what I would do.</font></p>
<ol>
<li>Since it is a secure system, I know the username, account #, credit card info, email address and their IP address of the user who is downloading an MP3 file. 
</li>
<li>When the user requests an MP3 file I would "personalize" the MP3 file as follows 
<ul>
<li>Add one or more of these elements as MP3 ID tags.  I wouldn't always use the same tag or data element and I might or might not encrypt it. 
</li>
<li>I'd let the user know that this song, "Bare Naked Ladies - Light Up My Room", has been branded with your information.  We do not recommend sharing this with anyone else as it could disclose personal information. 
</li>
<li>Add a subaudible 10 second track at the end of the MP3 clip that encodes this some or all of this information. 
</li>
<li>Record the date, time and exact byte size of this file for some level of future enforcement (think about it -- a filesize down to the byte level along with a partial string match on the filename and / or date time is pretty close to a globally unique identifier).</li>
</ul>
</li>
<li>You now have the information to fight piracy.  The next step is to write active monitoring clients for Gnutella, Kazaa, etc. and then to start some level of enforcement.</li>
</ol>
<p><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">To me this approach works because users <strong>don't want to be caught </strong>and wouldn't like the idea that part of their credit card information might be part of the ID tag, or worse, available to anyone with audio processing equipment.  Yes they can delete this, perhaps, but most just won't.  It's another step towards preventing sharing by adding <strong>responsibility</strong> to the mix.  Most people honestly don't want to be criminals but the record companies give us no reason not to be.  They don't provide what we want -- MP3.</font></p>
<p><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">So, in summary, </font><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">right now we all use MP3s and Kazaa because we can.  Converting the existing users of Kazaa, etc, may well be impossible </font><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">but there is a huge untapped market that hasn't bought into MP3 yet -- get those folks legal rather than losing everyone to Kazaa, etc.  Think vertical market music -- Classical or Jazz with targeted marketing campaigns i.e. "NapJazz.com".</font></p>
<h3><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Closing Notes</font></h3>
<p><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Two thoughts: </font></p>
<ul>
<li>This problem really does have to be solved.  It's far better that something like this go into active use than the current stupid thinking that may us down at the hardware level permanently. 
</li>
<li>Think Fear, Shame and Responsibility won't work?  Look at how well they have worked for the Catholic Church for decades if not centuries.<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif"></font>
</li>
</ul>
<p align="center"><font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Hey Record Companies!  I'm available to build this.</font></p>
<p align="center">And, guess what, the same approach works with movies too.</p></font>

  
  

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

