---
layout: post
title: Rails Tutorial - Setting Up Sphinx Search with Rails and Thinking Sphinx
category: rails
tags: ["rails", "sphinx", "sphinx_search", "thinking_sphinx"]
---
Sphinx Search is an open source search product that powers CraigsList as well as lots of other things on the Internet.  Unfortunatey Sphinx Search has more than a bit of a reputation of being finicky to configure and get working.  Given that it is both Linux and Open Source, this likely isn't suprising.  The rest of this short tutorial covers how to get Sphinx Search working with Ruby on Rails using the Thinking Sphinx gem in a relatively standard configuration such as this:

* database server
* indexing / search server 

The first problem you're going to hit with Sphinx Search is absolutely atrocious documentation.  This is true both of Sphinx Search itself and the Thinking Sphinx ruby gem (both of these criticisms, as with all such things are IMHO).

Elastic File System