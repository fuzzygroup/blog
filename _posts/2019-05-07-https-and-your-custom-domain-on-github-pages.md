---
layout: post
title: HTTPS And Your Custom Domain on Github Pages
category: https
tags: ["https", "blogging", "GitHub", "git"]
---
{% pizzaforukraine  %}

Github for sometime now has supported https for *.github.io (aka GitHub pages).  And they have allowed it for custom domains as well.  However I was never able to figure this out until yesterday.  Here was the magic process and well as some references.

My issue was that I had three “sites” hosted on GitHub pages:

* [http://www.fuzzyblog.io/](http://www.fuzzyblog.io/) - my personal home page and resume
* [http://www.fuzzyblog.io/blog/](http://www.fuzzyblog.io/blog/) - my blog
* [http://www.fuzzyblog.io/recipes/](http://www.fuzzyblog.io/recipes/)

I tend to look at my online presence mostly as my blog / recipes.  I had actually forgotten that the root personal home page site even existed.  And the issues preventing me from having https working amounted to this:

 * Changing the A records on my DNS provider (Amazon’s Route 53)
 * Waiting 24 hours for a certificate to be generated
 * Clicking the Enforce Https option on the GitHub Settings for the repo that drives fuzzyblog.io.  This has to be done first
 * Clicking the Enforce Https option on the GitHub Settings for all other GitHub Pages repos (for me this was blog and recipes)

*Note*: If you can’t remember which git repo drives your GitHub Pages, look in the directory and file .git/config. It will be right there; look for a url / .git filename.

*Note*: In case you were wondering why you want https, there are lots of reasons but the best is that it should give your content at least a small boost in page rank.

## Recommended Reading

Here are the recommended tech notes from Github on all this:

* [Supported Custom Domains](https://help.github.com/en/articles/about-supported-custom-domains)
* [Adding Custom Domains](https://help.github.com/en/articles/adding-or-removing-a-custom-domain-for-your-github-pages-site)
* [Troubleshooting Custom Domains](https://help.github.com/en/articles/troubleshooting-custom-domains#https-errors)
* [Press Release](https://github.blog/2018-05-01-github-pages-custom-domains-https/)