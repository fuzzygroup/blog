---
layout: post
title: Building a Large Scale Distributed Outline Renderer for OPML
category: story.radio.weblogs.com
tags: ["opml"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Building a Large Scale Distributed Outline Renderer for OPML</title>
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
 | Last updated: 6/5/2002; 8:34:17 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Building a Large Scale Distributed Outline Renderer for OPML</b></font>

### <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Building a Large Scale Distributed Outline Renderer for OPML</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">OPML is a wicked cool way to display lightweight hierarchies of information.  Its an easy to implement (I did it in less than an hour for a FAQ application), xml based, simple specification.  It works and the author should be gosh dang proud of it.  Here's the rub: OPML is displayed as XML tags in the browser.  Here's what you see in IE: </font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif"><img border="0" height="498" src="http://www.fuzzygroup.com/images/opml.gif" width="449"></font>

[<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Here's the URL</font>](http://www.fuzzygroup.com/php/faq/faqview.php?action=opmlview)

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">To me, the view in IE is unacceptable.  This makes outlining a geek curiousity rather than a mainstream thing.  Yes, in a true outliner, the results will be better but we need a way for people to view this in HTML.  I'd really like people to see my outlines now but with only Radio users able to get to them, it's a chicken and egg situation.</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Here's my recommendation.  And it isn't all that hard. </font>

### <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">This is a Distributed Rendering Problem </font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Here are the issues as I see it: </font>

1. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Take an OPML url and generate HTML from it for display.  XSLT, DHTML, etc. Who cares?  Let's get it done so that "Mom" or "GrandPa" can view it.  (No disrespect to highly technical Moms and GrandPas out there, this is a metaphor).  Edit or view, who cares?  Have to start somewhere and View is easier.</font>
2. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Give a link to the actual OPML url so that if people have a mime compliant OPML editor, it can be edited.  OPTIONAL: Let people have a preferences facility to bookmark them and share them.  </font>
3. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif"><strong>Do it without breaking the bank on hardware.</strong></font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">That last point is the hard one.  Here's my solution: </font>

1. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Write this in a commonly available web language currently installed on over 3,000,000 hosts world wide that also happens to be network ready, xml capable and really, really easy to get stuff done in.  Sure, we'd all love to use Zope or Python or ExoticLangOfTheDayHere.  Guess what: PHP's what I recommend.  It meets these criteria and more.</font>&nbsp; It's wicked portable, fast enough and has none of the install problems with Perl scripts (flames to [sjohnson@fuzzygroup.com](mailto:sjohnson@fuzzygroup.com)). 
2. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Write a renderer in PHP.  Make it smart enough to update its rendering params from a server periodically.  Make it accept one parameter, the OPML file to render.</font>
3. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Write this code so it's drop dead simple to install on a server.  Make it "ioview.php", no includes.  Copy it into a website and go.  </font>
4. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Let people who download it and install it sign up with UserLand as an "OPML Partner".  Award "Karma Points" if they do it.</font>
5. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Let UserLand operate a redirector service which forks IO rendering requests out at random to different servers all over the globe.  This could probably be done with one or two Linux boxes.  Sure we could make it fancy but let brute force solve it for now.  Heck, all UserLand really has to do is own the DNS entries and a little tiny bit of hardware to jumpstart it.</font>
6. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Ask the Radio community to help out.  I have right now 3 boxes I could register.  I don't mind giving up a little cpu and bandwidth.</font>
7. <font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">Do something with the "Karma Points".  Have a pot luck supper or something.  Who cares.  We'll do it because we're a community and we believe.  The karma is just an idea.</font>

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif">I'm willing to help.  Anyone else?  I can devote both IQ, coding and cpu to it.  There have to be a lot of boxes out there with light loads.</font>

  
  

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

