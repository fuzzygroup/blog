---
layout: post
title: Open Source 101- Examining Open Source Business Models
category: story.radio.weblogs.com
tags: ["open_source"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Open Source 101: Examining Open Source Business Models</title>
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
 | Last updated: 6/16/2002; 10:20:41 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Open Source 101: Examining Open Source Business Models</b></font>

[http://www.kerneltrap.org/node.php?id=222](http://www.kerneltrap.org/node.php?id=222)

<font color="#444444"><em>Larry McVoy:</em> I've never bought into the open source model as a self sustaining model for all software. It works in some places the software is tied to some other source of revenue, such as hardware, but in general, it stinks as a business model. It's fantastic if your goal is to have a lot of free software out there, but it starts to fall apart when building that free software costs more than you can extract from it in revenue. <br><br>BitKeeper is in that camp. There is about 25 man years of effort in BitKeeper so far, with no end in sight. We pay Bay Area salaries, so our cost for an engineer is about $160K/year. That's at least 4 million dollars no matter how you look at it, and that's a lower bound. I took a hard look at the Cyclic people who tried to make a business out of supporting CVS and they pulled in $145K in their best year. It would take 27 years to make $4 million at that rate, and that assumes we stop drawing salaries today. In this product space, if people can use it for free, they will. People have tried to argue with me that BitKeeper is a better tool and it would generate more support revenue. That's nonsense, exactly because it <b>is</b> a better tool. At least with CVS, there are enough broken or missing features that you could generate revenue to fix them. Maybe. <br><br>So I took a hard look at the situation and decided that I wanted to maximize value to everyone. I divided the world up into 3 camps: the free users, the commercial users, and the vendor. The goals were to provide maximum value to everyone and have everyone provide value back in return. Here's how it works: <br><br></font>

> **Free users** : these users don't pay in money, but they do pay. They pay by using the product and pointing out bugs. BitKeeper is a dramatically better product because of the free users. The BKL, the free usage license, insists that you are running the latest images, because that's where the free users provide value. It doesn't help anyone to get bug reports on problems we've already fixed. The job of the free users is to help debug the latest.   
>   
> **Commercial users** : these users pay in money which funds further development. As a commercial user, they can pick which release they want to run, which sometimes means they stay back for stability reasons, perceived or otherwise. They benefit from the free users running a new release first, and it's typical that they wait for the timestamps in the download area to be a few weeks old before upgrading.   
>   
> **Vendor** : we provide value in the form of the product and support. We get the bug fix value from the free users and financial benefit from the commercial users. The money is turned right around into additional development.

While BitKeeper is hardly a get rich quick scheme, it is self supporting. We've taken no outside investment, the company is built on the backs and wallets of the people who work here, and that's cool. It means there is no outside board of directors in the form of VC's telling us to stop wasting time giving it away. I know that giving it away has helped make it a better product, which is good for everyone, but I'd hate to be in the position of having to justify that decision to a VC before the fact. It's easy to see that things worked after the fact, it's much harder to see that they will work ahead of time.   
  
The bottom line on the licensing scheme is that it was designed to give as much and get as much as possible to and from **all** parties. Licenses such as the GPL give more to the free users, but give dramatically less to both the original author and to the commercial users. Using GPLed software for everything is like living in a world where the answer for when you have an illness is "here are the plans for the hospital, you can finish building it and check yourself in. Oh, and here's the medical instruments you'll need, you can slice yourself open and poke around. You can do it, good luck!".

  
  

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

