---
layout: post
title: BlogBook -- C07 -- Instant Outlining
category: story.radio.weblogs.com
tags: ["blogging"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>BlogBook :: C07 :: Instant Outlining</title>
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
 | Last updated: 6/5/2002; 8:35:17 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>BlogBook :: C07 :: Instant Outlining</b></font>

# Instant Outlining

Instant Outlining or IO as it's commonly called is the newest feature in Radio at the time of this writing.&nbsp; It is very powerful but it also isn't blogging as we think about it today.&nbsp; Radio, at its core, is really based on the idea of an outline -- a hierarchical data model.&nbsp; You should note that "data model" is a fancy computer term that really just means how data is structured in a program.&nbsp; Everything in Radio is really just an outline, even scripts in UserTalk are outlines.&nbsp; What Instant Outlining does is allow you to create an outline and then share it in real time over the Internet for others to see.&nbsp; It also allows you to "subscribe" to other people's outlines and view them within Radio's Outline editor.

The best analogy for IO is think of Instant Messaging where what you're sharing is real knowledge, not just short conversations.&nbsp; From one window, you have access to someone else's thinking.&nbsp; This is tremendously powerful.&nbsp;   
For example, think about writing a lengthy story in Radio.&nbsp; Depending on how you prefer to write, it can be a lot easier to structure that story first as an outline and then to write the actual story.&nbsp; Working at the outline level helps you get the structure of the story correct before drilling down to the details.&nbsp; Figure 7-XXX below is a picture of working in Radio's Outliner.&nbsp; At the top of the outline is some information of mine.&nbsp; Below that appear outlines for any of my "buddies" i.e. outlines to which I subscribe.&nbsp; From one place, I can see if they are online or offline and what they're working on.

![](http://www.fuzzygroup.com/writing/images/radiou1.gif)

Figure 7-XXX. XXX

##   
A Warning

You should know that this feature may not be 100% complete when you see it (it was still in beta when this book was written).&nbsp; Its been officially released and the UserLand developers have been using it daily for quite a while but it is "flying without a net".&nbsp;

## What's an Outline?

An outline is a hierarchical structure of information.&nbsp; Think of a book.&nbsp; The book has chapters.&nbsp; The chapters have sections.&nbsp; The structure of that information could be shown as:

> Book
> 
> > Chapter
> > 
> > > Section A&nbsp;
> > > 
> > > Section B

That's an outline.&nbsp; Very simple but very powerful.

## What's OPML?&nbsp; The Mug?

With Radio you've probably seen the term [XML](http://www.w3.org/TR/REC-xml).&nbsp; Just as XML is a way to represent information, so is OPML.&nbsp; The difference is that OPML is designed to represent outlines.&nbsp; Think of OPML as HTML for outlines.&nbsp; You really don't need to worry about it.&nbsp; The OPML Coffee Mug is an icon that represents "Here's how to see / subscribe to my outline".

## Using the Outliner

Up to this point we have really focused on using Radio through its web browser interface.&nbsp; Using Instant Outlining requires that you use the full Radio product, not the web browser interface.&nbsp; There is a whole different side to Radio -- its also an application that you run on your desktop.&nbsp; The first step in using Instant Outlining is to launch that application.

1. Right click on the Radio icon in the control panel area on your Windows System Tray or just click on it in the Macintosh Dock.&nbsp; 
2. From the Radio menu that pops up, choose the Open Radio command.&nbsp;&nbsp;&nbsp; This is going to launch the full blown Radio environment.&nbsp; What you should see is something like this:   
  
c07\_instantoutlining\_full\_radio.gif  
3. This is the full Radio environment.&nbsp; To get to the Outliner, you need to select it from the Radio menu with Radio -\> Outliner -\> My Outline.&nbsp; You now see the Outline Editor shown below (some content has been added to this outline for illustration purposes).  
  
c07\_instantoutlining\_full\_radio\_with\_io\_open.gif

When the Outliner is open, creating an outline is done by entering text as if you were in a word processor.&nbsp; Here are some of the most important keystrokes.

- Enter -- create a new level in the outline 
- Tab -- move an outline entry in a level 
- Shift Tab -- move an outline entry out a level 
- CTRL+X -- cuts an entire outline entry or level to the clipboard.&nbsp; Please note that you do not have to have a block marked to use this.&nbsp; CTRL+X can also delete an outline entry (if you don't paste it back in, it gets deleted) 
- CTRL+V -- paste in an outline entry that you've cut 
- CTRL+U -- move up 
- CTRL+D -- move down 
- CTRL+R -- move right 
- CTRL+L -- move left 
- CTRL+[ -- promote i.e. move up one level in the outline 
- CTRL+] -- demote i.e. move down one level in the outline 
- CTRL+K -- add hyperlink to the current outline element

When you create an Instant Outline, Radio automatically saves it to your blog as a file named "yourName.opml" in the instantOutliner subdirectory off your blog url.&nbsp; For example, my Instant Outline is located at [http://radio.weblogs.com/0103807/instantOutliner/](http://radio.weblogs.com/0103807/instantOutliner/).

## Subscribing to Outlines

A very powerful Instant Outlining feature is subscribing to outlines.&nbsp; This feature lets another user's outline appear dynamically in your outliner and be updated when the user changes the outline.&nbsp; To subscribe to another user's outline, choose the Radio -\> Outliner -\> Subscribe to Outline ... command from the Radio menu.&nbsp; This command pops open a dialog box where you can paste the url to that user's outline.&nbsp; Deleting an Instant Outline that you are subscribed to isn't well handled currently.&nbsp; For more on this, please see this.

[http://www.fuzzygroup.com/go/?deleteSubscribedOutline](http://www.fuzzygroup.com/go/?deleteSubscribedOutline)

## Buddy Lists and Connectivity Issues

Just like an Instant Messaging client, your Instant Outliner has a buddy list.&nbsp; The difference is that here your buddy list is the list of people whose outlines you subscribe to.&nbsp; And, as in an Instant Messaging client, Radio can indicate whether you are available or unavailable.&nbsp; There is no "I'm Away" feature in Radio so they seem to get this status information by&nbsp;keystroke monitoring and when you are inactive for some period of time, they make you "offline".&nbsp; At present there is no connection between the Radio buddy list and any other buddy lists that you have.

If you need to give someone the url to your instant outline then it should be something like what's shown below.

[http://radio.weblogs.com/usernum/instantOutliner/filename.opml](http://radio.weblogs.com/usernum/instantOutliner/filename.opml)&nbsp;

Where filename is generally the user's name in the format "firstLast" (the capitalization matters).&nbsp; If you want to see all of a user's Instant Outlines then just go to the instantOutliner subdirectory off their Radio url.&nbsp; For example:

[http://radio.weblogs.com/usernum/instantOutliner/](http://radio.weblogs.com/usernum/instantOutliner/)

## Using Prefs for your Outline

Radio's Prefs system&nbsp;controls your Instant Outline just as it does your blog.&nbsp; Outliner Preferences set several options:

- How often to poll -- how often does Radio update the instant outlines that you've subscribed to 
- Play sounds -- make a noise when new outlines arrive 
- Public folder -- a folder of your weblog where your outline is saved 

Outliner Preferences can only be accessed from the Radio -\> Outliner -\> Preferences command or from the URL below.&nbsp; They can't be accessed from the Prefs link on the Radio command bar.

[http://127.0.0.1:5335/system/pages/outlinerPrefs?page=1](http://127.0.0.1:5335/system/pages/outlinerPrefs?page=1)

## Working With Your Outline

Outlines are actually great tools for working with information.&nbsp; It's a fast way to write and easy to boot.&nbsp; Once you create an outline in Radio, you can export it as text or HTML with the&nbsp;Save commands on Radio's File menu.

## More on Instant Outlining

This section has really just touched the surface of Instant Outlining.&nbsp; For more on Instant Outlining, see [http://www.fuzzygroup.com/go/?instantoutlining](http://www.fuzzygroup.com/go/?instantoutlining).

  
  

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

