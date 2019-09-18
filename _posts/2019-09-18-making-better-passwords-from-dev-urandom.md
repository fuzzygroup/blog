---
layout: post
title: Making Better Passwords from /dev/urandom
tags: ["linux", "password", "security"]
---
{:.center}
![IMG_8962.jpeg](/blog/assets/IMG_8962.jpeg)

I recently [wrote something about passwords](https://fuzzyblog.io/blog/linux/2019/09/02/generating-a-good-password-from-the-command-line.html) and a comment showed up about how what I wrote wasn't secure enough and the password should really be based on /dev/urandom instead of what amounts to microtime.  While I'm not terribly concerned here, they were right so here's an alternative:

    cat /dev/urandom | base64 | head -c 12

That will return a 12 character password.  Adjust the 12 to 8 if that's what you need for length.  

I pulled this technique from [Stack Overflow](https://serverfault.com/questions/283294/how-to-read-in-n-random-characters-from-dev-urandom).