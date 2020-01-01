---
layout: post
title: JumpStart Pro Rails FAQ
---

## Question:

## Answer: You need to set a Master Key

unpack1 is almost always because of the RAILS_MASTER_KEY not being set since we're using Rails credentials for everything now. 👍

I assume you figured that out. :)

okrsnow on  master [🏎💨!🤷‍] via ⬢ v12.8.1 via 💎 v2.6.5 on ☁️  us-west-2
❯ cat /dev/urandom | base64 | head -c 64
9JrdN0NJwAD7BzEsfOpPgMcSvzw124JU+lBZq3xI8yBMI822gI4LxgV/GLjFax1T%
okrsnow on  master [🏎💨!🤷‍] via ⬢ v12.8.1 via 💎 v2.6.5 on ☁️  us-west-2
❯ mate config/master.key
