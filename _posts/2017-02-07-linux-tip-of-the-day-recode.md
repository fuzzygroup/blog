---
layout: post
title: Linux Tip Of The Day - recode
category: linux
tags: ["linux_tip_of_the_day", "linux", "jq"]
description: Linux Tip of the Day - Use jq for command line JSON processing.
image: http://fuzzyblog.io/blog/assets/recode.png
---
As I discussed [yesterday](http://fuzzyblog.io/blog/linux/2017/02/06/linux-tip-of-the-day-jq.html), I'm currently talking about the dependencies in John Graham Cummings, [hncomments](https://github.com/jgrahamc/hncomments/blob/master/hncomments) bash script.  At the end of this I'm hoping that I have all the pieces that I can actually run this myself.  

The recode tool, a utility I had never even heard of, converts files between various character sets.  Given all the troubles I've had over the years with crawling the different app stores and encodings, I'm glad to learn about this.

If you're on Linux then you can install recode with:

> sudo apt-get install recode 

If you're on OSX then install recode with: 

> brew install recode

Use recode --help to get assistance (this is only a subset of the help):

```bash
recode --help
Free `recode' converts files between various character sets and surfaces.

Usage: recode [OPTION]... [ [CHARSET] | REQUEST [FILE]... ]

If a long option shows an argument as mandatory, then it is mandatory
for the equivalent short option also.  Similarly for optional arguments.

Listings:
  -l, --list[=FORMAT]        list one or all known charsets and aliases
  -k, --known=PAIRS          restrict charsets according to known PAIRS list
  -h, --header[=[LN/]NAME]   write table NAME on stdout using LN, then exit
  -F, --freeze-tables        write out a C module holding all tables
  -T, --find-subsets         report all charsets being subset of others
  -C, --copyright            display Copyright and copying conditions
      --help                 display this help and exit
      --version              output version information and exit

Operation modes:
  -v, --verbose           explain sequence of steps and report progress
  -q, --quiet, --silent   inhibit messages about irreversible recodings
  -f, --force             force recodings even when not reversible
  -t, --touch             touch the recoded files after replacement
  -i, --sequence=files    use intermediate files for sequencing passes
      --sequence=memory   use memory buffers for sequencing passes
  -p, --sequence=pipe     use pipe machinery for sequencing passes

Fine tuning:
  -s, --strict           use strict mappings, even loose characters
  -d, --diacritics       convert only diacritics or alike for HTML/LaTeX
  -S, --source[=LN]      limit recoding to strings and comments as for LN
  -c, --colons           use colons instead of double quotes for diaeresis
  -g, --graphics         approximate IBMPC rulers by ASCII graphics
  -x, --ignore=CHARSET   ignore CHARSET while choosing a recoding path
```

If we go back to the source on hncomments then we can see how recode fits in:

> jq -r '.hits | .[] | .author + "\nhttps://news.ycombinator.com/item?id=" + .objectID + "\n\n" + .comment_text + "\n\n---\n\n"' <(echo $j) | sed -e 's/<[^>]*>/ /g;' | **recode** -f html..ascii | mail -s "Latest $q HN comments" $e

Here recode is taking the output from sed and converting it from html character encoding to ASCII.  