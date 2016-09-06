---
layout: post
title: Consulting 101- Do My Clients Really Need a T1?
category: story.radio.weblogs.com
tags: ["consulting101"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Consulting 101: Do My Clients Really Need a T1?</title>
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
 | Last updated: 6/16/2002; 10:20:38 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Consulting 101: Do My Clients Really Need a T1?</b></font>

I was recently asked by a client to evaluate her network connectivity.&nbsp; This client had these characteristics:

- Non-profit organization 
- Physical office space in a office complex with 15 - 20 other companies in the office park 
- Current Cost for a Shared T1 of $225 per month, no real bandwidth guarantees 
- A single T1 supplied the entire building from a local ISP 
- Approximately&nbsp;10 total employees 
- No more than&nbsp;5 employees ever in the office at one time 
- An internal Ethernet LAN with Windows workstations connected to it 
- Use of the Internet for these purposes 
  - Email 
  - Web Browsing 
  - Some Limited Instant Messaging but not significant 
  - No bandwidth intensive activities save rare large attachments

The question at hand was "Do I really need to spend $225 / month for this Internet access"?&nbsp; My analysis was as follows:

1. Is Internet access mission critical or non-mission critical?&nbsp; A T1 is more reliable than DSL but the price difference is $39 or $49 / month versus $225.&nbsp; That's a minimum savings of over $2,000 per year.  
2. Are there other options like DSL or cable modem?&nbsp; To test this, I recommend Earthlink's DSL checking which works well (at least in the Massachusetts area).&nbsp; Use: [http://www.earthlink.net/dsl/](http://www.earthlink.net/dsl/).  
3. Understand that there are different business versus residential DSL options.&nbsp; Although the EarthLink business DSL wasn't available, the residential option **was**.&nbsp; (The baseline business DSL was $79, for a slight speed improvement).&nbsp; Given that the website suggested to use the residential DSL instead, I am assuming that they will install it into an office building.&nbsp; This probably needs to be confirmed before switching off the T1.  
4. Given that this office only has 5 concurrent users at any one time, of which it's highly unlikely that all are heavily using the Internet at once, my estimate is that DSL would provide more than adequate connectivity.  
5. It's not safe to hook up a business (or for that matter a home) to a DSL or cable modem without a hardware firewall.&nbsp; Fortunately, given the relatively small number of concurrent users, an inexpensive Small Office, Home Office (SOHO) firewall from Linksys can be used.&nbsp; I recommend the [LinkSys BEFSR41](http://www.linksys.com/Products/product.asp?grid=23&prid=20), a hardware firewall and switch, rated to support up to 253 users.&nbsp; Not only is the product rock solid, it can be administered via a browser, provides DHCP, port forwarding, operates in full duplex for better performance, comes with [outstanding support](http://radio.weblogs.com/0103807/2002/04/07.html) and only costs about $150 as a one time cost (i.e. it's just hardware you buy at a computer store).

So, given that my analysis is correct, should this office move to DSL?&nbsp; In my opinion, yes.&nbsp; What I would do is actually arrange for the DSL service to be installed, make sure that it works and is reliable and then terminate the T1.

  
  

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

