---
layout: post
title: Miller - A Swiss Army Chainsaw for CSV Data, Data Science and Data Munging
date: 2022-05-13 12:54 -0400
category: data_science
tags: ["data_science", "csv", "miller"]
---
{% pizzaforukraine  %}

Every so often I run into a tool which just impresses me.  This time it is [Miller](https://miller.readthedocs.io/en/latest/).  And when I find such a tool, I write up a blog post to firm up my learnings.  Here is the official description:

 >> Miller is a command-line tool for querying, shaping, and reformatting data files in various formats including CSV, TSV, JSON, and JSON Lines.
 
The people that know me know that I've spent literal man years working with textual data, often CSV format -- I first got started at this using Awk, specifically the NTERGAID version of Awk called HyperAwk and then I've done the Perl dance, spent time in the bowels of the abyss that is Sed, PHP, Python and Ruby.  A lot of the ad hoc scripting I've written over the years can be accomplished via Miller and that is a lovely change.

Just as a note, Miller's docs are really quite excellent and it is a sophisticated tool.  This blog post really only touches a bit on what Miller is capable of.  If you don't find what you are looking here then hit the [docs](https://miller.readthedocs.io/en/latest/).
 
## Installation
 
I'm on a Mac so all this took was:
 
    brew install miller
 
To confirm this works, just type:
 
    mlr --version
 
and you should get back something like 6.x.y.  I got:

    mlr 6.2.0
 
## General Command Structure and Operation
 
Miller is a command line tool that operates with commands like this:
 
    mlr --csv sort -f name input.csv
 
Basically the syntax amounts to:
 
 * input type
 * command verb (sort in this case)
 * option flag
 * input source
 
## Getting Help

The --help flag gives you help:

		mlr --help
		Usage: mlr [flags] {verb} [verb-dependent options ...] {zero or more file names}

		If zero file names are provided, standard input is read, e.g.
		  mlr --csv sort -f shape example.csv

		Output of one verb may be chained as input to another using "then", e.g.
		  mlr --csv stats1 -a min,mean,max -f quantity then sort -f color example.csv

		Please see 'mlr help topics' for more information.
		Please also see https://miller.readthedocs.io
 
The mlr help topics command is quite informative:

		mlr help topics
		Type 'mlr help {topic}' for any of the following:
		Essentials:
		  mlr help topics
		  mlr help basic-examples
		  mlr help file-formats
		Flags:
		  mlr help flags
		  mlr help list-separator-aliases
		  mlr help list-separator-regex-aliases
		  mlr help comments-in-data-flags
		  mlr help compressed-data-flags
		  mlr help csv/tsv-only-flags
		  mlr help file-format-flags
		  mlr help flatten-unflatten-flags
		  mlr help format-conversion-keystroke-saver-flags
		  mlr help legacy-flags
		  mlr help miscellaneous-flags
		  mlr help output-colorization-flags
		  mlr help pprint-only-flags
		  mlr help profiling-flags
		  mlr help separator-flags
		Verbs:
		  mlr help list-verbs
		  mlr help usage-verbs
		  mlr help verb
		Functions:
		  mlr help list-functions
		  mlr help list-function-classes
		  mlr help list-functions-in-class
		  mlr help usage-functions
		  mlr help usage-functions-by-class
		  mlr help function
		Keywords:
		  mlr help list-keywords
		  mlr help usage-keywords
		  mlr help keyword
		Other:
		  mlr help auxents
		  mlr help mlrrc
		  mlr help output-colorization
		  mlr help type-arithmetic-info
		Shorthands:
		  mlr -g = mlr help flags
		  mlr -l = mlr help list-verbs
		  mlr -L = mlr help usage-verbs
		  mlr -f = mlr help list-functions
		  mlr -F = mlr help usage-functions
		  mlr -k = mlr help list-keywords
		  mlr -K = mlr help usage-keywords
		Lastly, 'mlr help ...' will search for your exact text '...' using the sources of
		'mlr help flag', 'mlr help verb', 'mlr help function', and 'mlr help keyword'.
		Use 'mlr help find ...' for approximate (substring) matches, e.g. 'mlr help find map'
		for all things with "map" in their names.
		
Here is an example for mlr help list-verbs:

		mlr help list-verbs

		altkv bar bootstrap cat check clean-whitespace count-distinct count
		count-similar cut decimate fill-down fill-empty filter flatten format-values
		fraction gap grep group-by group-like having-fields head histogram json-parse
		json-stringify join label least-frequent merge-fields most-frequent nest
		nothing put regularize remove-empty-columns rename reorder repeat reshape
		sample sec2gmtdate sec2gmt seqgen shuffle skip-trivial-records sort
		sort-within-records split stats1 stats2 step tac tail tee template top
		unflatten uniq unsparsify
 
## Simple Examples
 
I've always found that tools like Miller are best learned from examples so I'm going to write down a number of them.  All or most of these examples will just write to the screen but be fully aware that Miller supports standard Unix output redirection so you can just add "> /file.csv" and direct the output to the specified file.
 
### Listing a CSV File
 
The **cat** command verb just outputs data as a pass through:
 
    mlr --csv cat  /Users/sjohnson/Downloads/cases_0323.csv
 
### Listing the First 4 Lines of a CSV File
 
The **head** command verb lists lines from the beginning of the file.  The "-n 4" tells Miller to only output the first four lines.
 
    mlr --csv head -n 4  /Users/sjohnson/Downloads/cases_0323.csv
	
Here is the result of this command so you can see the data I'm working with:

		FIPS,Admin2,Province_State,Country_Region,Last_Update,Lat,Long_,Confirmed,Deaths,Recovered,Active,Combined_Key
		45001,Abbeville,South Carolina,US,2020-03-23 03:32:31,34.22333378,-82.46170658,1,0,0,0,"Abbeville, South Carolina, US"
		22001,Acadia,Louisiana,US,2020-03-23 03:32:31,30.295064899999996,-92.41419698,0,0,0,0,"Acadia, Louisiana, US"
		51001,Accomack,Virginia,US,2020-03-23 03:32:31,37.76707161,-75.63234615,1,0,0,0,"Accomack, Virginia, US"
		16001,Ada,Idaho,US,2020-03-23 03:32:31,43.4526575,-116.24155159999998,13,0,0,0,"Ada, Idaho, US"
 
Here is me redirecting this to make a small test file:
 
    mlr --csv head -n 4  /Users/sjohnson/Downloads/cases_0323.csv > ~/Downloads/miller.csv

**Note**: This small test file will be used later for specific examples.

And here is the proof that it did what I instructed it to:

		mlr --csv cat  ~/Downloads/miller.csv
		FIPS,Admin2,Province_State,Country_Region,Last_Update,Lat,Long_,Confirmed,Deaths,Recovered,Active,Combined_Key
		45001,Abbeville,South Carolina,US,2020-03-23 03:32:31,34.22333378,-82.46170658,1,0,0,0,"Abbeville, South Carolina, US"
		22001,Acadia,Louisiana,US,2020-03-23 03:32:31,30.295064899999996,-92.41419698,0,0,0,0,"Acadia, Louisiana, US"
		51001,Accomack,Virginia,US,2020-03-23 03:32:31,37.76707161,-75.63234615,1,0,0,0,"Accomack, Virginia, US"
		16001,Ada,Idaho,US,2020-03-23 03:32:31,43.4526575,-116.24155159999998,13,0,0,0,"Ada, Idaho, US"
 
**Note**: This is data from the US Covid Pandemic that was originally put into my [Covid Near Me](https://www.covidnearme.org) project.
 
### Listing the Last 4 Lines of a CSV File
 
The **tail** command verb works from the end (tail) of the file instead of the beginning (head).
 
    mlr --csv tail -n 4  /Users/sjohnson/Downloads/cases_0323.csv
 
### Sorting a CSV File by Column Name
 
The **sort** command verb does just that -- it sorts the file.
 
    mlr --csv sort -f FIPS ~/Downloads/miller.csv
 
And here's the result of that sort:
 
		FIPS,Admin2,Province_State,Country_Region,Last_Update,Lat,Long_,Confirmed,Deaths,Recovered,Active,Combined_Key
		16001,Ada,Idaho,US,2020-03-23 03:32:31,43.4526575,-116.24155159999998,13,0,0,0,"Ada, Idaho, US"
		22001,Acadia,Louisiana,US,2020-03-23 03:32:31,30.295064899999996,-92.41419698,0,0,0,0,"Acadia, Louisiana, US"
		45001,Abbeville,South Carolina,US,2020-03-23 03:32:31,34.22333378,-82.46170658,1,0,0,0,"Abbeville, South Carolina, US"
		51001,Accomack,Virginia,US,2020-03-23 03:32:31,37.76707161,-75.63234615,1,0,0,0,"Accomack, Virginia, US"
		
Here is a sort on the Province_State field:

		mlr --csv sort -f Province_State ~/Downloads/miller.csv

Here are the results of that sort:

		FIPS,Admin2,Province_State,Country_Region,Last_Update,Lat,Long_,Confirmed,Deaths,Recovered,Active,Combined_Key
		16001,Ada,Idaho,US,2020-03-23 03:32:31,43.4526575,-116.24155159999998,13,0,0,0,"Ada, Idaho, US"
		22001,Acadia,Louisiana,US,2020-03-23 03:32:31,30.295064899999996,-92.41419698,0,0,0,0,"Acadia, Louisiana, US"
		45001,Abbeville,South Carolina,US,2020-03-23 03:32:31,34.22333378,-82.46170658,1,0,0,0,"Abbeville, South Carolina, US"
		51001,Accomack,Virginia,US,2020-03-23 03:32:31,37.76707161,-75.63234615,1,0,0,0,"Accomack, Virginia, US"
 
### Converting a CSV to JSON
 
The **tail** command verb can be combined with the "-o" output flag to give you json conversion:
 
      mlr --icsv --ojson tail -n 2 /Users/sjohnson/Downloads/cases_0323.csv

**Note**: This also works with --csv (the -icsv is another way to indicate the input format).

If you wanted to convert just the beginning of the file then you'd use the **head** command:

      mlr --icsv --ojson head -n 2 /Users/sjohnson/Downloads/cases_0323.csv

And if you wanted to do the whole file then you'd use the **cat** command:

      mlr --icsv --ojson cat /Users/sjohnson/Downloads/cases_0323.csv

### Pretty Printing a CSV

The -opprint output flag (pprint is short for pretty print) can be used to give more easily understand human output:

    mlr --csv --opprint cat ~/Downloads/miller.csv

		FIPS  Admin2    Province_State Country_Region Last_Update         Lat                Long_               Confirmed Deaths Recovered Active Combined_Key
		45001 Abbeville South Carolina US             2020-03-23 03:32:31 34.22333378        -82.46170658        1         0      0         0      Abbeville, South Carolina, US
		22001 Acadia    Louisiana      US             2020-03-23 03:32:31 30.295064899999996 -92.41419698        0         0      0         0      Acadia, Louisiana, US
		51001 Accomack  Virginia       US             2020-03-23 03:32:31 37.76707161        -75.63234615        1         0      0         0      Accomack, Virginia, US
		16001 Ada       Idaho          US             2020-03-23 03:32:31 43.4526575         -116.24155159999998 13        0      0         0
		
Of course the cat command verb can be replaced by sort:

		mlr --csv --opprint sort -f Province_State ~/Downloads/miller.csv

		FIPS  Admin2    Province_State Country_Region Last_Update         Lat                Long_               Confirmed Deaths Recovered Active Combined_Key
		16001 Ada       Idaho          US             2020-03-23 03:32:31 43.4526575         -116.24155159999998 13        0      0         0      Ada, Idaho, US
		22001 Acadia    Louisiana      US             2020-03-23 03:32:31 30.295064899999996 -92.41419698        0         0      0         0      Acadia, Louisiana, US
		45001 Abbeville South Carolina US             2020-03-23 03:32:31 34.22333378        -82.46170658        1         0      0         0      Abbeville, South Carolina, US
		51001 Accomack  Virginia       US             2020-03-23 03:32:31 37.76707161        -75.63234615        1         0      0         0      Accomack, Virginia, US

### Changing the Shape of Your Data - cut

The cut command verb changes the shape of your data by extracting only the specified fields:

    mlr --csv --opprint cut -f FIPS,Admin2,Province_State  ~/Downloads/miller.csv

Here is the output:

		FIPS  Admin2    Province_State
		45001 Abbeville South Carolina
		22001 Acadia    Louisiana
		51001 Accomack  Virginia
		16001 Ada       Idaho
		
### Diving into Your Data - count-distinct

A lot of times you want to get a feel for a dataset by looking at its counts.  The **count-distinct** command verb works for that.

    mlr --c2p --from ~/Downloads/miller.csv count-distinct -f Province_State | head

		Province_State count
		South Carolina 1
		Louisiana      1
		Virginia       1
		Idaho          1
		
If we run this on our original input file, we see results like this:

    mlr --c2p --from ~/Downloads/cases_0323.csv count-distinct -f Province_State | head -n10

		Province_State               count
		South Carolina               46
		Louisiana                    65
		Virginia                     133
		Idaho                        44
		Iowa                         99
		Kentucky                     121
		Missouri                     117
		Oklahoma                     77
		Colorado                     65
		
## Conclusion

This is 1,468 words long and it barely touches on the coolness that is Miller.  Kudos to [John Kerl](https://github.com/johnkerl/) for producing such a wonderful tool.