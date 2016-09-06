---
layout: post
title: Open Source 101- Performance of Open Source Portal Software
category: story.radio.weblogs.com
tags: ["open_source"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>Open Source 101: Performance of Open Source Portal Software</title>
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
 | Last updated: 6/16/2002; 10:21:00 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>Open Source 101: Performance of Open Source Portal Software</b></font>

Published: May, 2002

I have been a small part of the Open Source community since 1996 and I've been a regular Unix user since 1986.&nbsp; These technologies, which grew up on the Internet, offer compelling benefits for most organizations.&nbsp; A recent experience with an Open Source portal application, Drupal, pointed out to me just how good the performance of Open Source applications can be - when it is done correctly.

# _<font face="Arial" size="3">What Is Open Source?</font>_

<font face="Arial">At its very heart, Open Source is a philosophy that basically says "People should have access to the source code of their software and not be controlled by a vendor". While Open Source software is usually free, this definition says nothing about money - the Open Source movement is about freedom. It's the freedom to make changes as needed and freedom from being locked in by vendors. What organization, in today's technology world, hasn't been harmed by one vendor or another? Horror stories abound about bad vendors and with good reason. Open Source solves these issues once and for all by giving your organization full control.</font>

<font face="Arial"><b>NOTE</b>: The term Open Source is itself controversial.<span style="mso-spacerun: yes">  </span>Depending on the license agreement used, the term Free Software or Free Open Source Software is technically more accurate.<span style="mso-spacerun: yes">  </span>In this document Open Source, Free Software and Free Open Source Software are synonymous. </font>

# _<font face="Arial" size="3">Open Source Performance Issues Discussed</font>_

<font face="Arial">In software good performance is a function of good engineering.<span style="mso-spacerun: yes">  </span>And good engineering is found in both commercial and open source applications.<span style="mso-spacerun: yes">  </span>The interesting aspect of open source software (OSS) with respect to performance is that often OSS applications dramatically outperform commercial software by orders of magnitude with tiny engineering teams and outdated hardware to boot.<span style="mso-spacerun: yes">  </span>You should not, however, get the idea that all OSS has good performance.<span style="mso-spacerun: yes">  </span>OSS can be as bad or worse as commercial software in certain areas. </font>

# _<font face="Arial" size="3">Open Source Performance Illustrated: KernelTrap</font>_

<font face="Arial">Performance is always one of those things that computer people debate at great length.<span style="mso-spacerun: yes">  </span>For myself, performance is best illustrated by example, not by statistic.<span style="mso-spacerun: yes">  </span>On May 28, 2002, the web site www.kerneltrap.org was featured on Slashdot.<span style="mso-spacerun: yes">  </span>Slashdot, for those unfamiliar with it, is a website which is extremely popular with computer people.<span style="mso-spacerun: yes">  </span>Its a virtual certainty, that whenever a web site is featured on Slashdot, tens of thousands of people will view it within a very short time generally a few hours.<span style="mso-spacerun: yes">  </span>This is now common enough that the phrase my site was slashdotted is actually common in web development circles.<span style="mso-spacerun: yes">  </span>More than a few websites have been brought to their knees by the Slashdot effect.</font>

<font face="Arial">The KernelTrap site runs an Open Source portal / content management platform known as Drupal, available via the GPL.<span style="mso-spacerun: yes">  </span>Drupal, developed primarily in Europe, is built with PHP and MySQL.<span style="mso-spacerun: yes">  </span>The Drupal team has taken the product up to version 3.0.2 and now is close to a release of their 4.0 platform.<span style="mso-spacerun: yes">   </span>For more info about Drupal, please see <a href="http://www.drupal.org">http://www.drupal.org</a>.</font>

<?xml:namespace prefix = o ns = "urn:schemas-microsoft-com:office:office" />

<font face="Arial"> </font>

# _<font face="Arial" size="3">Actual Performance Statistics</font>_

<font face="Arial">Here are the actual statistics for the KernelTrap site for a portion of the month of May.<span style="mso-spacerun: yes">  </span>The day of the Slashdot reference is near the bottom, in the wider, red row.<span style="mso-spacerun: yes">  </span>Its important to note that the overall traffic load increased <b>six fold</b> due to the Slashdot effect yet Drupal kept running.</font>

<font face="Arial"> </font>

| 

**&nbsp;**

 |
| 

<font size="2"><font face="Times New Roman"><b>Daily Statistics for May 2002</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 |
| 

**&nbsp;**

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 |
| 

<font size="2"><font face="Times New Roman"><b>Day</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>Hits</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>Files</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>Pages</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>Visits</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>Sites</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>KBytes</b><b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></b></font></font>

 |
| 

**&nbsp;**

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 |
| 

<font size="2"><font face="Times New Roman"><b>1</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>9203</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.86%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>7126</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.76%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>3777</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.02%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1959</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.08%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1360</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.90%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>92448</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.35%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 | 

&nbsp;

 |
| 

<font size="2"><font face="Times New Roman"><b>21</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>18613</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.77%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>14418</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.56%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>6481</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.47%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>2929</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.11%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>2226</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">4.75%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>180626</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.65%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b>22</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>16242</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.29%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>12260</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.03%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>6010</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.21%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>2687</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.85%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1992</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">4.25%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>163631</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.40%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b>23</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>14318</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.90%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>10798</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.67%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>4872</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.61%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>2507</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.66%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1858</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.96%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>139306</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.04%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b>24</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>14561</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.95%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>11191</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.77%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>5300</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.84%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>2505</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.66%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1812</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.87%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>144529</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.12%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b>25</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>10669</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.16%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>8216</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.03%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>3730</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.00%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1940</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.06%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1370</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.92%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>106995</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.57%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b>26</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>9597</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.94%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>7537</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.86%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>3511</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.88%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1788</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.90%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1264</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.70%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>91114</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.33%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b>27</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>12180</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.47%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>9128</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.26%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>4670</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.50%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>2317</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.46%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>1625</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.47%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>117781</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">1.73%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b><span style="COLOR: red">28</span></b><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b><span style="COLOR: red">75396</span></b><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt; COLOR: red">15.27%</span><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b><span style="COLOR: red">68356</span></b><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt; COLOR: red">16.89%</span><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b><span style="COLOR: red">30812</span></b><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt; COLOR: red">16.48%</span><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b><span style="COLOR: red">19039</span></b><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt; COLOR: red">20.21%</span><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b><span style="COLOR: red">15888</span></b><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt; COLOR: red">33.90%</span><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b><span style="COLOR: red">1542238</span></b><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt; COLOR: red">22.59%</span><span style="FONT-SIZE: 12pt; COLOR: red; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

<font size="2"><font face="Times New Roman"><b>29</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font size="2"><font face="Times New Roman"><b>13790</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.79%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>12280</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.03%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>5344</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">2.86%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>3267</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">3.47%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>2989</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">6.38%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 | 

<font size="2"><font face="Times New Roman"><b>329425</b><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font></font>

 | 

<font face="Times New Roman"><span style="FONT-SIZE: 7.5pt">4.83%</span><span style="FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Arial Unicode MS'; mso-bidi-font-family: 'Times New Roman'"><p></p></span></font>

 |
| 

**&nbsp;**

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 | 

<font face="Times New Roman" size="2"> </font>

 |

<font face="Arial"> </font>

# _<font face="Arial" size="3">Real Time Performance Metrics</font>_

<font face="Arial">I am in fairly regular contact via Instant Messaging with one of the Drupal Team Leads and I learned about this in real time as it occurred.<span style="mso-spacerun: yes">  </span>By auditing the Apache log files, as the Slashdot traffic was first arriving (i.e. when the reference to the site was above the fold), Kjartan gave me these statistics:</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">Almost 16,000 hits from Slashdot.org and all its sub-domains in a 4 hour period</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">Another 3,000 hits from other sites linking to the story </font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">50 hits per minute on average, all served from a MySQL database through the Drupal code</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">100 hits per minute at times, again all served from a MySQL database through the Drupal PHP code</font>

<font face="Arial"> </font>

# _<font face="Arial" size="3">Hardware</font>_

<font face="Arial">Performance is relative to lots of different factors but, by illustrating it with specific examples, a good feel for it can be arrived at.<span style="mso-spacerun: yes">   </span>Heres their current hardware and OS setup:</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">A PII 300 mhz Intel server, single processor (thats about a $300 box in todays dollars, if that much).<span style="mso-spacerun: yes">  </span>This box runs the web server, database server and Drupal itself.</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">512 megs of RAM and 512 megs of Cache</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">100 megabit connection to the UUNet backbone</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">RedHat Linux 7.2 with the 2.4.9 kernel</font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">Apache 1.3.22 &amp; MySQL </font>

q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial">Drupal 3.0.2 (with caching)</font>

# _<font face="Arial" size="3">Optimizations</font>_

<font face="Arial">The KernelTrap website took advantage of the standard Drupal caching option which reduces dynamic page generation to 2 database calls, 1 to fetch the user id and 1 to get the cached page from the database itself.<span style="mso-spacerun: yes">  </span>An additional optimization, turning off unused modules, was not used at first.<span style="mso-spacerun: yes">  </span>Once the site was getting &gt;60 hits per minute, this became necessary.<span style="mso-spacerun: yes">  </span>In real time, as Drupal was serving pages, the unused modules were turned off and performance increased.<span style="mso-spacerun: yes">  </span>An additional tuning step of increasing the cached setting from 30 seconds to 10 minutes was also used.<span style="mso-spacerun: yes">  </span>The total tuning time, admittedly by an experienced Drupal administrator, was <b>3 minutes</b>.</font>

<font face="Arial"> </font>

<font face="Arial"><b>NOTE:</b> This is not recommended.<span style="mso-spacerun: yes">  </span>It is far better to optimize your site before this happens.</font>

# _<font face="Arial" size="3">A Side Note: Support</font>_

<font face="Arial">Just as a side note, people often complain about support in the OSS world.<span style="mso-spacerun: yes">  </span>Just as performance can be good or bad in the OSS world, so too can support be good or bad.<span style="mso-spacerun: yes">  </span>In this case the quality of support in the OSS world was illustrated as soon as one of the team leads for Drupal was alerted to the situation, he pitched in and helped tune the software.<span style="mso-spacerun: yes">  </span>What happened here was that when the owner of the Kernel Trap site noticed that the Drupal page was maxing out on performance due to his own poor tuning (his term, not mine), he sent a request for help to the Drupal support mailing list.<span style="mso-spacerun: yes">  </span>Within minutes, I had support from Kjartan, Dries and Marco and through their help the tuning was quickly accomplished and I was back in business. (source email correspondence). </font>

# _<font face="Arial" size="3">Summary</font>_

<font face="Arial">Clearly these performance levels are dramatically above those of competing applications be they open source or commercial software.<span style="mso-spacerun: yes">  </span>These numbers speak volumes about the scalability of Drupal.<span style="mso-spacerun: yes">  </span>If you have any concerns about performance of your web applications, you need to take a look at Drupal.</font>

# _<font face="Arial" size="3">References</font>_

<font face="Arial">Download Drupal from <a href="http://www.drupal.org/">http://www.drupal.org/</a> and view a full community portal built with it at <a href="http://www.drop.org/">http://www.drop.org/</a>.<span style="mso-spacerun: yes">   </span>See <a href="http://kerneltrap.org/stats/usage_200205.html">http://kerneltrap.org/stats/usage_200205.html</a> for the full performance analysis.<span style="mso-spacerun: yes">  </span>KernelTrap is at <a href="http://kerneltrap.org/">http://kerneltrap.org/</a>.</font>

# _<font face="Arial" size="3">Disclaimer</font>_

<font face="Arial">The author of this document is also the author of a Drupal FAQ and is helping out on the project documentation.</font>

# _<font face="Arial" size="3">Credits</font>_

Thanks go out to Jeremy Andrews and Guy Haas for assisting in the production of this document.

#### _SideBar:_ 

<font face="Verdana,Geneva,Arial,Helvetica,Sans-Serif" color="#808080" size="3">Open Source Software Performance</font>

<u><span style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"><p><span style="TEXT-DECORATION: none"><strong> </strong></span></p></span></u>

**Why Can It Be Fast?**

<font size="2">q</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2">Its personal the engineering teams take speed seriously<p></p></font>

<font size="2">q</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2">Projects are cash poor and time rich its hard to buy big servers when you are doing it for free<p></p></font>

<font size="2">q</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2">Simple protocols and elegant architectures instead of complex, bloated design by committee<p></p></font>

<font size="2">q</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial" size="2">Generally built by brilliant, passionate people</font>

<font face="Times New Roman" size="2"> </font>

**Why Can It Be Slow?**

<font size="2">q</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2">Small teams that focus on features instead of architecture<p></p></font>

<font size="2">q</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2">Inexperienced programmers<p></p></font>

<font size="2">q</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2">Poor design choices<p></p></font>

&nbsp;

 ![](http://www.fuzzygroup.com/images/trackers/rt_0103807_story_opensource.gif)

  
  

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

