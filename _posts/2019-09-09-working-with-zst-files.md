---
layout: post
title: Working with ZSTD Files
category: linux
tags: ["linux", "zstd"]
---
I love open source developers but there are times when I question their damn naming practices.  I'm currently working with a giant data repository started as a "Z Standard" or "zstd" compressed file.  And while I know that means "Z Standard", I can't help but look at it as "Z std".  Oy.  

Anyway.  Zstd is a [Facebook standard for data compression](https://github.com/facebook/zstd) and it is strikingly effective.  I've got over 100 gigs of JSON encoded data stored in a 13.7 gig file.  Now I am aware that text compresses actually quite well but still 100 gigs in 13.7 gigs of space feels like **wow**.

## Tools

If you're on a Mac then brew, as always, is your very best friend:

    brew install zstd

## Useful Command Lines

Assume that pol.zst is the name of the archive and it is located in your current directory.

Examining a handful of records:

    zstd -cd pol.zst | head -n100

this dumps a stream of records out that are then fed into head which limits the quantity to 100.

The zstd -c and -d options mean:

    -c     : force write to standard output, even if it is the console
    -d     : decompression

Integrating the often useful jq (which just gets a single json element out):

    zstd -cd pol.zst | jq '.timestamp'

And like all good *nix pipelines, this is composable (this example would extract the first 1000 records and then reduce them to only the comment element from the json):

    zstd -cd pol.zst | head -n1000 | jq '.comment'

Happily help is also available with:

    zstd --help

## Thank You's

Kudos to Facebook for another great bit of Open Source contributed back to the world.  Also thanks to [Grant Vousden-Dishington](https://grantrvd.github.io/), the contributor of these command lines. He's been doing Zstd for a while; I'm the noob here.

