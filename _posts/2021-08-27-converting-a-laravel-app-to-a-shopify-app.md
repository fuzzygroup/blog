---
layout: post
title: Converting a Laravel App to a Shopify App
date: 2021-08-27 10:11 -0400
category: laravel
tags: ["shopify", "laravel", "php"]
---
{% pizzaforukraine  %}

This blog post tackles the odd topic of taking a Laravel application and converting it to a Shopify app.  

## Overview

Shopify is an ecommerce platform for building hosted shopping sites.  With Shopify your whole ecommerce experience exists on a shopify url (whether the domain is .shopify.com or not; Shopify is serving everything and the underlying source of data is Shopify itself).  Laravel is an MVC based framework for building web applications using the php language. 

In this blog post, I will attempt to document all the steps to build a "shopify app" using Laravel.  A Shopify app is a web application which, can be hosted anywhere, that authenticates itself to Shopify and is embedded in a page on the Shopify website.

## Step 1: Create a Shopify App Using the Shopify Dashboard

There are a few different types of Shopify apps:

* Private / Custom -- A private app can only be used by one shopify site and cannot be listed in the Shopify app catalog.  Private apps have no review / approval cycle.
* Public -- A public app is listed in the Shopify catalog, is reviewed and approved by Shopify

In this tutorial we will be focused on private / custom apps.

The first step is to create our app.  This can be done with this url:

[https://partners.shopify.com/](https://partners.shopify.com/)

There are two url settings:

* The Callback url; this might also be called the App url (Shopify has changed their UI a number of times)
* The Redirect uri; this might be called the "Allowed redirection URL(s)"

The callback url needs to be set to your home route, the default route for your application.

The redirect uri needs to be set to the /authenticate route (this is automatically provided by )

**Note:** Everything you do with the Shopify website needs to be done in Chrome.  No other browser such as Brave seems to work.

## Step 2: Adding Shopify Support to Your Laravel App

The first step is to install the osiset shopify component:

    composer require osiset/laravel-shopify

After that you need to generate a configuration file:

    php artisan vendor:publish --tag=shopify-config

The next step is to add your credentials from Step 1 into the config file.  Or move them into a .env file if that's the approach you are using.  The values you need to fill in are: app_name, api_key, api_secret, and api_scopes

## Step 3: Adding Your Shopify App to 

## Sources

Here are some of the references I used for this.

* [https://github.com/osiset/laravel-shopify/wiki/Installation](https://github.com/osiset/laravel-shopify/wiki/Installation)
* [https://shopify.dev/apps/auth/oauth](Shopify OAuth)