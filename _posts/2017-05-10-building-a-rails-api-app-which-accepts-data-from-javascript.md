---
layout: post
title: Building a Rails API App Which Accepts Data from JavaScript
category: rails
tags: ["rails", "javascript", "api", "cors", "fingerprint"]
description: If you ever wondered how to build a web tracker and integrate it JavaScript on the front end and an API service on the back end, keep on reading.
---
A friend recently described a web tracking problem to me and we discussed looking at it via Google Analytics or by rolling our own approach.  Google Analytics is tremendously powerful but I looked at this as a chance to improve my JavaScript skills which are, admittedly, not my strongest part of my technical skill set so I went with the roll my own approach.  As with most things I do, I'm writing this out in full to clarify my own thinking and understanding of the problem as well as to make this information publicly available.

# Problem

The problem at hand was to record tracking data as people viewed pages on an e-commerce web site.  The goal was to correlate the tracking data and try and resolve the per visitor url paths that were traversed.  I also wanted to experiment with browser fingerprinting so I used the FingerprintJS2 library.

# Solution

The solution was two fold:

* JavaScript that runs in the browser and executes an HTTP get with the details of the url that the user visited
* A Rails API server that accepts the details of the url that was visited and logs it to a database

# Part 1: JavaScript

I'm not a JavaScript expert by any means so this js code was largely pulled together from StackOverflow and other sources (references are at the end).  I ended up writing this twice, first starting with jQuery and then realizing that for something embeddable you really want to eliminate every dependency -- so getting rid of jQuery itself is a desirable goal.

## Browser Fingerprinting

