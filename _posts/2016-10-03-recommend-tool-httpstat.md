---
layout: post
title: Recommended Tool - httpstat
category: tools
tags: ["httpstat", "tools"]
---
I ran across Dave Cheney's httpstat tool recently and tried to get it working but I'm not a Go person so that failed.  I re-discovered it closing out a metric crap ton of browser tabs and thought "hm... I wonder if it is in brew yet".  So a quick:

    brew install httpstat
    
gave it to me perfectly.  I can now do things like:

    httpstat http://dave.cheney.net/

    HTTP/1.1 200 OK
    Server: nginx/1.2.1
    Date: Mon, 03 Oct 2016 08:46:43 GMT
    Content-Type: text/html; charset=UTF-8
    Transfer-Encoding: chunked
    Connection: keep-alive
    X-Powered-By: PHP/5.4.45-0+deb7u2
    Link: <http://dave.cheney.net/wp-json/>; rel="https://api.w.org/"

    Body stored in: /var/folders/rf/3tfhwgrj1sl85y6rcs4x_s5c0000gn/T/tmpsGnFLB

      DNS Lookup   TCP Connection   Server Processing   Content Transfer
    [    16ms    |      265ms     |       932ms       |       947ms      ]
                 |                |                   |                  |
        namelookup:16ms           |                   |                  |
                            connect:281ms             |                  |
                                          starttransfer:1213ms           |
                                                                     total:2160ms
                                                                     
Here's an example from one of my current sites (url omitted deliberately):

    sjohnson@ScottJohnsonMacbookAir:~/me/fuzzygroup/gocode$ httpstat http://banks.OMITTED.com/

    HTTP/1.1 302 Found
    Cache-Control: no-cache
    Content-Type: text/html; charset=utf-8
    Date: Mon, 03 Oct 2016 08:48:06 GMT
    Location: http://banks.OMITTED.com/auth/login
    Server: Apache/2.4.7 (Ubuntu)
    Set-Cookie: _banks_session=MkhuMmJDWEM5bGp5YUFqNUxNNzRFMlNLUENwam1MODd6YU9HUEZ6MzRvdHQ5RVZFTTF2WC9OcHo3UVNEbm5uRlJlWDJRa1JvL1dFOXN2TEdHWlREL1NrVG9weGlCMXl5OUtyU29lR2VvMm5NQ0hBQU9xZlBKTUEva0RDVFBNdjBHOTI3eXY1dS9nYXVOTUJSd1F2R1d2MVpmdnhXUGt4VUkyOFhVR0hjTUtkTkZNTVlYb1kzTVVKOWIwWXhvNEIzVGRFYmhCWktoVnlOWStPeFU5dXg3TE5ma09VeC9qL0tWK1pQekVYb1ZBaz0tLXVFMHJEMDlEb3ROdGMxanRTQkxEeEE9PQ%3D%3D--51a7cd19b7d987a98bb6071c37c41be2f81cfb22; path=/; HttpOnly
    Set-Cookie: _passenger_route=1007719246; Path=/
    Status: 302 Found
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    X-Powered-By: Phusion Passenger 5.0.30
    X-Request-Id: ae887d90-9484-484a-be35-e13bf3454c3d
    X-Runtime: 0.002985
    X-XSS-Protection: 1; mode=block
    transfer-encoding: chunked
    Connection: keep-alive

    Body stored in: /var/folders/rf/3tfhwgrj1sl85y6rcs4x_s5c0000gn/T/tmp3wlc7H

      DNS Lookup   TCP Connection   Server Processing   Content Transfer
    [    527ms   |      66ms      |       73ms        |        1ms       ]
                 |                |                   |                  |
        namelookup:527ms          |                   |                  |
                            connect:593ms             |                  |
                                          starttransfer:666ms            |
                                                                     total:667ms

Looking at this very clearly shows me that the single biggest slow down here is actually dns.  Go figure.  If I was optimizing for performance, I would never have thought to investigate a half second of DNS delay.  

Thank you [Dave Cheney](http://dave.cheney.net/)!