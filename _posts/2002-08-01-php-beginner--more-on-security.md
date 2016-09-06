---
layout: post
title: PHP Beginner- More on Security
category: story.radio.weblogs.com
tags: ["php"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT">
    <title>PHP Beginner: More on Security</title>
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
 | Last updated: 8/1/2002; 6:13:32 AM  
 | ![](http://radio.weblogs.com/0103807/images/trans60x60.gif) |

| ![](http://radio.weblogs.com/0103807/images/trans60x1.gif)  
 | 

<font size="+3"><b><a href="http://radio.weblogs.com/0103807/" style="color:black; text-decoration:none">The FuzzyBlog!</a></b></font>  
_Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am._

<font size="+1"><b>PHP Beginner: More on Security</b></font>

{This story is written for those very patient people who used my PHP Beginner security code and found out that there were things missing from the article.&nbsp;&nbsp;I tried to make it entertaining at least to make up for the apparent frustration that this as caused folks and I do apologize.}

Once upon a time (hey!&nbsp; all good geek stories begin with "once upon a time" or "a long, long time ago, in a galaxy far, far away"), there was a lad\*.&nbsp; A lad who said "I know, I know... I'll use PHP to make web security just plain easy.&nbsp; And then my buddy Maxim will distribute it as far as the wires can reach.&nbsp; To the ends of the land people will be able to authenticate and it will be good."&nbsp;&nbsp; Little did that lad know that an evil wizard would cloud his mind at the last minute and cause the answers to critical questions to just disappear.&nbsp; And, because the wizard was mighty indeed, he also clouded the vision of Maxim and the other fine, fine editors at [www.phpbeginner.com](http://www.phpbeginner.com/).&nbsp; Hopefully the new counter magic that a powerful mage named Libby cast upon our lad will allow the answers to finally be disclosed.&nbsp; If not, please direct counter magic to [scott@fuzzygroup.com](mailto:scott@fuzzygroup.com).&nbsp; And, so ...

## References

The original article was published in these two places:

- [http://www.phpbeginner.com/columns/scott/authentication](http://www.phpbeginner.com/columns/scott/authentication)
- [http://www.fuzzygroup.com/writing/php\_handling\_users\_and\_passwords.htm](http://www.fuzzygroup.com/writing/php_handling_users_and_passwords.htm)

## The Answers

Covered below are answers that I hope address people's questions adequately.

### Where Does the User Go After Login?

The first answer that was missing from the article was "Where does the user go after they login?".&nbsp; Here's the code from the original article (original as on my website, not sure what code appeared where):

    if ($encryptedpassword == $passwordfromdb) {#set our cookies for our future security checks   setcookie ("ck_username", $username);  setcookie("ck_password", $password);  setcookie("ck_user_id", $user_id);#Create our results page showing them they are logged in  print "<HTML>";  print "<HEAD>";  print "<TITLE>";  print "You're Logged In!";  print "</TITLE>";  print "<BODY>";  print "You're Logged In";#This needs to have a link added of course#If you wanted to automatically take them to the main screen#then use the header function to redirect them# NEW CODE HERE  print "Click Here to Continue";  print "</BODY>";  print "</HTML>";

    //close the database// Closing connectionmysql_close($link);

<font size="3">Add the line below (to the spot NEW CODE HERE indicated above and delete the next 3 print statements) to branch them to the right destination (change the index.php to the right filename):</font>

    header("Location: index.php");

### How to Check Access on a Per Page Level

The second answer that was missing from the article addressed the question "Ok.&nbsp; Now that a user has logged in, NOW WHAT!!!".&nbsp; In other words, the articles above show you what code is needed to handle authentication but NOT what to do on any pages after the user is authenticated.&nbsp; For example, with a secure application, you generally want to check if a user should or shouldn't have access to a particular page.&nbsp; The way I handle this is to have every single page in my site but a .PHP file which calls a function like check\_security() right at the start of the page.&nbsp; The checksecurity() function verifies some aspect of our login cookies, $ck\_username / $ck\_password $ck\_user\_id.&nbsp; It might just check that they exist.&nbsp; It might check that they are valid based on a date / time criteria (you can create cookies that auto expire when the browser exits for example), it might even do a database level check for every page view.&nbsp; How secure you want to be is what really determines what you do here.&nbsp; Shown below is a very simple check\_security() function.

At the top of every .PHP page, put this function call.&nbsp; It should go after any include routines since you probably want to store it in 1 place (i.e. in your include file) so it can be maintained in 1 place.

    check_security();

The code for the function is shown below.&nbsp; This is not really a very secure approach but it does handle basic security.&nbsp; Security is very difficult to get right and the rule of thumb that I recommend is to spend time on security proportional to the importance of the information in the application.&nbsp; If it's credit card information then **DO IT RIGHT**.&nbsp; If it's someone's bookmarks that you are guarding then it might be less important and make the right decision.

    function check_security() {// the global statement imports global variables from elsewhere in the script// since functions are local   global $ck_username;  global $ck_password;  global $ck_user_id;  if (empty($ck_username)) {    header("Location: accessdenied.htm");  }

<font size="3">The accessdenied.htm page looks like this (and customize it for your application):</font>

    <HTML><HEAD><TITLE>Access Denied</TITLE></HTML><BODY><H1 align="center">Access Denied</H1><CENTER>We're sorry but you don't have access to FuzzyOffice.  Please try logging in again.<BR><A href="index.htm">Log In</A></CENTER></BODY></HTML>

### <font size="3"> </font>

## Acknowledgements

Beyond the mage Libby, the sorceress Ashanda and many other patient folk.&nbsp; I do apologize for both the problems and the delays.

\* Ok lad is pushing it but cut me a wee bit of slack.&nbsp; I'm still youthful at least.

  
  

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

