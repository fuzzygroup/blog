---
layout: post
title: Ah... If You Recently Installed Sendmail
date: 2002-10-09 06:35 +0000
category: inbox_buddy
tags: ["inbox_buddy", "sendmail"]
---
<p>I'd go read this document:</p>
<blockquote dir="ltr" style="MARGIN-RIGHT: 0px">
<p>The CERT/CC has received confirmation that some copies of the source code for the Sendmail package have been modified by an intruder to contain a Trojan horse. 
<p>The following files were modified to include the malicious code:</p>
<blockquote><font face="courier">sendmail.8.12.6.tar.Z<br>sendmail.8.12.6.tar.gz<br></font></blockquote>
<p>These files began to appear in downloads from the FTP server ftp.sendmail.org on or around September 28, 2002. The Sendmail development team disabled the compromised FTP server on October 6, 2002 at approximately 22:15 PDT. It does not appear that copies downloaded via HTTP contained the Trojan horse; however, the CERT/CC encourages users who may have downloaded the source code via HTTP during this time period to take the steps outlined in the <a href="https://web.archive.org/web/20021013031121/http://www.cert.org/advisories/CA-2002-28.html#solution">Solution</a> section as a precautionary measure.</p>
<p>The Trojan horse versions of Sendmail contain malicious code that is run during the process of building the software. This code forks a process that connects to a fixed remote server on 6667/tcp. This forked process allows the intruder to open a shell running in the context of the user who built the Sendmail software. There is no evidence that the process is persistent after a reboot of the compromised system. However, a subsequent build of the Trojan horse Sendmail package will re-establish the backdoor process.</p>
<p><a href="https://web.archive.org/web/20021013031121/http://www.cert.org/advisories/CA-2002-28.html">[ More ]</a></p></blockquote>
<p dir="ltr">Before anyone rails on Open Source being such an informal thing that it allows this type of stuff to happen I'd point out the many, many security advisories from Microsoft alone this year.&nbsp; Each approach has it's pros and cons and even Microsoft can have malicious staff members.&nbsp; I'd also suspect that this event will force many Open Source staffers to crack down more on the build process.</p>
<p dir="ltr">And, in closing, I'd comment that Sendmail has had issues for a long time and perhaps it's time to look at <a href="https://web.archive.org/web/20021013031121/http://www.qmail.org/">Qmail</a>.&nbsp; Qmail is Open Source and just plain awesome although I'll admit it can be a prick to install and configure.&nbsp; Once up though it's absolutely rock solid.&nbsp; I got my buddy <a href="https://web.archive.org/web/20021013031121/http://www.apokalyptik.com/">Apokalyptik</a> to install and support it for me on a contract basis and it's been stellar.&nbsp; Apparently it's also been more than a year (I think it's actually several years) without a security alert.&nbsp; Recommended.</p>