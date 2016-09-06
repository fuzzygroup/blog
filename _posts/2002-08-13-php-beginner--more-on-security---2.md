---
layout: post
title: PHP Beginner- More on Security - 2
category: story.radio.weblogs.com
tags: ["php"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>PHP Beginner: More on Security - 2</title>
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
 | Last updated: 8/13/2002; 9:35:50 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>PHP Beginner: More on Security - 2</b></font>

Note -- some of this is redundant with my other expansion on security.&nbsp; Some of it is probably not.&nbsp; I thought it might help some folks out.&nbsp; Hence the post.

<font face="Arial" size="2">Wow, I didn't mean to put you to that much work. Thanks alot!  It Works! Thank you so much :)</font>
> ----- Original Message ----- 
> 
> **From:** [J. Scott Johnson](mailto:scott@fuzzygroup.com "scott@fuzzygroup.com") 
> 
> **To:** XXX
> 
> **Sent:** Sunday, July 21, 2002 6:08 AM
> 
> **Subject:** RE: Handling Users and Passwords
> 
>   
> 
> <font face="Arial" color="#0000ff" size="2">Hi there, </font>
> 
> <font face="Arial" color="#0000ff" size="2"></font>&nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">I just hit the same problem myself and i think it's missing the header command to redirect you to another location i.e. after the cookies have been set and the user is authenticated then add this line: </font>
> 
> <font face="Arial" color="#0000ff" size="2"></font>&nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">  header("Location: control.php"); </font>
> 
> <font face="Arial" color="#0000ff" size="2"></font>&nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">where "control.php" is the url you want to go.</font>
> 
> <font face="Arial" color="#0000ff" size="2"></font>&nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">If that's not it then I'd check if the $num_rows returned by the database query is 1.  If not it may be that there isn't a fall thru on the last clause of the if test.  </font>
> 
> <font face="Arial" color="#0000ff" size="2"></font>&nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">NOTE: I just rewrote it from scratch since it was easier than going to <a href="http://www.phpbeginner.com/">www.phpbeginner.com</a> which desperately needs a "view entire article" feature.</font>
> 
> <font face="Arial" color="#0000ff" size="2"></font>&nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">Here's the full code I just rewrote:</font>
> 
> <font face="Arial" color="#0000ff" size="2"></font>&nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">&lt;?php<br><a href="//">//</a> <a href="//////////////////////////////////////////////////////">//////////////////////////////////////////////////////</a><br><a href="//">//</a> Mock loging page -- takes your login -- and sets<br><a href="//&amp;nbsp">//&amp;nbsp</a>; the correct cookie triad<br><a href="//&amp;nbsp">//&amp;nbsp</a>; ck_username<br><a href="//&amp;nbsp">//&amp;nbsp</a>; ck_emailaddress<br><a href="//&amp;nbsp">//&amp;nbsp</a>; ck_userid<br><a href="//&amp;nbsp">//&amp;nbsp</a>; ck_password<br><a href="//">//</a> <a href="/////////////////////////////////////////////////////">/////////////////////////////////////////////////////</a></font>
> 
> &nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">  include "../z/zcommon.php";</font>
> 
> &nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">  $link = mysql_connect("$dbhost", "$dbuser", "$dbpassword")<br>    or die("Could not connect");</font>
> 
> &nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">  <a href="//select">//select</a> the database<br>  mysql_select_db("$db")<br>    or die("Could not select database");<br>    <a href="//print">//print</a> "|$loginusername|";die();<br>  $query = "SELECT username, password, initials, emailaddress FROM fo_useremailaccounts where username='$loginusername' order by user_id limit 1";</font>
> 
> &nbsp;
> 
> <font face="Arial" color="#0000ff" size="2">  $result = mysql_query($query)<br>    or die ('&lt;H1 align=center&gt;&lt;font color=red&gt;Bad Database Request&lt;/font&gt;&lt;/H2&gt; in :&lt;BR&gt;'<br>    . __FILE__.' line '. __LINE__ <br>    .'&lt;BR&gt;&lt;br /&gt;&lt;b&gt;The query used was:&lt;/b&gt;&lt;BR&gt;&lt;BR&gt; '.$query<br>    .'&lt;BR&gt;&lt;br /&gt;&lt;b&gt;MySQL says&lt;/b&gt;&lt;BR&gt;&lt;BR&gt; '.mysql_error()<br>    .'&lt;BR&gt;&lt;BR&gt;Email administrator for help at ' . $sysadminemail . ' for help' );</font>
> 
> &nbsp;
> 
> <font color="#0000ff"><br><font face="Arial" size="2">  $num_rows = mysql_num_rows($result);<br>  <a href="//login">//login</a> succeeds if the query succeeds i.e. there is at least 1 user who matches<br>  if ($num_rows == 1) {<br>    $row = mysql_fetch_array($result);<br>    $password = $row["password"];<br>    $username = $row["username"];<br>    $emailaddress = $row["emailaddress"];<br>    $initials = $row["initials"];<br>    <a href="//print">//print</a> "in if";die();<br></font></font>
> 
> <font face="Arial" size="2">    if ($loginpassword == $password) {<br>    <a href="//">//</a> success!!! They have access</font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">      setcookie("ck_username",$username);<br>      setcookie("ck_password",$password);<br>      setcookie("ck_emailaddress",$emailaddress);<br>      setcookie("ck_userid",$userid);<br>      setcookie("ck_initials",$initials);</font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">      header("Location: </font>[<font face="Arial" size="2"><a href="http://www.fuzzygroup.net/fuzzyoffice/control_pagebody.htm">http://www.fuzzygroup.net/fuzzyoffice/control_pagebody.htm</a></font>](http://www.fuzzygroup.net/fuzzyoffice/control_pagebody.htm)<font face="Arial" size="2">");<br>      <a href="//print">//print</a> "doh!";</font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">    }<br>    else {<br>      print "Invalid login.  Access denied.";<br>    }<br>  }<br>  else {<br>    print "user not found in database";<br>  }<br>?&gt;<br></font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">L<span class="953595610-21072002">ogin form (with wildly different text than you need of course)</span></font>
> 
> <font face="Arial" size="2"><span class="953595610-21072002"></span></font>&nbsp;
> 
>   
> <font face="Arial" size="2">&lt;HTML&gt;<br>&lt;HEAD&gt;<br>&lt;TITLE&gt;<br>FuzzyGroup :: FuzzyOffice :: Login<br>&lt;/TITLE&gt;<br>&lt;BODY&gt;<br>&lt;center&gt;<br>&lt;table width=750&gt;<br>&lt;tr&gt;<br>&lt;td&gt;</font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">Welcome to the FuzzyOffice Login page.  This grants you access to the currently available FuzzyOffice modules including Tasks, Calendar, etc (oh and it also looks better than this very simple, very plain, very white page).  From this page you can either Login (if you have an existing account) or Register (if you need an account).<br>&lt;H1&gt;Login&lt;/H1&gt;<br>Use the form below if you are already a FuzzyOffice user.<br>&lt;form name=login action="mlogin.php" method="get"&gt;</font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">&lt;input type="hidden" name="action" value="login"&gt;<br>        Username:<br>        &lt;input name="loginusername" type="text" width="10"&gt;&lt;BR&gt;<br>        Password:<br>        &lt;input name="loginpassword" type="password" width="10"&gt;&lt;BR&gt;<br>        &lt;INPUT TYPE=SUBMIT VALUE=<a href="http://login.userland.com/">Log In</a>&gt;<br>        &lt;/form&gt;<br>&lt;h1&gt;Registration / Sign Up&lt;/h1&gt;<br>Use this form to sign up as a new user of FuzzyOffice.<br>&lt;form name=registration action="signup.php" method="get"&gt;<br>                Username:<br>                &lt;input name="signupusername" type="text" width="10"&gt;&lt;BR&gt;<br>                Password:<br>                &lt;input name="signuppassword" type="password" width="10"&gt;&lt;BR&gt;<br>                Verify your password:<br>                &lt;input name="signuppasswordverify" type="password" width="10"&gt;&lt;BR&gt;<br>                Email Address:<br>                &lt;input name="emailaddress" type="text" width="10"&gt;&lt;BR&gt;<br>                &lt;INPUT TYPE=SUBMIT VALUE="Sign Up"&gt;<br>        &lt;/form&gt;<br>&lt;/td&gt;<br>&lt;/tr&gt;<br>&lt;/table&gt;<br>&lt;/center&gt;<br>&lt;/BODY&gt;<br>&lt;/HTML&gt;<br></font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">Hope this helps.</font>
> 
> <font face="Arial" size="2"></font>&nbsp;
> 
> <font face="Arial" size="2">Scott</font>
> 
> <font face="Arial"><br><font size="2"></font></font>
> > <font face="Tahoma" size="2">-----Original Message-----<br><b>From:</b> Christopher Jeffrey [<a href="mailto:mailto:cjj@XXX">mailto:cjj@XXX</a>]<br><b>Sent:</b> Friday, July 19, 2002 7:57 PM<br><b>To:</b> <a href="mailto:scott@phpbeginner.com">scott@phpbeginner.com</a><br><b>Subject:</b> Handling Users and Passwords<br><br></font>
> > 
> > <font face="Arial" size="2">
> > <div><font face="Verdana" size="2">Hello,</font></div>
> > <div><font face="Verdana" size="2">I read your "Handling Users and Passwords" tutorial, and it worked fine until I tried to login.  When I login all I see is a blank page, I'm pretty sure the problem is the login form.  If you could help me out I'd appreciate it.<br></font></div>
> > <div align="right"><font face="Verdana" size="2">Thanks,<br>Christopher Jeffrey</font></div></font>

&nbsp;

  
  

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

