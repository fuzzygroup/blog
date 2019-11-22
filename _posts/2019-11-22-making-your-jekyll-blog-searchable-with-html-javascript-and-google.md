---
layout: post
title: Making Your Jekyll Blog Searchable with HTML, JavaScript and Google
category: search
tags: ["search", "jekyll"]
---
So yesterday someone said this to me:

> You know the problem with your blog -- you write so much and its not searchable.  

Poppycock.  Balderdash.  Fizzle Sticks.  Ok. Maybe.  Yes there's not search box at the top of my blog but anything on the Internet that has a distinct domain name is actually easily searchable just by using Google.  For example, here's how you'd find anything I ever wrote about MySQL:

    site:fuzzyblog.io mysql

If you copy and paste that into google then you're get a search of my site for anything I ever wrote about mysql.  

If we wanted to make this a "feature" of my blog then we would need to do the following:

1. Create an HTML form which has a search box and a search button.
2. We'd need some JavaScript to handle assembling the query and sending it to Google.
3. We'd need to integrate it with Jekyll

## Step 1: A Basic HTML Form

Here's a basic html form:

```html
  <form id="search" action="https://www.google.com/search">
    <input id="q" name="q" size=50>
    <button type="submit" form="form1" value="Search" onclick="do_search();">Search</button>
  </form>
```

## Step 2: JavaScript

Here's the JavaScript:

```javascript
<script type="text/javascript">
  function do_search() {
    var q = document.getElementById('q');
    var searchQuery = "site:fuzzyblog.io " + q.value;
    document.location = "https://www.google.com/search?q=" + searchQuery;
  }
</script>
```

What this does is take the query in the search field and assign it to a variable.  It then merges it with the "site:fuzzyblog.io" bit of Google syntax.  And, yes, there might be an issue with multi word queries needing to be joined with the + character (that's how HTML rolls but Google is generally pretty flexible).  I'd test this now and rewrite the query but I'm in an aluminum tube at 35,000 feet without any access to Google (or most developer documentation). The final step is to set document.location to the google url for the search.  That forces the query to execute and positions the user on the Google results page.

## Step 3: Jekyll Integration

In order to integrate this with Jekyll, we need to modify two files:

* _includes/head.html
* _layouts/default.html

The _includes directory holds html templates for the html HEAD element, the header of every page and the footer of every page.  The file head.html needed to be modified to include the JavaScript.

The _layouts directory holds the html layout files used for content display so that's where the search form needs to be displayed.

## Step 4: Success!

Here's how it looks without much work at all on usability:

{:.center}
![search.png](/blog/assets/search.png)

## Conclusion

This is about as simple an approach to search as you can get:

* Free
* Google might put ads on the results
* No control over search results presentation

But it is free, easy to understand and should work for almost anybody.
