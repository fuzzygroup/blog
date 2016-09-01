---
layout: post
title: Curse Your Curly Quotes or Crazy Chef Error Messages
category: chef
tags: ["ruby", "curly quotes"]

---
One of the reasons that I started blogging and continue to blog* is personal knowledge capture.  My own blog represents the knowledge that I gather during the course of my day to day work.  And that brings us to this crazy error message:

<pre>
"chef" "ERROR: Encoding::CompatibilityError: incompatible character encodings: ASCII-8BIT and UTF-8"
</pre>

I got this when I was running a single chef routine that I had documented here (see my last post on Chef):

<pre>
bundle exec knife solo cook appdata@app1.pagedatapro.com -o 'server_setup::vim_configuration'
</pre>

So I was pretty much certain that it worked.  Well it did.  But the representation in my blog was actually wrong -- the single quotes had been transposed to single curly quotes in either direction.  Oy! 

*Albeit after a multi year hiatus that I regretted constantly and still regret.