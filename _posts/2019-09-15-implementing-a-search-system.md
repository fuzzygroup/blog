---
layout: post
title: Implementing a Search System
category: search
tags: ["search"]
---
I started selling software with a search engine back in 1988 in our first hypertext product, Black Magic.  Our first release had close to zero search features but NASA contracted with us to add search features to our second release since they were using our software as the online documentation for the NASP project.  And ever since then I have been pretty intimately involved with search: 

* We grew our initial search engine thru a bunch of release culminating in a CD-ROM grade search and retrieval system.
* I worked for Dataware Technologies for 3.5 years building corporate Knowledge Management Systems which, sigh, were really collaborative document repositories based on the underlying [BRS engine](https://en.wikipedia.org/wiki/BRS/Search); still available today
* The metasearch engine I designed back in 1997 is still available today as [The OpenText Federated Query Server](https://www.ixtent.com/en/products/opentext-discovery-suite)
* I built the Feedster Blog / RSS Search Engine and took it from a few hundred blogs to over eighteen million (only to be thrown out by my own board but that's another story and, no, I'm not still bitter ...)
* Along the way I've used and analyzed most of the search tools out there from Folio Views to Verity to Guide to BRS to EPMS to InQuery   to Site Server to Lucene to ElasticSearch and more

So let's just posit that I know a few things about search, k?

The topic of this post is how you, as an end user, implement a search system and along the way I'm going to make a few observations about search as an industry.

**Note**: the key implementation point is at the end; apologizes for the digression into industry analysis, I've simply wanted to write this down for a damn long time.

## Search Is Not a Well Productized "Thing"

The first thing to understand is that search is **not a well productized thing**.  Companies have been trying to build businesses off of search now since the mid 1960s and yet, with the exception of Google, there is **no** general search vendor in the same way that there is a database vendor (Oracle).  And, to be really honest, I don't regard Google as a search vendor (they are an advertising company) because you can't really use Google for your own data.  Even the mighty Google, with literally billions of dollars, has chosen to [exit the model of selling search](https://en.wikipedia.org/wiki/Google_Search_Appliance).

**Note**: My personal belief is that Google has chosen to exit the business of selling search is because:

* Google's core relevancy ranking is tied to hyperlink analysis but that information doesn't exist within the firewall.
* The business opportunity for selling search simply isn't all that good compared to the business of selling advertising on global web search.  Advertising is an 80 billion dollar a year business for Google; selling search software is a teeny, tiny fraction of that -- even across all the search vendors.
* Selling search means providing technical support and Google is not good at that.

When I say that search is not a well productized thing, I mean that search is inherently a customized thing, a business opportunity that needs to be specific to each set of documents / corpus that you want to index.  Literally everything from the set of stop words, word length, user interface, indexing frequency, relevancy ranking, document formats and more needs to be customizable for a search tool to work well.  That level of customization makes providing a horizontal search product that is generally useful damn near impossible.

## Practical Tip 1: Start with One Document

With an understanding of why search is hard, here is the practical tip.  Implementing search, for anyone who isn't a damn expert, is very, very hard because what you are doing is generally working with headless, non-observable systems.  

A headless system is one that runs in the background, what is referred to as a daemon.  Search systems tend to have a number of headless tools (the indexer and the search engine).  The problem with headless systems is that you rarely know what is going on and that makes understanding what is happening sometimes damn near impossible.

When you have systems that are damn near impossible to understand, I find that when you approach them with an experimentation basis, you are better off.  The two techniques that I have always found are best to use with search tools are:

* Start with one document
* Instrument that Content

When I say that you start with a single document, I mean just that.  One of the key things to understand with any search system is how it takes in or **ingests** content.  For an internal search tool, this might be done with

* a crawler which starts at a web page and follows links
* a document collection on a SharePoint server
* a fileserver of documents
* a manual set of documents

Because you don't really understand how content is ingested, I regard starting with a single document as a key part of the approach.  What you want to understand is:

* how content comes in
* how long indexing takes
* how frequently indexing happens

And the best way to do this is reduce the variables in the process down to a single document.  What you do is create a document, give it to the search system and then see how long it takes for something to become searchable.  And then you change the document, by adding something unique to it, to see how long that change takes to become available.

## Practical Tip 2: Instrument the Content Base

My second practical tip is really simple - you want to instrument the content base.  In computer parlance, instrumenting something means to make it observable / knowable.  When you build search systems and the number of documents expands dramatically, you are faced with the problem of "how do you know that it works".  Let's say, for example, that you sell security systems and you have a set of documents, Microsoft Word, PowerPoint, Excel that all talk about your products.  And let's posit that, as a global vendor, you have say 10,000 documents.  If your search system was to fail to find something -- would you ever know?  And the correct answer here is that, generally speaking, you wouldn't.  

Internal document collections suffer from the problem of being homogenous in nature -- the documents are mostly the same.  And that means it is really hard to tell if something that should be returned for a given query actually was ever even indexed.  The easiest way around this is to instrument your content base by putting in some content that should only exist for you, the search administrator. It needs to be something that no one, other than you, will ever search for in the context of your corpus.  Here are some options:

* A favorite author's name - say Heinlein or Bujold
* A favorite character's name that is distinctive as hell - Vorkosigan 
* If you have a set of initials that are consonants only, say LDM or BCG or JSJ, these tend to not be english language words (no vowels) so they are utterly unique.  

**Note**: Make sure if you use the initials approach that your search engine is indexing 3 letter words.

And what you do is create a single document, in each of the formats that you want to index, that contains your instrumentation content.  So if we are a search engine for an internal set of documents, we might make documents in the form:

* pdf
* word
* excel
* powerpoint
* html

that each have our specialized content.  You then let these be indexed - forever - as a "control group" on your search.  So if your specialized word was Vorkosigan, you should, for every search, have 5 results that come back, one per format.

**Note**: I guess this violates the single document principle.  Sorry.

## Sidebar: What Makes Up a Search Tool

Generally speaking with search tools there are a few components:

* The **indexer** which takes content in and makes the index against which queries are done
* The **query parser** which takes the query from the user and then pre-processes it before it goes to the search engine
* The **search engine** which accepts a query and returns a list of results
* The **relevancy ranker** which takes the list of results and orders them correctly; this is often internal to the engine but it doesn't have to be
* The **user interface**, these days HTML into which a query is entered and the 
* The **admin tools** which generally range from ok to abysmal.  These are completely different 

## Practical Tip 3: Don't Bother with a Fielded User Interface

When you start to deploy search software, everyone always wants to play with the user interface and build a fielded user interface.  Don't; just don't.  Your users simply won't bother.  Google has created a global consciousness that search is a single field that magically gives you what you need.  This is the user interface that you want to implement.  

**Note**: Under the hood and behind the scenes, the query that a search engine gets from a single field is often parsed and a fielded query is constructed which the search engine then runs.  

There are rare occasions where an actual fielded user interface is needed but this is an edge case that you only want to approach after users actually ask for it.  And, in my opinion, even if they ask for it, they won't often use it.

If you really want to provide a fielded user interface, I would encourage you to simply document the query language that your search engine uses.  Almost all search engines have an actual query language right down to field operators.

## I'm Available / Hire Me

As with everything I write, if I'm writing it, it means that I'm available as an expert.  I am a consultant these days and I trade $$$ for time and expertise.
