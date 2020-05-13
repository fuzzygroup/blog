---
layout: post
title: Die URI.parse Die; Long Live the Zen of Addressable
category: ruby
tags: ["ruby"]
---
{:.center}
![IMG_2628.jpeg](/blog/assets/IMG_2628.jpeg)

URI.parse is a Ruby call I've written a thousand plus times.  The unfortunate reality of URI.parse is that it doesn't work when there are UTF-8 characters in the url.  The work around is the addressable gem.  So:

## Gemfile

    gem "addressable"

## Example Usage 

    require 'addressable/uri'
    url = 'http://www.example.com/wp content/uploads/2012/01/München.jpg'
    parts = Addressable::URI.parse(url)

## Sources
* [Stack Overflow] (https://stackoverflow.com/questions/9082732/how-can-i-extract-a-url-with-non-english-characters-from-a-string)
* [Home Page](https://github.com/sporkmonger/addressable)

## Shoutout

I can't even think about URL parsing in Ruby / Elixir / JavaScript without mentioning [Gamache's FuzzyUrl library](https://github.com/gamache/fuzzyurl.rb).  Highly, highly recommenderd.