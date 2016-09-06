---
layout: post
title: PHP Pear Programming Tutorial
category: story.radio.weblogs.com
tags: ["php"]
---
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			The FuzzyBlog! : PHP Pear Programming Tutorial
			</title>
		<meta http-equiv="Expires" content="Mon, 01 Jan 1990 01:00:00 GMT"> 
<style type="text/css">
body {
				margin:10px 80px 10px 80px;
				background: #5385AA url('http://radio.weblogs.com/0103807/images/blueBG.jpg');
				font-size: 90%;
				font-family: verdana, arial, helvetica, sans-serif;
				line-height:160%;
				color:#333
				}
td {
				font: 11px verdana, arial, helvetica, sans-serif;
				line-height:15px;
				}
			A {
				color: #345877; font-family: verdana, arial, sans-serif;
				font-size:10px;
				text-decoration: none;
				font-weight:bold;
				} 
			A:link {
				color: #345877;
				text-decoration: none;
				} 
			A:visited {
				color: #4C80AD;
				text-decoration: none;
				} 
			A:active {
				color: #99CC66;
				} 
			A:hover {
				color: #000;
				text-decoration: underline;
				}
			#banner {
				font-family:verdana, arial, sans-serif;
				color:#FFF;
				font-size:28px;
				line-height: 11px;
				font-weight:bold;
				padding-left:20px;
				padding-right:20px;
				padding-top:40px;
				text-align: left;
				}
			.description {
				font-family:verdana, arial, sans-serif;
				font-style: italic;
				line-height: 11px;
				color:#FFF;
				font-size:10px;
				font-weight:bold; 
				}      
			#content {
				background:#FFF;
				margin:15px;
				min-width: 500px;
				border-bottom: 2px solid;
				border-top: 1px solid;
				border-left: 1px solid;
				border-right: 2px solid;
				border-color: #000;
				}
			#links {
				background:#345877;
				color: #FFF;
				font-weight: bold;
				text-align: left;
				margin-top: 4px;
				margin-left: 4px;
				margin-right: 4px;
				padding-right: 5px;
				padding-left: 5px;
				padding-bottom: 3px;
				padding-top: 2px;
				text-transform: lowercase;
				padding-right:15px;        
				border-bottom: 1px solid #000;
				border-top: 0px solid #FFF;
				border-left: 0px solid #FFF;
				border-right: 0px solid #FFF;
				}
			.navigatorLink {
				font: 11px verdana, arial, helvetica, sans-serif;
				color:#B5B0C4;
				font-size:11px;
				font-weight:bold;
				line-height:16px;
				}
			a.navigatorLink:link
				{
				color: #A0C2D6;
				text-decoration: none;
				letter-spacing: normal;
				}
			a.navigatorLink:visited
				{
				color: #8BA9BA;
				text-decoration: none;
				letter-spacing: normal;
				}
			a.navigatorLink:hover
				{
				color: #ffffff;
				text-decoration: underline;
				letter-spacing: normal;
				}
			.blogbody {
				color:#333;
				font-weight:normal;
				background:#FFF;
				margin-top: 0px;
				margin-bottom: 4px;
				margin-left: 4px;
				margin-right: 4px;
				padding-left:50px;  
				padding-right:50px;
				padding-top:30px;      
				padding-bottom:50px;      
				border-bottom: 1px solid #4C80AD;
				border-top: 0px solid #345877;
				border-left: 1px solid #345877;
				border-right: 1px solid #4C80AD;
				}  
			.title { 
				font-family: verdana, arial; 
				font-size: 17px; 
				color: #345877; 
				font-weight:bold;  
				margin-bottom: 15px;
				margin-top: 3px;
				}  
			.newsItems { 
				padding-left: 15px;
				}  
			.footer {
				padding-top:30px;
				margin-top:30px;
				border-top:1px solid #345877;
				}
			.date { 
				font-family:verdana, arial, sans-serif;
				color:#345877;
				font-size:11px;
				font-weight:bold;
				background:#FFF;
				line-height:14px;
				padding:2px;
				margin-top:15px;
				margin-bottom:30px;
				border-bottom: 1px solid;
				border-color: #345877;
				}
			.calendar {
				float:right;
				font-weight:normal;
				background:#FFF;
				line-height:15px;
				margin-top: 0px;
				margin-bottom: 15px;
				margin-left: 15px;
				margin-right: 15px;
				border: 1px solid #345877;
				padding:10px;
				width:180px;
				}  
			.hCalendarMonthYearRow, .dCalendarMonthYearRow
				{ 
				font-family:verdana, arial, sans-serif;
				color:#345877;
				font-size:13px;
				font-weight:bold;
				text-align:left;
				line-height:14px;
				padding-bottom:4px;
				border-bottom: 1px solid #A0C2D6;
				}
			.hCalendarDayNameRow, .dCalendarDayNameRow
				{
				color:#345877;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:bold;
				line-height:14px;
				padding:0px;   
				}
			.hCalendarDayRow, .dCalendarDayRow
				{
				color:#345877;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:normal;
				line-height:14px;
				padding:0px;    
				}
			.hCalendarDayLinked, .dCalendarDayLinked
				{
				color:#FFF;
				background-color: #EEE;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:normal;
				line-height:14px;
				padding:0px;   
				}
			.hCalendarDayCurrent, .dCalendarDayCurrent
				{
				color: #FFFFFF;
				background-color: #A0C2D6;
				font-family:verdana, arial, sans-serif;
				font-size:10px;
				font-weight:normal;
				line-height:14px;
				padding:0px;   
				}
			.radioMenuLinkFont {
				font-family:verdana, arial, sans-serif;
				color:#5385AA;
				font-size:10px;
				font-weight:bold;     
				}    
			.radioMenuLink {
				font-family:verdana, arial, sans-serif;
				color:#5385AA;
				font-size:10px;
				font-weight:bold;     
				} 
			a.radioMenuLink:link {
				color: #5385AA;
				text-decoration: none
				}  
			a.radioMenuLink:visited {
				color: #5385AA;
				text-decoration: none
				}
			a.radioMenuLink:hover {
				color: #000;
				text-decoration: underline
				}        
			.small { 
				font-family:verdana, arial, sans-serif;
				font-size:9px;
				line-height:11px;
				}
	#banner {
				font-family:verdana, arial, sans-serif;
				color:#FFF;
				font-size:28px;
				line-height: 11px;
				font-weight:bold;
				padding-left:20px;
				padding-right:20px;
				padding-top:40px;
				text-align: left;
				}
			.description {
				font-family:verdana, arial, sans-serif;
				font-style: italic;
				line-height: 11px;
				padding-left:20px;
				text-align: left;
				color:#FFF;
				font-size:12px;
				font-weight:bold; 
				}      
			</style>
		<script language="JavaScript" type="text">
			<!-- Begin hiding from older browsers
			//End hiding-->
			</script> 
		</head>

