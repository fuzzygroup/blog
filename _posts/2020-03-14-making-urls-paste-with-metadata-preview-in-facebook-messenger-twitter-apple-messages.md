---
layout: post
title: Making Urls Paste with Metadata Preview In Facebook, Facebook Messenger, Twitter, Apple Messages
category: webdev
tags: ["facebook", "twitter", "messages"]
---
{:.center}
![IMG_2668.jpeg](/blog/assets/IMG_2668.jpeg)

I am an old tech guy.  I was at the conference where TBL announced the web and I wrote my first HTML snippet just a few years later.  But I pretty quickly moved from front end HTML onto back end web development and there are techniques that, while common today, I have never learned.  

An example of this is making urls appear, with metadata, when they are pasted into a messaging tool like:

* Facebook Messenger
* Apple Messages
* Facebook itself
* Twitter itself

We've all seen this.  Sometimes you paste a url into Facebook Messenger and all that comes out is the url itself.  And sometimes you get a picture, a title, etc.  The secret to this is three fold:

* A set of HTML meta tags for Facebook
* A set of HTML meta tags for Twitter
* Testing it in a debugging tool like the [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)

## Step 1: The HTML Meta Tags for Facebook

Here is an example of the HTML meta tags for Facebook:

```html

<meta name="twitter:card" content="summary"/>
<meta name="twitter:site" content="@fuzzygroup"/>
<meta name="twitter:creator" content="@fuzzygroup"/>
<meta name="twitter:title" content="www.covidnearme.org -- a web site for tracking COVID-19 near you"/>
<meta name="twitter:description" content="www.covidnearme.org - an easy to use web site for watching the spread of COVID-19 in your country and / or state"/>
<meta name="twitter:image" content="https://covidnearme.org/assets/covid-5c8b7d67715397bef73ccaf0ee4402a1952d97123328aeb2db839ca071583c98.png"/>

```

## Step 2: The HTML Meta Tags for Twitter

Here is an example of the HTML meta tags for Twitter:

```html

<meta property="og:url"                content="https://www.covidnearme.org/" />
<meta property="og:type"               content="website" />
<meta property="og:locale"             content="en_US">
<meta property="og:title"              content="www.covidnearme.org -- a web site for tracking COVID-19 near you" />
<meta property="og:description"        content="www.covidnearme.org - an easy to use web site for watching the spread of COVID-19 in your country and / or state" />
<meta property="og:image"              content="https://covidnearme.org/assets/covid-5c8b7d67715397bef73ccaf0ee4402a1952d97123328aeb2db839ca071583c98.png" />

```

## Step 3: Testing in The Sharing Debugger

Go to [https://developers.facebook.com/tools/debug/](https://developers.facebook.com/tools/debug/) and paste in your url.  You may need to click the Scrape Again button a few times while you work this out.