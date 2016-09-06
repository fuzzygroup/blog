---
layout: post
title: Basic Network Troubleshooting or What Do I Do Before I Call My SysAdmin ?
category: story.radio.weblogs.com
tags: []
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Basic Network Troubleshooting or What Do I Do Before I Call My SysAdmin ?</title>
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
 | Last updated: 6/16/2002; 10:22:21 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Basic Network Troubleshooting or What Do I Do Before I Call My SysAdmin ?</b></font>

I was troubleshooting some network connectivity problems recently with a box in a remote data center that wasn't responding and I thought this technique would come in handy to someone.&nbsp; There isn't any magic here and I'm not pretending that there is.&nbsp; Still, if you are new to doing network stuff this is useful.

**NOTE:** SysAdmin is short hand for "Systems Administrator".&nbsp; Generally this is the guy who keeps everything running and in order.&nbsp; He's also the guy who will save you time and again.&nbsp; As a general rule, be nice to your SysAdmin.

**NOTE 2** : I ran these by my friend Kjartan who's a much better \*nix admin than I am and he added some great points.&nbsp; I agree with all of them and, rather than rewriting them, I thought I'd give full credit but leaving them intact as a final section.

## Basics

There are two core network troubleshooting tools for Internet style networking (i.e. TCP/IP networking).&nbsp; They are Ping and TraceRt (pronounced "Trace Route").&nbsp; Here's what they do:

- ping -- Contact a machine between 1 and N times (N might be infinite) sending it one "chunk" of information to see if it responds. 
- tracert -- Trace the "route" over (generally) 30 hops between your machine and the remote machine.

Here's a pretty good assumption when you have a machine in a data center and THEY gave you the machine's IP address:

> Machines in data centers generally have consecutive IP addresses.&nbsp; Let's say for example that your machine has the IP address: 216.40.225.70.&nbsp; It's a pretty good bet that 216.40.225.71 will be another machine in that SAME data center.&nbsp; What I do when troubleshooting failures is alter the IP address I am looking at by 1 or 2 digits on the last set of numbers.&nbsp; This tells me whether or not the failure is the entire data center or just a machine or group of machines.
## How to Troubleshoot a Remote Machine

This is one of those things that there are as many different opinions on as there are SysAdmins.&nbsp; I tend to use this approach.

1. Ping the remote machine by dns name such as "ping example.com".&nbsp; If this fails, proceed to step 2. 
2. Ping the remote machine by IP address such as "ping 192.0.34.72".&nbsp; Don't know your machine's IP address?&nbsp; Pinging it will reveal it to you.&nbsp; WRITE IT DOWN NOW.&nbsp; Don't lose it.&nbsp; If DNS fails you can often reach your machine by IP address.&nbsp; 
  - If this succeeds then your machine is still on the Internet but you have a DNS failure.&nbsp; Contact your SysAdmin immediately. 
  - If this fails then proceed to step 3.
3. Run a tracert to the remote machine by IP address.&nbsp; This will give a result like this.

    c:mycode>tracert 192.0.34.72

    Tracing route to 192.0.34.72 over a maximum of 30 hops:

      1    15 ms   <10 ms    16 ms  24.128.62.1  2    16 ms   <10 ms    15 ms  bar01-p0-1-0.sagshe1.ma.attbb.net [24.128.8.213]

      3   <10 ms    16 ms    16 ms  24.147.0.217  4   <10 ms    16 ms    15 ms  bar03-p8-0.wobnhe1.ma.attbb.net [24.91.0.41]  5   <10 ms    16 ms    16 ms  12.125.39.213  6   <10 ms    15 ms    16 ms  gbr1-p70.cb1ma.ip.att.net [12.123.40.98]  7    16 ms    15 ms    16 ms  tbr1-p013401.cb1ma.ip.att.net [12.122.11.193]  8     *        *        *     Request timed out.  9    16 ms    15 ms    16 ms  ggr1-p320.n54ny.ip.att.net [12.122.12.22] 10    16 ms    15 ms    16 ms  att-gw.ny.verio.net [192.205.32.242] 11    79 ms    93 ms    78 ms  p16-6-0-0.r00.mlpsca01.us.bb.verio.net [129.250.5.112] 12    78 ms    78 ms    94 ms  p16-7-0-0.r01.mlpsca01.us.bb.verio.net [129.250.4.94] 13    78 ms    94 ms    93 ms  p16-7-0-0.r00.lsanca01.us.bb.verio.net [129.250.5.96] 14    79 ms    93 ms    94 ms  ge-2-0-0.a02.lsanca02.us.ra.verio.net [129.250.29.116] 15    78 ms     *       78 ms  d1-1-2-2.a02.lsanca02.us.ce.verio.net [198.173.172.146] 16    94 ms    94 ms    94 ms  192.0.33.1 17    94 ms    94 ms   109 ms  www.example.com [192.0.34.72]

    Trace complete.

When you have a failure, what you are looking for is something like this:

     21     *     some domain name  [207.218.223.34]  reports: Destination host unreachable.

This tells you that on hop 21 to the destination it found an error.&nbsp; It's a pretty good certainty that if you can't get to your machine via ping to it's name, ping to its IP address or tracert to its IP address you need to call your SysAdmin.

## Feedback from Kjartan

<font size="2"><a href="http://www.natrak.net/"> Kjartan</a> sent these comments.  I reformatted them from the email but they're all pretty much the same (and they are excellent).  Thanks!</font>

1. tracert is called traceroute in linux systems. The tracert is a relic from the days when DOS/Windows only supported 8.3 file names.
2. It really helps to know the route from your location to the server.&nbsp; Not being able to reach a server can be your ISPs problem. I have a copy of traceroutes too all my servers saved on file so I can guess where the failure is. I can usually tell if the failure is my isp, the hosting company or somewhere in between. Ofcoz routes change so its not an exact science, but with some experience its not that hard.
3. Make sure there are no firewalls blocking pings/traceroutes.&nbsp; ISPs/hosting companies have a nasty habit of modifying the rules at will. So when the web server is down make sure you can't contact the server via ssh (or telnet if you still run that).

  
  

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

