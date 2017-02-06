---
layout: post
title: Linux Tip of the Day - jq
category: linux
tags: ["linux_tip_of_the_day", "linux", "jq"]
description: Linux Tip of the Day - Use jq for command line JSON processing.
image: http://fuzzyblog.io/blog/assets/jq.png
---
I made either the happy decision to do some late night Hacker News reading last night and I found a really interesting bash script -- **[hncomments](https://github.com/jgrahamc/hncomments/blob/master/hncomments)**.  This is a tool which looks at a data feed from HackerNews, through the algolia search engine, and emails you when comments matching what you are interested in appear.  My interest in it stemmed from its author - [John Graham Cumming (jgrahamc)](http://www.jgc.org/).  He's one of those programmers who I've always admired purely from an intellectual basis.  Anyone who can write books with the intellectual breadth of [Geek Atlas](https://www.amazon.com/gp/product/0596523203?ie=UTF8&tag=jgcorg-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0596523203), [Gnu Make](https://www.nostarch.com/gnumake) and [Introduction to Go](http://shop.oreilly.com/product/0636920035305.do) has to be worth admiring.

Anyway I went to get this running and realized that it requires dependencies of jq, recode, sed and curl -- and I didn't even know what jq was so my thought was *this is a series of Linux Tips of the Day!*.  For the next few days I'll be talking about each of these starting with jq.  So, John, thank you for the idea and here's a tip on JQ.  After I write tips for each of these, I'll follow through with getting this whole thing running.

The Linux tool jq is a command line JSON processor designed to use JSON as part of a Unix pipeline.  In the case of the hncomments bash script, jq takes input from the the [algolia](http://www.algolia.com) output as called by curl.

To install jq on Linux, use:

> sudo apt-get install jq

But you might not have to -- it was already installed for me even on servers I control which have pretty limited tools so this feels like it might be a standard tool.

To install jq on OSX, use:

> brew install jq

Help is available, as it always should be (but often isn't), with --help.  Here's an example:

```bash
sjohnson@FuzzygroupMacbookAir ~ $ jq --help
jq - commandline JSON processor [version 1.5]
Usage: jq [options] <jq filter> [file...]

	jq is a tool for processing JSON inputs, applying the
	given filter to its JSON text inputs and producing the
	filter's results as JSON on standard output.
	The simplest filter is ., which is the identity filter,
	copying jq's input to its output unmodified (except for
	formatting).
	For more advanced filters see the jq(1) manpage ("man jq")
	and/or https://stedolan.github.io/jq

	Some of the options include:
	 -c		compact instead of pretty-printed output;
	 -n		use `null` as the single input value;
	 -e		set the exit status code based on the output;
	 -s		read (slurp) all inputs into an array; apply filter to it;
	 -r		output raw strings, not JSON texts;
	 -R		read raw strings, not JSON texts;
	 -C		colorize JSON;
	 -M		monochrome (don't colorize JSON);
	 -S		sort keys of objects on output;
	 --tab	use tabs for indentation;
	 --arg a v	set variable $a to value <v>;
	 --argjson a v	set variable $a to JSON value <v>;
	 --slurpfile a f	set variable $a to an array of JSON texts read from <f>;
	See the manpage for more options.
```

Because this is designed to be used as part of a pipeline and you have to data in JSON format for it to work, I'm going to illustrate its use by stealing from the **hncomments** bash script (thank you John!):

```bash
j=`curl -s "https://hn.algolia.com/api/v1/search_by_date?query=$q&tags=comment&numericFilters=created_at_i>$l"`

if [ "$j" == "" ] ; then
  exit 0
fi

n=`jq '.hits | .[] | .created_at_i' <(echo $j) | sort -nr | head -n 1` 
if [ "$n" == "" ] ; then
  exit 0
fi
echo $n > $f
```

For purposes of illustration, let's assume that $q is **docker**.  This means that the curl statement is executing the url at hn.algolia.com and returning it as $j.  The jq tool is then filtering down the json by looking for the hash key "hits" in the json output.  Here's an example of what the start of that output looks like:

> {"hits":[{"created_at":"2017-02-06T08:29:47.000Z","title":null,"url":null,"author":"schappim","points":null,"story_text":null,"comment_text":"Function as a service (like AWS Lambda, Google Cloud Functions and Azure Functions) for Ruby.

More on all of this tomorrow when I look into recode.