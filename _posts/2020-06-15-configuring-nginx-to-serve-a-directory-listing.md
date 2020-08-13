---
layout: post
title: Configuring NGINX to Serve a Directory Listing
category: nginx
tags: ["nginx"]
---
{:.center}
![IMG_3853.jpeg](/blog/assets/IMG_3853.jpeg)

I recently had to setup an NGINX server to serve a directory of files for processing via an AWS Lambda function.  And while there are other ways to do this, NGINX offered an easy, convenient way to do this albeit at the cost of some configuration.  

The trick to this is the autoindex on directive but it needs to exist in the right place in your overall NGINX configuration.

My operating system was:

* Ubuntu Linux 18
* Nginx version: nginx/1.14.0 (Ubuntu)

## Useful NGINX Commands

Here are some useful commands for working with NGINX:

* nginx -v (find the version)
* sudo systemctl status nginx (get status)
* sudo systemctl restart nginx (restart the server)
* sudo systemctl stop nginx (stop the server)
* sudo systemctl start nginx (start the server)

## The Overall NGINX Configuration Structure

I've always hacked about with NGINX and never really understand how NGINX was configured.  Much to my surprise, NGINX is very similar to the old school Apache structure that I used to dearly love:

* There is a default configuration in: /etc/nginx/nginx.conf
* The site level configuration is in /etc/nginx/sites-available/default

It is in this file /etc/nginx/sites-available/default that you can add a location directive:

    location /home/ubuntu/data/data {
        autoindex on;
    }

and this goes inside the overall server block like this:

    server {
            listen 80 default_server;
            listen [::]:80 default_server;
            
            location /home/ubuntu/data/data {
                autoindex on;
            }

My actual configuration looks like this:

    root /home/ubuntu/data/data;

    # Add index.php to the list if you are using PHP
    #index index.html index.htm index.nginx-debian.html;
    autoindex on;

    server_name _;

    location /home/ubuntu/data/data {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            try_files $uri $uri/ =404;
    }
    
