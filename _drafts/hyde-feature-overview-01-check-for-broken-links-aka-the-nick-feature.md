---
layout: post
title: Hyde Feature Overview 01 - Check for Broken Links aka The Nick Feature
---
I'm currently programming what in my head will always be known as *The Nick Feature*.  [Nick](http://nickjanetkis.com) is a buddy of mine and a regular pair programming partner. Together he and I have wrestled to the ground a number of Ansible powered dragons, dynamically build tens upon hundreds of AWS instances and other various and sundry nerd tasks.  

In the way that nerds often do, we chat about things as we go about the day and one day he asked me about programmatically checking his blog for broken links.  As questions like this always do, it made me think.  Several hours later I spun up a small test project and starting playing with that in the context of both his blog and mine.

Note: His question was specifically about preventing broken links from ever going live in the first place and that's how this Hyde feature now actually functions.  His specific request drove the development of the jekyll-hyde plugin which enables all Hyde functionality as part of the Jekyll publishing process.  

Broken links share a particular fascination for me because in my first hypertext authoring tool, Black Magic, we didn't allow them.  Our underlying engine made it very, very hard for dangling links to exist.  You could do it but you did it by moving a file outside the environment.  It wasn't until the world wide web came along that I ran into the problem of broken links in the wild.  And like everyone else in the web tools 1.0 world I solved this problem with perl scripts and other first generation automation tools.  But I haven't ever forgotten the elegant architecture for broken links that my first partner, Brian Giedt, created.

As I looked at Nick's blog and then my own I realized that broken links actually are only really a problem in a certain context. Given that the Internet is constantly changing, broken links are just an inevitability -- they will happen.  And, honestly, trying to fix them after a certain point in time is likely not possible.  Additionally things like server side mod_rewrite rules mean that links may break and proper 404s may never be returned to you. Finally just knowing the original destination of a link often is enough.  There is, after all, [archive.org](http://www.archive.org).  

So if there are contexts where you don't worry about broken links, is there a context where you **do** worry about them.  The answer is absolutely YES -- you worry about broken links when the content item is newly created.  And that's why one of the very first features I've written into Hyde is just that -- it takes a newly created post and makes sure that all of the links in it actually exist.  It is executed every time a post changes.

Thanks Nick!

# Technical Notes

Given that Nick, a very experienced software engineer, was asking me how to tackle this I thought it might be worth discussing how to implement something like this.

result = HTTPClient.head("http://www.scripting.com/fooddfdfdfdfd")
 => #<HTTP::Message:0x007feaf8454558 @http_header=#<HTTP::Message::Headers:0x007feaf8454508 @http_version="1.1", @body_size=0, @chunked=false, @request_method="HEAD", @request_uri=#<Addressable::URI:0x3ff57c22aa90 URI:http://www.scripting.com/fooddfdfdfdfd>, @request_query=nil, @request_absolute_uri=nil, @status_code=301, @reason_phrase="Moved Permanently", @body_type=nil, @body_charset=nil, @body_date=nil, @body_encoding=nil, @is_request=false, @header_item=[["x-amz-id-2", "GzHUJzCkS3rqbqEBuWdGD2V9cApmMZX7SKUV8Xc9WT/ECKz9glwtBpK6x65rnDdsyjqrP1ITrv4="], ["x-amz-request-id", "00986197CE6075E4"], ["Date", "Fri, 06 Jan 2017 09:08:05 GMT"], ["Location", "http://scripting.com/fooddfdfdfdfd"], ["Content-Length", "0"], ["Server", "AmazonS3"]], @dumped=false>, @peer_cert=nil, @http_body=#<HTTP::Message::Body:0x007feaf8454490 @body="", @size=0, @positions=nil, @chunk_size=nil>, @previous=nil>
2.3.1 :007 > result = HTTPClient.head("http://www.google.com/fooddfdfdfdfd")
 => #<HTTP::Message:0x007feaf842e5b0 @http_header=#<HTTP::Message::Headers:0x007feaf842e560 @http_version="1.1", @body_size=0, @chunked=false, @request_method="HEAD", @request_uri=#<Addressable::URI:0x3ff57c217bd4 URI:http://www.google.com/fooddfdfdfdfd>, @request_query=nil, @request_absolute_uri=nil, @status_code=404, @reason_phrase="Not Found", @body_type=nil, @body_charset=nil, @body_date=nil, @body_encoding=#<Encoding:UTF-8>, @is_request=false, @header_item=[["Content-Type", "text/html; charset=UTF-8"], ["Content-Length", "1574"], ["Date", "Fri, 06 Jan 2017 09:08:22 GMT"]], @dumped=false>, @peer_cert=nil, @http_body=#<HTTP::Message::Body:0x007feaf842e420 @body="", @size=0, @positions=nil, @chunk_size=nil>, @previous=nil>