<script language="JavaScript" type="text/javascript"><!--
	var imageUrl = "http://radio.xmlstoragesystem.com/weblogStats/count.gif";
	var imageTag = "<img src=\"" + imageUrl + "?group=radio1&usernum=103807&referer=" + escape (document.referrer) + "\" height=\"1\" width=\"1\">";
	document.write (imageTag);
	//--></script>

<font size="+3">
<b><a href="http://radio.weblogs.com/0103807/" style="color:white; text-decoration:none">
The FuzzyBlog!</a></b></font>

<font class="description"><p><i>Marketing 101. Consulting 101. PHP Consulting. Random geeky stuff. I Blog Therefore I Am.</i></p></font>

[Home](http://radio.weblogs.com/0103807/)|[FuzzyGroup](http://www.fuzzygroup.net/)|[About Us](http://www.fuzzygroup.net/about/)|[Our Services](http://www.fuzzygroup.net/services/)

  

PHP Pear Programming Tutorial

If you haven't worked with the Pear database abstraction class then you really should.&nbsp;&nbsp; Now I know that everyone says that and we often don't bother -- "too hard", "it's a pain", etc.&nbsp; It's really not.&nbsp; Here's how I learned how to do it and what I recommend.&nbsp;

1. Write a simple PHP app to do nothing more than list the contents of a table using the MySQL native functions. 
2. Go through and convert it line by line to the Pear equivalents.

Our first script should be familiar to anyone who has ever used the basic MySQL functions in PHP.&nbsp; I'm not going to go into details here since it's so basic.

    <?php// //////////////////////////////////////////////////*

    My SQL Test Script for Learning Pear

    All this does is connect to a MySQL db and list a table

    */// /////////////////////////////////////////////////

    // pull from a file $db, $db_host, $db_password, $db_userinclude "zcommondb.php";

      // Connecting, selecting database  $link = mysql_connect("$db_host", "$db_user", "$db_password")    or die("Could not connect");

      //select the database  mysql_select_db("$db")    or die("Could not select database");

    // the query  $query = "SELECT * FROM fo2_emails LIMIT 20";

      $result=mysql_query($query)    or die ('<H1 align=center><font color=red>Bad Database Request</font></H2> in :<BR>'      . __FILE__.' line '. __LINE__       .'<BR><br /><b>The query used was:</b><BR><BR> '.$query      .'<BR><br /><b>MySQL says</b><BR><BR> '.mysql_error()      .'<BR><BR>Email administrator for help at ' . $sysadminemail . ' for help' );

      while ($row = mysql_fetch_array($result))  {    //start a counter so that we can keep track of how many records we change      $ctr++;      $email_id = $row["email_id"];      $account_address = $row["accountaddress"];      $subject = $row["subject"];      print "<P>$email_id - $account_address - $subject</P>"; }?>

Contents of the zcommondb.php file are this:

    <?

    $db_host = "YOUR VALUE HERE"; $db = "YOUR VALUE HERE"; $db_user = "YOUR VALUE HERE"; $db_password = "YOUR VALUE HERE"; // ONLY USED BY THE PEAR ROUTINES $db_type = "mysql";

    ?>

So that's our starting point. Now here's the pear equivalent.&nbsp; As you can see it's just about exactly the same number of lines with the main differences being in the use of objects.&nbsp; I put the new / different code in <font color="red">Red</font> to make it easier.

    <?php// //////////////////////////////////////////////////*

    My SQL Test Script for Learning Pear

    All this does is connect to a MySQL db and list a table

    */// /////////////////////////////////////////////////

      // pull from a file $db, $db_host, $db_password, $db_user  include "zcommondb.php";  require_once "DB.php";

      //NEW STUFF -- Pear specific  //static method to parse the DSN connection string into an array  $dsn = DB::parseDSN("$db_type://$db_user:$db_password@$db_host/$db");

      //static factory method to create an object of $db_type  $db_obj = DB::factory("$db_type");

      //connect to the database and display an error message if it fails  if (!$db_status = $db_obj->connect($dsn)) {    echo "Error: " . $db_status -> message . "<br />";    echo "Code: " . $db_status-> code . "<br />";  }

      // the query  $query = "SELECT email_id, accountaddress, subject FROM fo2_emails LIMIT 20";

      // NEW STUFF -- Pear specific  $result = $db_obj->simpleQuery($query);  while($row = $db_obj->fetchRow($result,DB_FETCHMODE_ASSOC)) {    $ctr++;    $email_id = $row["email_id"];    $account_address = $row["accountaddress"];    $subject = $row["subject"];    print "<P>$email_id - $account_address - $subject</P>";  }?>

As you can see, it really isn't much if at all harder to use Pear than the native mysql\_XYZ functions.&nbsp; Keep that in mind as you write php code.&nbsp;

Source:

- [Working - Original MySQL Native](http://www.fuzzygroup.com/php/examples/example_pear_mysql.php)
- [Colorized Code - Original MySQL Native](http://www.fuzzygroup.com/php/examples/example_pear_mysql.phps)
- [Working - Pear](http://www.fuzzygroup.com/php/examples/example_pear_db.php)
- [Colorized Code - Pear](http://www.fuzzygroup.com/php/examples/example_pear_db.phps)

### How'd He Colorize That ?

If you want to display a colorized source view of your code then make a Unix symbolic link and Apache / PHP will properly colorize the code when it's executed:

I.E.

> ln -s source dest.phps

Example:

> ln -s example_pear_mysql.php example_pear_mysql.phps

Thanks to [Apokalyptik](http://www.Apokalyptik.com/) and [Natrak](http://www.Natrak.net/) who both showed me this over the past six months or so.

### addslashes Versus mysql\_escape\_string

If you're not yet ready to do the pear step then you might want to consider moving away from [mysql\_escape\_string](http://www.php.net/manual/en/function.mysql-escape-string.php) and to [addslashes](http://www.php.net/manual/en/function.addslashes.php).&nbsp; These functions seem to be equivalent and yet one will work across databases and one is only MySQL specific.&nbsp; But I do recommend reading the user contributed notes on addslashes(), it seems to not be perfect.&nbsp; Guess which one I'm largely using now?

### Recommended

I learned this stuff two ways:

- Groveling through the Drupal source code [[Go]](http://www.drupal.org/)
- Mastering PHP 4.1 by Sybex which has a short but outstanding section on Pear and Databases [[Go]](http://www.amazon.com/exec/obidos/tg/detail/-/0782129242/qid=1037277456/sr=8-1/ref=sr_8_1/002-4202734-9602408?v=glance&s=books&n=507846)

Thanks to both.&nbsp; Kudos to Mastering PHP 4.1.&nbsp; Don't be thrown by the 4.1 nomenclature, it's a surprisingly good book.&nbsp; They even cover how to decrypt MIME attachments which I couldn't find in a single other PHP book (and I checked like 20 including the table of contents to the forthcoming O'Reilly PHP Cookbook).

### Notes

There is nothing wrong with the native MySQL php functions but if you have any intent on moving your code to another database then starting with the Pear stuff now is definitely a good thing.&nbsp; It really isn't hard and it will make you a bit more confident with the PHP object stuff which is increasingly important.

| |

 This Page was last update: 4/6/2003; 3:13:59 AM  
 Copyright 2003 The FuzzyStuff  
 Theme Design by [Bryan Bell](http://www.bryanbell.com)  
  
[![Click here to visit the Radio UserLand website.](http://radio.weblogs.com/0103807/images/radioBadge.gif)](http://radio.userland.com/) [![Subscribe to "The FuzzyBlog!" in Radio UserLand.](http://radio.weblogs.com/0103807/images/xmlCoffeeCup.gif)](http://127.0.0.1:5335/system/pages/subscriptions?url=http://radio.weblogs.com/0103807/rss.xml "Click on the XML coffee mug to subscribe to "The FuzzyBlog!" in Radio UserLand.") [![Click to see the XML version of this web page.](http://radio.weblogs.com/0103807/images/xml.gif)](http://radio.weblogs.com/0103807/rss.xml "Click to see the XML version of this web page.") [![Click here to send an email to the editor of this weblog.](http://static.userland.com/shortcuts/images/qbullets/mailto.gif)](http://radio.xmlstoragesystem.com/rcsPublic/mailto?usernum=0103807 "Click here to send an email to the editor of this weblog.")  

