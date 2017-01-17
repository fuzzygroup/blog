---
layout: post
title: Ruby - How to Sort an Open Struct
category: ruby
tags: ["ruby", "rails", "hyde"]
---
I am a huge, huge fan of the OpenStruct class in Ruby.  OpenStruct lets you build data structures that act like classes complete with dot notation.  Underlying OpenStruct is really a hash like structure with some semantic niceties that enable the dot methods.

I recently started building a fairly complex structure that represents a blog's metadata and I wanted my keys to be sorted not structured willy nilly.  A little bit of thought and looking at the methods that an OpenStruct instance responds to gave me this:

    b = OpenStruct.new
    # complicated routine here that builds the metadata
    b.to_h.sort.to_h
    
All this is doing is taking the OpenStruct, converting it to a hash and sorting it and converting it back to a hash -- easy peasy!
