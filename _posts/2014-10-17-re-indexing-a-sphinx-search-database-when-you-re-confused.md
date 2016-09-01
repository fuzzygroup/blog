---
layout: post
title: Re-indexing a Sphinx Search Database when You're Confused
category: sphinx
tags: ["sphinx"]

---
This is a useful little one liner:

sudo /usr/bin/indexer --config /etc/sphinxsearch/sphinx.conf --all --rotate