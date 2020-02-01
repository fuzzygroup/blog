---
layout: post
title: The Power of production In development
category: rails
tags: ["rails"]
---
{:.center}
![IMG_1647.jpeg](/blog/assets/IMG_1647.jpeg)

I spent a lot of time today trying to get something to deploy and hitting a near unending set of small issues that still broke the entire deploy (Rails in production mode is WAY less forgiving than Rails in development mode).  And, to be honest, the constant stream of cursing was, perhaps, my less than finest moment (friends of mine, at least two, are now laughing hard).

An old school trick for helping with this is to run production mode locally and see if rails console comes up.  As a general rule of thumb, if rails console works, then rails itself will work.  

Here's how to do this:

    RAILS_ENV=production bundle exec rails c

And this one, simple, stupid trick tends to reveal a lot of issues.  **Recommended**.