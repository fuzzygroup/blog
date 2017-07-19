---
layout: post
title: Examples of Data Parsing with Nokogiri
---
http://stackoverflow.com/questions/17782061/how-do-i-parse-and-scrape-the-meta-tags-of-a-url-with-nokogiri


0
down vote
I actually did this just yesterday. Here was my html:

<div data-purpose="video-length">[^>]+<\/div>
Here was my nokogiri expression:

page.parser.css("div[data-purpose=video-length]").first.try(:text).try(:strip)
That took the value I wanted out from inside the div tags and stripped off the extra returns. The reason for using .try calls is to skip having to have if statements to handle when a nil is returned. The secret here lies in using [] inside the .css expression: div[data-purpose=video-length].

(answer is in my stack overflow)

