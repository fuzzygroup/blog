---
layout: post
title: SED Example - The Swiss Army Chainsaw of Text Changes
category: text_processing
tags: ["sed"]
---
The unix command line tool sed is one of those things that you don't know you need -- until you need it worse than anything in the whole damn world and then nothing else does what sed does.  sed which I'm pretty sure is short for streaming editor is a tool which does an edit on a file via regular expressions without actually opening the file in an interactive fashion.  This means that you can edit, oh say a 100 meg file, and do it **fast**.  In years past I used sed for surgery on large MySQL dump files but I haven't touched it since 2003 when I lived in Newton, Massachusetts back the old blogging days.

My buddy [Nick](http://www.nickjanetakis.com/) and I were pairing today and we had to update a Sphinx Search config file.  I stumbled over the vim search and replace syntax and he was like here:

    sed -ie 's/old/new/g' hello.txt
    
and with that one example I knocked it out in nothing flat.  What this example does is search for the regex *old* and replace it with *new* and do it globally in the file hello.txt.

Here's a good tutorial on [sed](http://www.grymoire.com/Unix/Sed.html).  Recommended.  Thanks Nick!
