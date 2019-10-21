---
layout: post
title: HoneyBadger - Even More Awesome than Ever
category: ["rails"]
tags: ["rails"]
---
{:.center}
![IMG_9584.jpeg](/blog/assets/IMG_9584.jpeg)

My new side project is hosted on Heroku and while Heroku is delightfully easy to deploy projects to, it has a limit on log files of 1500 lines.  That's basically close to zero for even a tiny side project so I moved to using [HoneyBadger](https://www.honeybadger.io) for error handling.

HoneyBadger is one of those tools that I've watched ever since it started and I've seen it become consistently better over the years.  I haven't used in a bit and I cannot state just how awesome the overall experience and how **thoughtfully designed** every aspect of it was.

Here are some of the features that were new to me:

* Jira Integration (convert an exception to a Jira issue)
* Delegated credit card support (allows a developer's boss to add the credit card without giving it to the developer)
* 25+ different integrations
* Github Issue integration
* Uptime monitoring
* Support for a metric crap ton of languages including: Ruby, Javascript, Elixir, Go, NodeJS, Java, Python, PHP, Clojure, C#, Crystal, Haskell, Google Apps Scripts

**Absolutely Recommended**.

Oh and in contrast, I also looked at [Timber.io](https://www.timber.io) (logfile capture versus exception monitoring; two approaches to the same thing and Timber.io doesn't even work with Rails 6 so, well, NOPE!)