A browser fingerprint is an SHA / MD5 style hash which reflects a unique profile of a browser based on the browser's uniquely exposed capabilities, platform, fonts and other attributes.  While not necessarily as unique as a fingerprint, browser fingerprint is actually a robust approach to tracking a user and since it is based on readily available [open source libraries](https://github.com/Valve/fingerprintjs2), it isn't something that needs to be developed from scratch.  And, happily, it even gets good marks on my new [Should I Gem](http://shouldigem.com/report_cards/146?url=https%3A%2F%2Fgithub.com%2FValve%2Ffingerprintjs2) tool.

Here's all it takes to calculate a browser fingerprint:

    <!-- bring in the library -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fingerprintjs2/1.5.1/fingerprint2.min.js"></script>
    <!-- the hash will be in the variable result -->
    <script type="text/javascript">
        new Fingerprint2().get(function(result, components){
        }
    </script>
    
Now that we know how to calculate a browser fingerprint, the next step is the sending it to our API service either by jQuery or a native XHR call.

## The jQuery Approach

Here's the jQuery code:

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fingerprintjs2/1.5.1/fingerprint2.min.js"></script>
    <script type="text/javascript">
        new Fingerprint2().get(function(result, components){
     
        $(document).ready(function(){

             $.post('http://localhost:3820/api/log_it', {
               "api_key": "foobarbaz",
               "url": window.location.href,
               "fingerprint": result
             }, function(serverResponse){
             })

         })
     
       });
    </script>

## The XHR Approach

Here's the XHR code:

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fingerprintjs2/1.5.1/fingerprint2.min.js"></script>
    <script type="text/javascript">
        new Fingerprint2().get(function(result, components){
          var xhr = new XMLHttpRequest();
          var dest_url = "http://localhost:3820/api/log_it?" + "api_key=" + "foobarbaz" + "&" + "url=" + window.location.href + "&" + "fingerprint=" + result;
          xhr.open('GET', dest_url);
          xhr.onreadystatechange = function(e) {
            if(xhr.readyState === 4)
              console.log("got result: ", xhr.responseText);
          };
          xhr.send();
       });
    </script>
    

# Part 2: Rails API Server

I've become an increasing fan of microservices as an architectural paradigm and Rails API servers are something I now generate regularly.  Here's how I did that:

> rails new --api tracking_api --database=mysql --skip-spring --skip-listen --skip-sprockets

You'll notice that I'm skipping spring and listen which gets rid of the [disaster that is the evented file watcher on OSX](http://fuzzyblog.io/blog/osx/2017/03/20/getting-around-osx-bash-fork-issues.html) / [Github Issue](https://github.com/puma/puma-dev/issues/56) (this causes huge issues with overly aggressive process launching).

## Getting Past CORS Restrictions

Once this is done we need to add the rack-cors gem with:

> gem 'rack-cors'

in the Gemfile.  In case you've been following what I've done with [ShouldIGem.com](http://www.shouldigem.com), you might be curious how rack-cors fared -- it got an [A](http://shouldigem.com/report_cards/141?url=https%3A%2F%2Fgithub.com%2Fcyu%2Frack-cors).

The rack-cors gem addresses the problems with Cross Origin Scripting (CORS) by allowing domain X to post or get to domain Y.  While there are a bunch of other approaches to getting around CORS, the rack-cors gem was by far the best solution I found.

Note: There are security implications if you open rack-cors to everything; please keep that in mind.

## Writing the Api

After a bundle install, I generated an Api controller with:

> bundle exec rails g controller api

I then wrote a simple method to capture the data and save it to a PageView object in the database:

    class ApiController < ApplicationController
  
      def log_it
        PageView.create_page_view(params[:fingerprint], request.remote_ip, params[:url], request.user_agent)
      end

    end
    
I then needed to write a route for this as follows:

    Rails.application.routes.draw do
      get '/api/log_it', to: 'api#log_it'
    end
    
The PageView object is simply an ActiveRecord model which logs the view to the database and it is simple enough that I'm not going to cover it here.

Note: This is a simplified controller.  I have deliberately omitted handling the api key parameter which limits calls against the API to only those with valid API keys.

## Testing this with Wget or Curl

As I wrote about previously, I'm a huge believer in using curl or wget to test APIs.  Here is a simple wget statement that exercises the API as you tail a log file to make sure everything works:

> wget "http://localhost:3820/api/log_it?api_key=foobarbaz&url=http%3A%2F%2Flocalhost%3A3400%2F&fingerprint=e82eaadd"

## Testing this From the Browser

To test this from the browser just embed it in an HTML page and tail the logs on the API service.  Here's what those logs look like:

    Started GET "/api/log_it?api_key=foobarbaz&url=http://localhost:3400/&fingerprint=e82eaadd998e1aae0309b781029f8edb" for 127.0.0.1 at 2017-05-09 18:35:32 -0400
    Processing by ApiController#log_it as */*
      Parameters: {"api_key"=>"hyde314159", "url"=>"http://localhost:3400/", "fingerprint"=>"e82eaadd998e1aae0309b781029f8edb"}
       (0.2ms)  BEGIN
      SQL (0.4ms)  INSERT INTO `page_views` (`created_at`, `updated_at`, `date_created_at`, `fingerprint`, `ip_address`, `user_agent`, `url`, `url_base`) VALUES ('2017-05-09 22:35:32', '2017-05-09 22:35:32', '2017-05-09', 'e82eaadd998e1aae0309b781029f8edb', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', 'http://localhost:3400/', 'localhost/')
       (0.8ms)  COMMIT
    Completed 204 No Content in 4ms (ActiveRecord: 1.4ms)

# Conclusions

This was an interesting exercise which taught me a bit of JavaScript, illustrated how to use the browser fingerprinting and finally taught me a way around CORS restrictions -- the rack-cors gem.  Hopefully this blog post illustrated for you how to integrate external JavaScript with a Rails api.

# References

* [http://stackoverflow.com/questions/38290552/using-rest-api-and-send-post-request](http://stackoverflow.com/questions/38290552/using-rest-api-and-send-post-request)
* [http://stackoverflow.com/questions/1034621/get-current-url-in-web-browser](http://stackoverflow.com/questions/1034621/get-current-url-in-web-browser)
* [http://test-cors.org/](http://test-cors.org/)
* [https://github.com/monsur/test-cors.org](https://github.com/monsur/test-cors.org)
* [https://github.com/jpillora/xdomain](https://github.com/jpillora/xdomain)
* [https://learn.jquery.com/ajax/working-with-jsonp/](https://learn.jquery.com/ajax/working-with-jsonp/)
* [http://stackoverflow.com/questions/29751115/how-to-enable-cors-in-rails-4-app](http://stackoverflow.com/questions/29751115/how-to-enable-cors-in-rails-4-app)
* [https://github.com/cyu/rack-cors](https://github.com/cyu/rack-cors)
* [http://stackoverflow.com/questions/20035101/no-access-control-allow-origin-header-is-present-on-the-requested-resource](http://stackoverflow.com/questions/20035101/no-access-control-allow-origin-header-is-present-on-the-requested-resource)