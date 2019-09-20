---
layout: post
title: So You Have to Make a Meta Schema
category: software_engineering
tags: ["software_engineering", "schema"]
---
{:.center}
![IMG_8992.jpeg](/blog/assets/IMG_8992.jpeg)


I find myself, once again, needing to make a "meta schema".  This is a database schema by which you map data from N external sources into a single repository.  The challenge here is that you need to:

* define a set of tables into which incoming objects can be decomposed
* define a set of common elements across all the different types of data 
* normalize all the data as it comes in

I've done this a number of times in my career but I normally do it in the dark of the night and I don't talk about it (kidding).  I thought this time around though I might improve the process by actually formalizing it and documenting it.

If you are going to make a meta schema, here is what you need:

* examples of each of the different formats
* a print out of at least one instance of each of the different formats
* colored pens or markers

The way that I generally do this is I print out an example of each format type and I put them on a table side by side.  Then I start color coding elements within the format.  As I color code, what I have always found is that commonalities emerge.  For example in the screenshot below purple is about media elements.  And here's what you can see:

* one source has no media elements
* one source has one media element
* one source has multiple media elements

And what that **instantly** tells us is that media elements are going to be stored in a separate table in a has_many type relationship.

The next step in all this is to figure out how each element from each source maps to the corresponding elements in the other sources.  For example:

* one source calls the content "body"
* one source calls the content "comment"
* one source calls the content "message"

What this tells me that this is going to need to be a mapping rule that filters each of these types of content into a table and the right column.  I can't simply load these (or really any) columns directly.

And that's the essence of building a meta schema -- you take lots of samples of data and you look for commonalities.  And this is a process that I have always found flows better when it is done on paper rather than on screen.  