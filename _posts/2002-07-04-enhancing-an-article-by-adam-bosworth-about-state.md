---
layout: post
title: Enhancing an Article by Adam Bosworth about State
category: story.radio.weblogs.com
tags: ["software_engineering"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Enhancing an Article by Adam Bosworth about State</title>
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
 | Last updated: 7/5/2002; 4:44:20 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Enhancing an Article by Adam Bosworth about State</b></font>

It has been said that the Internet is a magnifying lens that exacerbates any problem that surfaced in the architectures that preceded it. When it comes to accessing information, this is certainly true. There are several lessons we learned a long time ago in enterprise computing:

Try to avoid maintaining state by providing stateless conversations.   
Communications are expensive.   
Bandwidth is expensive.   
Fine-grained servers don't scale well.

State adds fragility and complexity to systems. All incoming requests have to find the right state. If the state is kept in memory, it is much harder to load balance across a cluster of machines, because there is no practical way to keep an identical synchronized image on all machines in a cluster. If the state is kept in a shared durable store (normally a database), then all the machines have to connect to it and it must log all changes to state, which takes time.  
[SJ] Example of state -- think about these two urls:  
[http://www.fuzzygroup.com/about/](http://www.fuzzygroup.com/about/)  
[http://www.fuzzygroup.com/&amp](http://www.fuzzygroup.com/&amp);sessid=3129kj31lk4sfda-fdsa  
The first url will always work.&nbsp; The 2nd url has it's destination encoded within it so that can be automatically timed out by the destination server (think about stock quotes or financial transactions).

His points on databases and state management for a cluster of servers are exactly correct.

The way to avoid state is to provide all the information the client needs in one fell swoop. For example, if I ask my hospital for my medical record, I want to get my medical record as a single returned message. I don't want to get back an object with "property getters" and "property setters" that I call for each interesting piece of information such as my name or Social Security number or birth date.

[SJ]&nbsp; Agreed.&nbsp; Make sense ?

We learned the lessons about communications and bandwidth in client-server computing, which was much more optimized than the Internet. Yet, even with a high-performance, reliable network and maintained connections it turns out that the right way to talk to a database server from a client is in reasonable-sized chunks.

For example, to see my portfolio, do not issue a separate SQL query for each statistic of each stock. If everyone does that, the server shuts down. Conversely, don't ask for all portfolio transactions known to the system and trust the local software to filter out mine. The server isn't suited to serving up tens or hundreds of megabytes to each client.

PowerBuilder solved all this very nicely when it came on the scene in 1992 with its coarse-grained model and optimistic concurrency, meaning it could ask for a set of information without holding locks on the server. With the Internet, this model of coarse-grained computing is even more essential. Since HTTP doesn't typically hold connections open, the costs of communication are higher and the scale makes it prohibitive to maintain statemore reasons for getting the job done in one fell swoop.

[SJ]&nbsp; Correct.&nbsp; Make sense?

Now that we have schema, XML is well suited to describe any complex data set such as my portfolio or my medical record, even including marked up text such as a doctor's comments. It provides a natural mechanism for coarse-grained messages. Whatever information you want to package up can be put into a suitable XML bag.

[SJ] Coarse grained would be a fairly large object such as an entire record.&nbsp; Fine grained would be a property of an individual record.

Today, SOAP serves as the functional mechanism to filter the data you want. To obtain my medical record, not all medical records, and see information only since 1990, I need to invoke some service that takes in a message describing who I am and the date range I want and then sends back the right package of information. In an ideal world, I might send an XML Query, but applications are wary of supporting open-ended queries, and XML Query isn't there yet; so we use SOAP as the mechanism to know which messages sent in will return the desired data.

What this doesn't require is objects. Thinking of the Web servers as "objects" is an extremely bad idea. Objects are repositories of state. Conversations with them are by definition not stateless. Because objects are encapsulated, conversations with them are also inherently fine-grained. If you think about it, coarse-grained messages are the antithesis of encapsulation. You are surfacing your state explicitly as a message.

[SJ]&nbsp;Again the idea is that state is expensive to maintain computationally and it prevents direct access to objects.&nbsp; We all want the ability to bookmark and navigate directly to locations on the web.&nbsp; While state doesn't necessarily prevent this, it generally does.

This is at the heart of Web services. Web services doesn't mean surfacing application "interfaces" to underlying objects through automatically generated SOAP. It means providing well-defined, coarse-grained messages that provide all possible information in one fell swoop (SOAP) and a contract (WSDL) for which messages sent in result in which messages sent back.

[SJ] Exactly correct

&nbsp;

  
  

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

