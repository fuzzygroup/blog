---
layout: post
title: Linux Tip of the Day - curl
category: linux
tags: ["linux_tip_of_the_day", "linux", "curl"]
description: Linux Tip of the Day - Use curl to fetch urls all kinds of different ways
image: http://fuzzyblog.io/blog/assets/curl.png
---
While I try hard to write things described as "* of the day" regularly there are times when life throws you a curve ball.  Yesterday's curve ball was the intersection of sick child, snow and a failed sewage lift pump led to, well, personal hell at home.  After a very busy work day I spent the evening that I had allocated to writing, well, playing clean up man before the real plumber showed up.  Anyway ... on to curl!

The standard Linux tool curl seems to always be present on Linux / OSX systems so I can skip over the installation issues and I suspect most of us know the basics i.e.:

> curl http://foo.com/bar.html

will fetch the file bar.html from the foo.com website and place it in the current directory.  Given that our goal here was to discuss how curl was used in John Graham Cummings [hncomments](https://github.com/jgrahamc/hncomments/blob/master/hncomments) bash script and that's all we need, I could stop here but let's go for the gusto and give some examples of advanced usage of curl.

# Output Redirection with curl

Normally the output of curl is written to the same filename that was used on the server.  You can use the &gt; character to redirect output to a new file as showing here:

> curl yoururl.com > yoururl.html

[More](https://geekflare.com/curl-command-usage-with-example/)

# Send a Custom Header with curl

If you want to send a custom header with curl then you can inject it with --header:

> curl --header 'Content-Type: application/json' http://yoururl.com

[More](https://geekflare.com/curl-command-usage-with-example/)

# Get Headers with curl

You can get a feel for the Internet http headers with --head:

> curl --head http://fuzzyblog.io

```bash
curl --head http://fuzzyblog.io
HTTP/1.1 200 OK
Server: GitHub.com
Date: Fri, 10 Feb 2017 02:00:34 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 1125
Last-Modified: Mon, 16 Jan 2017 18:12:56 GMT
Access-Control-Allow-Origin: *
Expires: Fri, 10 Feb 2017 02:10:34 GMT
Cache-Control: max-age=600
Accept-Ranges: bytes
X-GitHub-Request-Id: EA7C:71BB:11DF3A8:1883A50:589D1EC2
```

This is particularly useful if you build tools like crawlers / indexers because you can use the intersection of Last-Modified and Control-Length to make a hash key that you use for determining if you should index something.  HTTP head operations are very cheap because only the header is transferred.  [More on Head](https://curl.haxx.se/docs/httpscripting.html#HEAD)

# Testing Advanced Options

If you're looking for help with curl then try the [Online Curl tool](https://curlbuilder.com/) which gives you a user interface that has generates a curl command as its output.