---
layout: post
title: Simple Search and Replace in Ruby
category: ruby
tags: ["ruby"]
---
{:.center}
![IMG_2674.jpeg](/blog/assets/IMG_2674.jpeg)

The other day I needed to take some regular expressions and convert them to strings.  And while executing a .to_s on the regular expression itself worked correctly it brought through the regular expression characters so there were things like:

    covid[ -]19

where what I was looking for was just the "covid19" bit (I was generating hashtags from the matched regular expressions for the new [CovidNearMe News Aggregator](https://covidnearme.org/news)).  I started digging into the [Ruby string library](https://apidock.com/ruby/String/) and didn't find what I was looking for - a str_replace like command.  I also experimented a bit with [tr](https://apidock.com/ruby/String/tr) but that proved to be misleading at best.

Not surprisingly, [Stack Overflow](https://stackoverflow.com/questions/13333116/how-do-i-search-and-replace-strings-not-regex-in-ruby) came to the rescue and the answer was blindingly simple:

* Use sub
* Use gsub

but **don't** specify a pattern; just specify a **string**.  If you don't have:

    .gsub(/foo/,'bar')     

but instead 

    .gsub('foo','bar')

With this approach, you can then either use sub or gsub depending on how you need the search and replace executed.  This is a truly ruby-esque approach and one I should have anticipated.