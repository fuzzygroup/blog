---
layout: post
title: Data Science - Data Sets versus a Data Repository
category: data_science
tags: ["data_science", "python"]
---
{:.center}
![IMG_8784.jpeg](/blog/assets/IMG_8784.jpeg)

I have to begin this by stating definitively that I am not a Data Scientist myself (I don't have the math / statistics chops) but:

* I've done data science work
* I've managed data scientists where they were among my direct reports
* I am a damn good software engineer with a ton of experience in data acquisition, data normalization (which are key data science issues)

So I think I'm qualified to talk on these matters.

I've spent much of the past few days dealing with issues around a large data set (100 million posts; 15 gigs stored in a compressed ZST file).  Even today when you start dealing with individual files that are larger than a few gigs, you actually have problems.  This 15 gig file had to be split into multiple 2 gig chunks to be distributed to me via our cloud storage tool  ([box.com](https://www.box.com/); sidebar - how can you call yourself a storage company and have a limit of 2 gigs per file; I mean ... WHAT ????).  And the confusion / issues around getting all 7 parts and then correctly joining them together cost me about a day of work due to download time and then multiple hour long runs getting interrupted because I thought I had a complete data set when I actually didn't.

A data repository is a different thing from a data set.  A data repository is a database of the records that make up your data set that is accessed either by SQL or by a formal API.  Unlike a data set, a data repository represents a "source of truth".  So while you might have Code Base XYZ and Bill might have a dataset of records he tests with and Beverly might have a different set of records that she tests with thus leading to different results, if Bill and Beverly tested against a data repository, they should get the same result.

So thinking about these issues makes me want to state something dramatic like:  "There shall always be a data repository; this bull crap around big archives is stupid and shall not be done" but that's a short sighted approach that ignores how practical data science is often done.  An awful lot of data science is **exploratory** in nature and involves going through data over and over.  And the simple nature of a local file is that it can always be browsed / explored faster than a network resource such as a data repository.  Also there are a [variety of tools / pipelines](https://fuzzyblog.io/blog/data_science/2019/09/03/interesting-data-science-utilities.html) that can be used with standard files that don't work with a repository style approach.

And this makes me think that data sets exist alongside a data repository.  In fact I think the process is something like this:

1.  Data is acquired and initially goes into a file based data set (maybe a zst file; maybe a directory of CSV files or something else).
2. At some point when the data is sufficiently valuable / verified / important then it is imported into a data repository so it becomes a central point of truth.
3. Down the road the data repository is used to generate one or more data sets for ongoing work.  One of the benefits of this is that you could dynamically generate different datasets like "stuff in 2018" versus "stuff in 2017" so you could see changes.

How you distribute the data set files is something that still needs to be determined.  Obvious candidates include: 

* S3
* FTP
* Bittorrent