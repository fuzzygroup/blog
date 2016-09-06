---
layout: post
title: Scotts Radio -- Missing Sections
category: story.radio.weblogs.com
tags: ["blogging"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Scotts Radio :: Missing Sections</title>
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
 | Last updated: 8/20/2002; 9:22:37 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Scotts Radio :: Missing Sections</b></font>

# Troubleshooting Your Radio Installation

Radio is a very sophisticated product and, although it usually installs correctly, there sometimes can be problems. Those problems are discussed below.

The most common problem people have after installing Radio is that their machine already has a web server installed. Radio has its own web server built in that, by default, wants to use port 80, the standard port for web servers. If your machine has a web server already that runs on port 80 then you will see this dialog box shown in Figure 3-5 when you start Radio.

<?xml:namespace prefix = v /><shapetype id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f"><stroke joinstyle="miter"></stroke><formulas><f eqn="if lineDrawn pixelLineWidth 0"></f><f eqn="sum @0 1 0"></f><f eqn="sum 0 0 @1"></f><f eqn="prod @2 1 2"></f><f eqn="prod @3 21600 pixelWidth"></f><f eqn="prod @3 21600 pixelHeight"></f><f eqn="sum @0 0 1"></f><f eqn="prod @6 1 2"></f><f eqn="prod @7 21600 pixelWidth"></f><f eqn="sum @8 21600 0"></f><f eqn="prod @7 21600 pixelHeight"></f><f eqn="sum @10 21600 0"></f></formulas><path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"></path><?xml:namespace prefix = o /><lock v:ext="edit" aspectratio="t"></lock></shapetype><shape id="_x0000_i1025" style="WIDTH: 321.75pt; HEIGHT: 104.25pt" type="#_x0000_t75"><imagedata src="file:///N:/temp/msoclip1/01/clip_image001.png" o:title=""></imagedata></shape> ![](http://radio.weblogs.com/0103807/images/radio_5.jpg)

Figure 3-4. Dialog seen when web server already installed.

Radio needs a port.&nbsp; This can be any number from 1 to 65,535 but these are common choices:

- 

5335

- 

8080

- 

8081

- 

8082

The advantage to running Radio on port 80 is that it lets you access your weblog on your own machine without having to specify the port as part of the URL. Here are examples both ways:

- 

[http://127.0.0.1/](http://127.0.0.1/)&nbsp;&nbsp;&nbsp; (port 80)

- 

[http://127.0.0.1:5335/](http://127.0.0.1:5335/)

## Getting Rid of Formatting

This technique only applies to using the WYSIWYG Editor under Windows using Internet Explorer.&nbsp; If you copy and paste text from another application such as Internet Explorer, Microsoft Word or PowerPoint, the WYSIWYG Editor pastes the text with the same formatting as the original.

To paste text without the formatting, use Notepad as a temporary buffer.&nbsp; Since Notepad doesn't support formatting, pasting the copied text into Notepad and then copying it&nbsp;out of Notepad has the effect of retaining the text but losing the formatting.&nbsp; This will work with any ASCII editor, not just Notepad.

## Deleting Categories

At the time of this writing, deleting categories is not easy in Radio and there are real issues with where your content goes when this occurs.&nbsp; The best approach is to think out the categories you need, in advance, and then create them.&nbsp; Rather than delete categories, you can always create new categories and assign existing posts to them by editing the post and changing the category.

# Radio Tips and Tricks

Every software product has a few (or sometimes more than a few) "gotchas"those little things that trip you up from time to time.&nbsp; Here are some tips on Radio gotchas and how to address them.&nbsp; Please note that Radio is regularly updated and these problems may not exist in your copy of Radio.

&nbsp;

## A Note

This document could not have been written without the wonderful assistance gotten from the whole Radio community.&nbsp; My thanks go out to the following people who contributed to this document.&nbsp; They arent listed in any particular order so please dont read anything into this.

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Guy K. Haas

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Frank Steele

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Andy Fragen

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Steve Zellers

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Greg Kucharo

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mike Cohen

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rowan Brewer

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Paolo Valdemarin

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mark Yeager

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chris Janton

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Andrew Sylvester

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Roger Turner (who did such a fantastic job that I have to thank him again and again and again).

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lawrence Lee

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jake Savin

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dave Winer

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Robert Barksdale

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Russ Lipton

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Eszter Hargittai

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Robert Occhialini

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; K. Dadamo

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Philip Wolff

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; David Davies

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Buzzy Bruggeman

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Justin Klubnik

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mike Krus

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Eric Albert

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jeff Cheney

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kjartan Mannes

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Simone Bettini

If I have left anyone out, please let me know and Ill be happy to add you to the list.

## Gotchas Affecting Both Mac and PC

### Ctrl-A, Ctrl-C Is Your Friend

When you write anything in Radio you are working inside a web browserthe Radio Desktop Website concept.&nbsp; Web browsers aren't like a word processor.&nbsp; Even though you can format content and add pictures and such, don't think that Radio is a word processor.&nbsp; Here's the difference: Web browsers **lose data** all the time.&nbsp; We have all seen thisfill out a web form, submit it and, for some unknown reason, your form isn't posted.&nbsp; Normally this is more annoying than serious.&nbsp; In Radio it can be a disaster.&nbsp; Here's an example.&nbsp; You're writing a long post or story and you go to publish it.&nbsp; If that publish action isn't 100% perfect, you can lose everything you wrote.&nbsp; This may not seem like a big deal, at least until it happens to you.&nbsp; My recommendation is that before you ever publish anything in Radio you press two keystrokes: Ctrl-A (select all) and then Ctrl-C (copy).&nbsp; This copies everything you just wrote to the clipboard.&nbsp; If you have any problems publishing your work then you can always create a new post or story, paste it in and try again.&nbsp; This is a bit difficult but needs to be a habit that you train yourself to do consistently.

**NOTE:** This is more needed on Radio for Windows due to the use of the Internet Explorer rich editing control.&nbsp; This control DOES NOT retain information on back tracks so if you have problem posting, you can't backtrack to it.&nbsp; On a Mac (or if you aren't using the rich editing control) this isn't a problem.

**NOTE:** I refer to this as a "Condom" against losing data.

Practice safe blogging; Use Your Condom!!!.

### When Radio Won't Post

Periodically you may find that no matter what you do, Radio simply will not publish your work.&nbsp; Nothing happens when you click the&nbsp;Post to Weblog&nbsp;or Publish&nbsp;& Post buttons.&nbsp; This generally indicates that Radio has crashed even though it may appear to still be running (i.e. the Radio icon still shows up in the Windows system tray).&nbsp; Please note that one thing that can cause this on the Mac is a DSL or cable modem connection that goes down for only an instant and then comes back up.&nbsp; As Radio is a very network centric application, this apparently affects it seriously enough to need this option.&nbsp; Restarting the computer lets Radio run again but it will lose any unsaved data.

Here's how to troubleshoot this and correct it on a PC running Windows NT, 2000 or XP.

> 1. 
> 
> Right click the Radio icon in the Windows system tray and select Exit and Shut Down Radio.
> 
> 2. 
> 
> Re-Launch Radio and try publishing again.&nbsp; If this fails, proceed to step 3.
> 
> 3. 
> 
> Press Ctrl-Alt-Dell and select Task Manager from the list of options.&nbsp; Task Manager lets you see what programs are running and shut one down when it has crashed.&nbsp; The Windows task manager is shown in Figure 3-xx.

<shape id="_x0000_i1026" style="WIDTH: 309pt; HEIGHT: 456.75pt" type="#_x0000_t75"><imagedata src="file:///N:/temp/msoclip1/01/clip_image003.png" o:title=""></imagedata></shape> ![](http://radio.weblogs.com/0103807/images/radio_6.jpg)

Figure 3-xx.&nbsp; Task Manager

1. 

Click on the Processes Tab.&nbsp; Radio is considered a process not an application.

2. 

Click on the leftmost column, Image Name, to sort the list of processes by name.

3. 

Scroll down until you see Radio.exe.

4. 

Right click it and choose End Process from the menu.&nbsp; This will close Radio.&nbsp; You should now be able to re-launch Radio and publish without any problems.

Here's how to troubleshoot this and correct it on Macintosh running OS X.&nbsp;

1. 

From the Apple menu, choose the Force Quit command or press Command-Option-ESC.&nbsp;&nbsp; This displays the Force Quit dialog box.

2. 

Select the Radio application and choose Force Quit.

3. 

Confirm that you want to close Radio.&nbsp; You should now be able to relaunch Radio and publish without any problems.

The same Force Quit approach is used to close Radio in OS 9.&nbsp; You do need to bring the Radio application to the foreground before doing this.&nbsp; Please note that using Force Quit in OS 9 can be risky, as it can cause overall system instability and Radio will often automatically quit when you try launch it again.&nbsp; In this situation then you need to restart your Macintosh.

### Be Careful with Links

Even thought Radio works within a web browser it does a very good job of pretending that it is a desktop software application.&nbsp;&nbsp; It's quite easy to click on a link in the Radio command bar and lose content in the editing window.&nbsp; Please see the section above on Ctrl-A, Ctrl-C for why this occurs.

### Refresh After Changes

As Radio is used from a web browser, it suffers from the same issues as a browserthe need to occassionally refresh after changes.&nbsp; For example, after you change a Radio Prefs setting such as your Theme, you generally need to refresh your browser to see the new theme.&nbsp; You should be a bit careful with refresh, however, if you have text in the editing window when you click refresh since this can cause Radio to lose the content in your editing window.

### Learn to Source Edit

In any product that creates HTML there seems to be the need to change the HTML manually&nbsp;due to some problem, often a browser specific problem.&nbsp; Please keep in mind&nbsp;that Radio supports full HTML editing with the Source Edit option.&nbsp; While this does require knowing at least basic HTML, this is often the only way to solve formatting glitches.&nbsp; This is discussed in the section on Source Editing in the&nbsp;"Turn Up the Volume" section.&nbsp;

### File Urls

Although you can technically use File URLs such as&nbsp;[file:///](file:///)&nbsp;with Radio, it is not advised.&nbsp; Weblogs built with Radio are designed to be published out to the network where these urls will simply not work (File URLs specifically reference files on your local hard drive, not files on the network).&nbsp;

### Netscape, Mozilla and File Urls

If you are using File URLS, such as, these will not work correctly with either Mozilla or Netscape under OS9 or OSX.&nbsp; You need to user local urls in the format [[http://localhost/](http://localhost/)](http://localhost/)[[http://localhost/](http://localhost/)](http://localhost/) or [[http://127.0.0.1/](http://127.0.0.1/)](http://127.0.0.1/)[[http://127.0.0.1/](http://127.0.0.1/)](http://127.0.0.1/).

### Usernum Confusion

When you download Radio, it automatically assigns you a unique user number, a "usernum".&nbsp; If your blog is hosted at Radio.weblogs.com, your url is [[http://radio.weblogs.com/usernum/](http://radio.weblogs.com/usernum/)[http://radio.weblogs.com/usernum/](http://radio.weblogs.com/usernum/)](http://radio.weblogs.com/usernum/).&nbsp; This seems logical enough except that on the screen which tells you your usernum, Prefs -\> User Identity, it omits the preceding 0.&nbsp; For example, my usernum is 103807 but my url is [[http://radio.weblogs.com/0103807/](http://radio.weblogs.com/0103807/)[http://radio.weblogs.com/0103807/](http://radio.weblogs.com/0103807/)](http://radio.weblogs.com/0103807/).&nbsp;

### There's Always a Way

This is advice more than a "gotcha".&nbsp; Radio is a rich, deep, sophisticated product that has a tremendous amount of technology underneath the hood.&nbsp; With macros, the UserTalk scripting language, the underlying network engine and the diverse community of talented individuals that use Radio, there is always a way around any of these gotchas.&nbsp; It may take a bit of head scratching and perhaps consulting someone else but&nbsp;they are pretty much all addressable.

## PC-Specific Radio Gotchas

Covered below are PC specific gotchas that affect Radio.

### Configuring Internet Explorer 

The default configuration for Internet Explorer for Windows will almost certainly cause you to lose work in Radio.&nbsp; By default Internet Explorer does what is called "Reusing Browser Windows".&nbsp; This means that if you are writing a post in Radio, stop to check email and then click on a link within a message, Internet Explorer can "reuse" an existing browser window.&nbsp; And that existing window could be a Radio window where you are writing a post.&nbsp; When this happens your post isn't saved at allremember when authoring in Radio, it's really just a web form.&nbsp; To prevent this you can set an Internet Explorer option that forces IE to open new windows for new links.

Set this option with these steps.

1. 

Go into Internet Explorer.

2. 

Select Tools -\> Internet Options -\> Advanced and then turn off the setting for "Reuse windows for launching shortcuts".&nbsp;&nbsp; Figure 3-xx shows the Internet Options option.

<shape id="_x0000_i1027" style="WIDTH: 304.5pt; HEIGHT: 339pt" type="#_x0000_t75"><imagedata src="file:///N:/temp/msoclip1/01/clip_image005.png" o:title=""></imagedata></shape> ![](http://radio.weblogs.com/0103807/images/radio_7.jpg)

Figure 3-xx.&nbsp; Internet Options

Click Ok to close the Internet Options dialog.

Internet Explorer will now open all shortcuts in new windows.

### Using Non-IE Browsers 

On the PC Radio is designed to use the current browser to which your computer defaults.&nbsp; Unfortunately, even if you modify Radio's internal settings in the .root file,&nbsp;for the path and executable to the browser, it fails to use them regularly and still uses Internet Explorer.

### Changing Between Publishing Destinations

If you change your publishing destination from radio.weblogs.com to FTP and then back to radio.weblogs.com, certain internal Radio links will not work such as the Home link to the right of your editing window (under the Cloud Links section).&nbsp; These links seem to "get stuck" on the FTP location rather than recognizing the new destination for your blog.&nbsp; A fix for this is available here:

[http://www.fuzzygroup.com/go/?radioChangeLocation](http://www.fuzzygroup.com/go/?radioChangeLocation)

## Macintosh Specific Radio Gotchas

Covered below are Macintosh specific gotchas that affect Radio.

### Don't Move the Radio Folder

This gotcha is Macintosh specific and affects both OS 9 and OS X.&nbsp; Traditionally Macintosh users have been accustomed to have been accustomed to moving folders with programs in them after they have run the program.&nbsp; Do not do this with Radio.&nbsp; Running Radio for the first time sets up file paths within its internal user table that are needed later. If you move the Radio folder you will have a very difficult to troubleshoot problem.&nbsp; Should this happen to you, a script to fix your Radio installation is available from:

[http://www.fuzzygroup.com/go/?fixMacRadioPaths](http://www.fuzzygroup.com/go/?fixMacRadioPaths)

### No WYSIWYG Editing

Microsoft, in Internet Explorer for the PC, makes available a feature called WYSIWYG editing which lets a developer embed a "what you see is what you get" editor in your web application i.e. one that shows bold facing as bold, displays pictures and so on.&nbsp; This feature is not available in IE for the Mac at all.&nbsp; Despite this, UserLand displays the option for Mac users when it is nonfunctional.&nbsp; When you see the WYSYIWG radio button simply ignore it after you have set it to Source View.&nbsp;

### Browser Performance Under OS 9

Using Internet Explorer and Radio under OS 9 or the Classic environment of OS X can give slow performance.&nbsp; The problem here is actually not Radio but errors in Internet Explorer itself where it fails to properly release CPU cycles to other Macintosh applications.&nbsp; This has been corrected in the new Internet Explorer for OS X.&nbsp; If you are on OS 9 an option may be to switch to a non-Microsoft browser but please see the next section first.&nbsp; For more on this, please see:

[http://radio.userland.com/tips/macintoshPerformance](http://radio.userland.com/tips/macintoshPerformance)

### Using Non-IE Browsers

If you are using Radio with a non Internet Explorer browser such as Opera, iCab or OmniWeb&nbsp;then you may experience some level of problems such as Radio asking you tell it where Internet Explorer is located.&nbsp; To minimize these problems, use the steps below.&nbsp; Unfortunately, even with these options changed, you may still have some problems with non-IE browsers.

1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Set your non-IE browser as the default browser on the Web Tab of your Internet control panel.

2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Close your Internet control panel and retry using Radio.

If you are using Netscape or Mozilla please see next topic.

### No Control Over Browser Window

When you open the Radio application on Mac OS X, it loads then spends a minute checking with Userland's servers and then instantly loads the Desktop Web Site (i.e. the 127.0.0.1 Local Home Page) into the uppermost Internet Explorer browser window; no matter what you have open or might be doing in that window.&nbsp; This can cause Radio to take over a browser window that you might need.&nbsp; If you use either Internet Explorer or Mozilla this can be addressed with the Preferences command.

To correct this in Internet Explorer for OS X use these steps.

1. 

Select the Internet Explorer Preferences command.

2. 

Select the Web Browser options.

3. 

Select Interface Extras.

4. 

Under the section titled "When another app asks IE to go to a page", check off the "Open a new browser window" option.

5. 

Close the Preferences command.

To correct this in Mozilla for OS X use these steps.

1. 

Select the Mozilla Preferences command.

2. 

Select the Advanced options.

3. 

Select Scripts & Windows.

4. 

Check off the boxes "Open unrequested windows" and "Open a link in a new window".

5. 

Close the Preferences command.

### Allocate Additional RAM on OS9

If you are running OS 9, not OS X, you should allocate additional RAM memory to Radio.&nbsp; If you don't you will see definite performance problems.&nbsp; Other strange errors could also occur such as problems accessing the Radio menu system.&nbsp;&nbsp;Depending on your OS 9 settings, you may need to check this after upgrading to a new version of Radio to make sure that the setting wasn't lost.

### More on Publishing Problems

If you find Radio is not publishing new postings when running OS X, and the step described above that describes how to close Radio completely does not help, then you may find that Radio publishes your work on the next day. This sounds a bit strange and it is, but it seems to be the case.

### Incorrect URLs when Switching Upstreaming Locations

Given that OS X includes both web (Apache) and FTP servers, many Mac webloggers are initially choosing to&nbsp;FTP to their local servers.&nbsp; This allows easy experimentation out of the public eye.&nbsp; It also allows you to check your work offline since your FTP and web servers are local rather than off at the UserLand servers.&nbsp; However, if you then swap back to the UserLand servers, there is a serious problem where Radio puts the local address (127.0.0.1) in the directory structure for images rather than the UserLand address.&nbsp; The only real way to fix this is to use a UserTalk script.&nbsp; UserTalk is Radio's scripting language which is covered in Chapter 7.&nbsp; Please see the section on UserTalk before trying to use this as it can be confusing.&nbsp; Please note that a newer version of this script might be available from the link below.

1. 

Open the Full Radio application by choosing Open Radio from the Radio icon in the Dock.

2. 

Choose Tools -\> Developers -\> Quick Script

3. 

Enter the script below:

> user.scheduler.prefs.runThreads = false;
> 
> scheduler.monitorThreads ();
> 
> local (usernum = string.padWithZeros (user.radio.prefs.usernum, 7));
> 
> local (homeUrl = "[[http://radio.weblogs.com/](http://radio.weblogs.com/)](http://radio.weblogs.com/)<u><span style="COLOR: blue; mso-font-kerning: 18.0pt"><a href="http://radio.weblogs.com/">http://radio.weblogs.com/</a></span></u>" + usernum + "/");
> 
> user.radio.settings.files[1].upstream.url = homeUrl;
> 
> local (adrPing = @radio.thread.agents.pingCloud);
> 
> system.temp.timers.[adrPing] = date (0);
> 
> radio.thread.agents.pingCloud ();
> 
> radio.weblog.publish ();
> 
> user.scheduler.prefs.runThreads = true;
> 
> scheduler.monitorThreads ();

1. 

Click Run to fix your links.

2. 

Choose Radio-\>Publish-\>Entire Website to publish the fixed links to your weblog.

A copy of this script can be downloaded from:

[[http://www.fuzzygroup.com/go/?fixMacIPs](http://www.fuzzygroup.com/go/?fixMacIPs)](http://127.0.0.1:5335/system/go/?fixMacIPs)

# Instant Outlining

At the core of Radio is an integral Outliner.&nbsp; While not strictly related to blogging, outlining is a nifty feature of Radio Userland that is worth trying.&nbsp; An outline is just thata document structured into nested levels.&nbsp; An outline being edited is shown below.

<shape id="_x0000_i1028" style="WIDTH: 182.25pt; HEIGHT: 2in" type="#_x0000_t75"><imagedata src="file:///N:/temp/msoclip1/01/clip_image007.png" o:title=""></imagedata></shape> ![](http://radio.weblogs.com/0103807/images/radio_8.jpg)

An Outline

Why use outlines?&nbsp; The simple structure provided by an outline often helps you gather and organize your thoughts.&nbsp; Outlines form a convenient basis for ToDo lists, documentation, even source code.

Radio manipulates outlines in an XML format called OPML (Outline Processor Markup Language).&nbsp; It can also export them to HTML and plain text, so you can use the outliner to create Radio posts and stories.&nbsp; Radio lets you create and edit outlines, as well as subscribe to them as you would subscribe to an RSS feed of someones blog.

## Using Radio's Outliner

Up to now, we have focused on using Radio through its web browser interface.&nbsp; Using Instant Outlining requires that you use the full Radio product, not the web browser interface.&nbsp; This is a whole different side to Radio, the application that runs on your desktop.

The first step in using Instant Outlining is to bring up the Radio application.

1. 

Right click on the Radio icon in the control panel area on your Windows System Tray (Macintosh users launch it from the Dock).

2. 

From the Radio menu that pops up, choose the Open Radio command.&nbsp;&nbsp;&nbsp; This brings up the Radio application window (see Figure 7-xx).

3. 

To get to the Outliner, you need to select it from the Radio menu with Radio -\> Outliner -\> My Outline.&nbsp; You now see the Outline Editor shown in Figure 7-XXX.

<shape id="_x0000_i1029" style="WIDTH: 196.5pt; HEIGHT: 128.25pt" type="#_x0000_t75"><imagedata src="file:///N:/temp/msoclip1/01/clip_image009.png" o:title=""></imagedata></shape> ![](http://radio.weblogs.com/0103807/images/radio_9.jpg)

Figure 7-xx.&nbsp; Radio Application

When the Outliner is open, you can treat it as a word processor and simply start typing.&nbsp; The Outline menu has options for changing the structure and your view of that structure.&nbsp; For example, you can collapse an entry (paragraph) so that you cant see its children, or expand it again to get more detail.

Here are some of the most important keystrokes.

> Enter
> 
> > Create a new level in the outline.
> 
> Tab
> 
> > Move an outline entry in a level.
> 
> Shift Tab
> 
> > Move an outline entry out a level.
> 
> Ctrl-X
> 
> > Cut the current entry, and its children, to the clipboard.&nbsp; You do not have to have a block marked to use this.&nbsp; Use Ctrl-X to delete an outline entry (if you don't paste it back in, it gets deleted)
> 
> Ctrl-V
> 
> > Paste an outline entry.
> 
> Ctrl-U
> 
> > Move the current entry up the list of visible entries.
> 
> Ctrl-D
> 
> > Move the current entry down the list of visible entries.
> 
> Ctrl-R
> 
> > Move the current entry right (make it more nested).
> 
> Ctrl-L
> 
> > Move the current entry left (make it less nested).
> 
> Ctrl-[
> 
> > Promote the current entry (move up one level in the outline).
> 
> Ctrl-]
> 
> > Demote the current entry (move down one level in the outline).
> 
> Ctrl-K
> 
> > Add a hyperlink to the current outline element.
## Exporting Outlines

Radios File menu has "Save as HTML" and "Save as Plain Text" options that let you export your outline in those formats.

## Re-installing Radio on Windows

**NOTE:** Since writing this, I've reinstalled Radio on Windows 3 or 4 times.&nbsp; Sometimes I was successful.&nbsp; Sometimes I wasn't.&nbsp; I do not take any responsibility if these instructions do not work or your blog disappears from the Internet temporarily (as mine did one time).

You probably will never need to re-install Radio on Windows but it does happen (Mac re-installation is much more rare). You may have an unsolvable bug or need to recover from a machine crash. Given that Radio doesn't store its data in My Documents, re-installation can be complex.

Here is the full process for backing up Radio before re-installing it, as well as the information to write down before you delete your existing installation. This process saves everything, even things that you might not need until you are sure that your new copy of Radio is re-installed.

1. 

Make note of your user number by looking at the "User Identity" option under the Prefs screen. Radio can always send this to you again but it's best to have it.

2. 

Shut down Radio by right clicking the Radio icon in the Windows System Tray (bottom right by default) and choosing Shut Down Radio. This is important because Radio normally runs in the background and regularly updates files that you might be in the process of backing up.

3. 

Copy all of program filesradio userland to backupdir (a new directory where you want to store the backed up files).

4. 

Run Radio Uninstall from the Windows Start -\> Programs -\> UserLand menu.

5. 

Install your new copy of Radio.

6. 

Enter your usernum and password into the 2nd section of the configuration web page. If you can't remember them then you can use this web page to ask UserLand to mail them to you.

7. 

DO NOT START RADIO YET.

8. 

DO NOT CREATE ANY WEBLOG ENTRIES YET!

9. 

Shut down Radio as in Step #2.

10. 

Copy all of the following files from backupdir to newdir where newdir is the new directory where you installed Radio.

> Radio UserLandData Files
> 
> Radio UserLandwww
> 
> Radio UserLandThemes
> 
> Radio UserLandBackups (yes this is redundant but it's safer)
> 
> Radio UserLand\*.root
1. 

Copy everything in backupdirwww to newdirwww.

2. 

Start Radio with Windows Start -\> Programs -\> UserLand -\> Radio UserLand.

All of your previous blog entries should be available right from the main Radio home page.

&nbsp;

&nbsp;<font size="2"> </font>

#### Copyright

<font size="2">Copyright (c) 2002, J. Scott Johnson. Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.1 or any later version published by the Free Software Foundation; with no Invariant Sections being, with no Front-Cover Texts, and with no Back-Cover Texts. A copy of the license is included in the section entitled "</font><font size="2">Appendix 1 - Terms of Use</font><font size="2">". </font>

<font size="2"><strong>Note:</strong> I'm new to writing a Free Documentation statement and the above might not be perfect. </font>

<script src="http://radiocomments.userland.com/comments?u=103807&amp;c=counts" type="text/javascript"></script>[comment&nbsp;[<script type="text/javascript" language="JavaScript">commentCounter ("stories/2002/08/20/scottsRadioMissingSections")</script>]](http://radiocomments.userland.com/comments?u=103807&p=stories%2F2002%2F08%2F20%2FscottsRadioMissingSections&link=http%3A%2F%2Fradio.weblogs.com%2F0103807%2Fstories%2F2002%2F08%2F20%2FscottsRadioMissingSections.html "Click here to comment on this page.")

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

