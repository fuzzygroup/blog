---
layout: post
title: Ack!  When TCP Attacks!!!
category: story.radio.weblogs.com
tags: ["linux"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Ack! When TCP Attacks!!!</title>
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
 | Last updated: 8/8/2002; 10:22:59 PM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Ack! When TCP Attacks!!!</b></font>

I just ran into one of those perplexing predicaments.&nbsp; After being exiled from my house to Starbucks for a house showing (that sale I mentioned recently?&nbsp; fell thru; sigh) and doing a bunch of work while being professionally caffeinated, I wanted to upload what I did.&nbsp; So I booted up my Linux laptop and all was goodness until I tried to scp (secure copy) stuff to my server and got nothing.&nbsp; Huh?&nbsp; What?.&nbsp; Tried my faithful network girlfriend, ping, and got this disturbing error message:

**connect: network is unreachable**

I twiddled around for a bit and did

### Original IM Transcript:

DemitriousK: whats the q?  
fuzzygroup: on phone.&nbsp; are you around for a bit ?  
DemitriousK: dunno  
DemitriousK: try in a bit :-)  
fuzzygroup: pcmcia network card stopped working totally.&nbsp; 2nd one has same symptoms.  
DemitriousK: eww  
DemitriousK: symptoms?  
fuzzygroup: sec  
fuzzygroup: restarting  
fuzzygroup: dumped mock gf phone call  
DemitriousK: umm... i dont know if thats good or bad?  
fuzzygroup: getting a working network card is more important  
DemitriousK: :-)  
fuzzygroup: the link light does not light up  
fuzzygroup: and a ping gives "connect: network is unreachable"  
fuzzygroup: i tried another linksys card (diff model but I think drivers are the same) and had the same symptoms  
fuzzygroup: I can order another exactly the same but thought some trouble shooting was called for before the $119 was spent  
DemitriousK: wifi?  
fuzzygroup: nope  
fuzzygroup: just wired  
fuzzygroup: and i confirmed that the cable is live  
DemitriousK: try a diff net cable?  
DemitriousK: o  
DemitriousK: hmm  
fuzzygroup: lol.  
fuzzygroup: where would error logs be to start ?  
DemitriousK: /var/log/  
DemitriousK: probably messages  
DemitriousK: type 'dmesg'  
DemitriousK: and check the end of the output  
fuzzygroup: all looks good  
fuzzygroup: can't paste it to you. sigh.  
fuzzygroup: wait   
fuzzygroup: ah ha  
fuzzygroup: "timed out waiting for a valid dhcp server message"  
fuzzygroup: how do I manually bind an ip address ?  
fuzzygroup: ifconfig   
DemitriousK: ifconfig eth0 up \<ip\>  
DemitriousK: route add -net default gw \<gateway\>  
DemitriousK: and add 'nameserver \<name server ip address\>' to /etc/hosts  
DemitriousK: nameserver 66.122.168.68 works   
fuzzygroup: mission control we have ping.&nbsp; repeat.&nbsp; we have ping.  
DemitriousK: :-)  
DemitriousK: i got a dollar. i got a dollar. i got a dollar hey hey hey hey  
DemitriousK: !!!  
fuzzygroup: getting a problem on the route command though  
fuzzygroup: lol.  
fuzzygroup: I typed  
fuzzygroup: nvr mind  
fuzzygroup: and we have dns  
fuzzygroup: :-)   
fuzzygroup: my laptop says thank you.  
fuzzygroup: may ability to upload the work I did at starbucks says thank you.  
fuzzygroup: I bet I need to restart my router / gateway.  
fuzzygroup: Sigh.  
fuzzygroup: thanks man!  
fuzzygroup: I'll write that up and cross link it to your site.  
fuzzygroup: useful to have on hand for the next time.  
DemitriousK: hehe  
DemitriousK: :-)  
DemitriousK: yea ive been in that predicimate before :-)  
fuzzygroup: "When the DHCP don't DHCP"

  
  

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

