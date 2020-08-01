---
layout: post
title: When You Can't Ping, You Dig
category: aws
tags: ["aws"]
---
{:.center}
![IMG_3737.jpeg](/blog/assets/IMG_3737.jpeg)

Normally when I'm trying to validate that an Internet service is available, well, I **ping**.  Ping is one of those Internet bedrock protocols that I'm firmly in the camp of "SHOULD ALWAYS, ALWAYS, ALWAYS BE TURNED ON".  But there are ping flooding attacks, etc so there are reasons why it isn't always a default (looking at you here AWS; staring you dead in the eyes with the 'ol stink eye).  I recently realized that while it isn't example the same, if you're trying to validate something's address (as opposed to knowing if it is actually up), you can actually use **dig**.  So instead of:

    ping foo.bar.com

try:

    dig foo.bar.com