---
layout: post
title: Writing - Technical - Writing API Documentation
category: story.radio.weblogs.com
tags: []
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Writing : Technical : Writing API Documentation</title>
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
 | Last updated: 6/16/2002; 10:21:45 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Writing : Technical : Writing API Documentation</b></font>

This essay was shamelessly stolen from an email by [http://guy.blogs.at/](http://guy.blogs.at/).&nbsp; Guy&nbsp;K. Haas knows more about tech writing (heck, just writing) then&nbsp;I ever will.&nbsp; Writing API documentation is something I've never understood so I jumped at the chance&nbsp;to get the email and thought... Hey!&nbsp; Blog that puppy.&nbsp; With Guy's permission, I now have.

## What is API documentation?
<font size="2">
<p>There are application programmers (who produce programs that people use to do tasks -- programs like Turbo Tax, or a college registration system), and there are systems programmers (who produce the programs that enable the application programmers to do their job, such as programming language compilers, operating systems, servers, etc).  An API is an Application Programming Interface. The typical case is that there is a product that provides a bunch of services or features (like Windows, for example) and an application programmer wants to make use of these services. She needs a way to ask the product for what she wants. That's where an API comes in.</p>
<p>See:</p>
<ul>
<li>
<a href="http://nightflight.com/foldoc-bin/foldoc.cgi?query=api&amp;action=Search"></a><a href="http://nightflight.com/foldoc-bin/foldoc.cgi?query=api&amp;amp">http://nightflight.com/foldoc-bin/foldoc.cgi?query=api&amp;amp</a>;action=Search</li>
<li>
<a href="http://searchwin2000.techtarget.com/sDefinition/0,,sid1_gci213778,00.html"></a><a href="http://searchwin2000.techtarget.com/sDefinition/0,,sid1_gci213778,00.html">http://searchwin2000.techtarget.com/sDefinition/0,,sid1_gci213778,00.html</a>
</li>
<li>
<a href="http://www.pcwebopedia.com/TERM/A/API.html"></a><a href="http://www.pcwebopedia.com/TERM/A/API.html">http://www.pcwebopedia.com/TERM/A/API.html</a>
</li>
</ul></font>
## What are the different kinds of API documentation?
<font size="2">
<p>The set of functions that an operating system, such as Windows, Apple Macintosh OS9 or OS X, etc provides for such simple tasks as responding to the mouse clicking on the image of a button, are one API. What I am documenting for Selectica Inc is an API that enables programmers to have their programs talk to a server that is proprietary to Selectica, than enables people (through a GUI) or programs (through the API) to create and use sets of business rules that enable a web site to accept orders for complex systems -- systems in which each component may have an effect on what each other component can be -- if you want to order an automobile, you pick a brand, this enables you to see a set of models; you pick a model, this enables you to see a set of engine choices; you pick an engine and you are offered a choice of stick shift or automatic, and so on. If you pick the convertible, you might be offered only a V6 or a V8, but if you pick a sedan, there may also be a V4 or a straight 6, and so on.</p>
<p>In any case, an API writer has to go in and explain a whole boatload of functions (in procedural programming) or objects and classes (in object-oriented programming). The writer must be able to read code well enough to pick out the definitions of all the access points and data structures, then describe them in an orderly fashion for the programmer audience.</p></font>
## What are the common tools used?
<font size="2">
<p>Tools used for documenting APIs? Framemaker (or, in some cases, Microsoft Word) for text formatting and layout. Javadoc (<a href="http://java.sun.com/products/jdk/1.2/docs/tooldocs/solaris/javadoc.html#doclets"></a><a href="http://java.sun.com/products/jdk/1.2/docs/tooldocs/solaris/javadoc.html#doclets">http://java.sun.com/products/jdk/1.2/docs/tooldocs/solaris/javadoc.html#doclets</a>) and Doxygen (<a href="http://www.stack.nl/~dimitri/doxygen/)and"></a><a href="http://www.stack.nl/~dimitri/doxygen/">http://www.stack.nl/~dimitri/doxygen/</a>)and similar tools for extracting data definitions and class and method declarations. Perhaps Visio or other graphic tools to draw UML (Unified Modeling Language) diagrams or flow charts.</p></font>
## Where are the typical jobs for API writers?
<font size="2">
<p>In software companies -- Silicon Valley, Route 128 (Boston area), <br>Triangle Park (Carolinas), Redmond Washington.</p></font>
## How can a writer get into writing API Documentation? & Is there any specific training one needs to take?
<font size="2">
<p>Either be a programmer who turned to technical writing (as I did) or be a very competent technical writer who learns enough about programming. There are some courses -- the Silicon Valley chapter has one coming up on June 22 about the politics of Javadoc: <a href="http://stc-siliconvalley.org/seminars/seminars.htm"></a><a href="http://stc-siliconvalley.org/seminars/seminars.htm">http://stc-siliconvalley.org/seminars/seminars.htm</a><br>Jim Bisso has a course (<a href="http://www.bitzone.com/training.html"></a><a href="http://www.bitzone.com/training.html">http://www.bitzone.com/training.html</a>) and Berkeley and Santa Cruz extensions probably also have useful courses.</p></font>
## How technical need the person be?
<font size="2">
<p>Pretty technical, believe me.  </p></font>
## What would you like to say about your career as a API writer?
<font size="2">
<p>I have enjoyed it. As a programmer, I was often at the mercy of the API documentor -- now the shoe is on the other foot, and I need to remember just how little the reader might know about our product and how much the development engineers have neglected to tell me that I must dig out and pass along.  </p></font>
## What is your advice to students who want to become API writers?
<font size="2">
<p>Learn to program. You don't need to have written a compiler or an operating system, but at least know some application programming AND some systems programming to be able to think like your audience.<br></p></font>

  
  

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

