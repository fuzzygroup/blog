---
layout: post
title: Testing A Health Check Endpoint with Curl
category: curl
tags: ["curl", "serverless"]
---
{% pizzaforukraine  %}

Given the move to auto scaling architectures front ended by load balancers, it is increasingly important to build into your application what is called a "health check".  This is nothing more than a known url that some external service can monitor to ensure that your application is "up".  A health check does nothing more than return an HTTP 200 (and sometimes it returns a JSON representation).  Here's a simple Rails controller that I use for health checks:

    class HealthController < ApplicationController
      def index
        results = {:status => "ok"}
        respond_to do |format|
          format.html { render :status => 200, :html => "ok" and return }
          format.json { render :status => 200, :json => results.to_json and return }
        end
      end
      
      # additional site monitoring functionality normally goes here
      
    end
    

Here's how to test this with curl and get the headers you'd want to see:

    curl -s -I https://foo.bar.something.com/health_check        

The options have the following meaning:

* -I, --head          Show document info only
* -s, --silent        Silent mode (don't output anything)

**Note**: The -s is silencing the normal curl output of what it fetched from the url.

What you should see is something like this:

    HTTP/2 200
    date: Thu, 29 Aug 2019 19:08:18 GMT
    content-type: text/html
    server: nginx/1.10.3 (Ubuntu)
    x-frame-options: SAMEORIGIN
    x-xss-protection: 1; mode=block
    x-content-type-options: nosniff
    set-cookie: _mkra_ctxt=3b46df998ac73a6cb44bbb8dc2a09918--200; path=/; max-age=5; HttpOnly; secure
    cache-control: no-cache
    x-request-id: 7158be3a-7990-4549-b780-fca5757069d3
    x-runtime: 0.208121
    strict-transport-security: max-age=15552000; includeSubDomains

## References

Here are some great curl references:
* [JVNS.CA - I can't recommend her work strongly enough](https://jvns.ca/blog/2019/08/27/curl-exercises/)
* [Stack Exchange](https://unix.stackexchange.com/questions/84814/health-check-of-web-page-using-curl)


