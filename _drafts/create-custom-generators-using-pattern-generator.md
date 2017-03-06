---
layout: post
title: Create Custom Generators Using Pattern Generator
---
I am strongly of the opinion that Rails generators are one of the unsung heros of the Rails world.  Certainly the fact that a Rails generator always creates the matching test stub has to have influenced the success of testing in the Rails world.  And while Rails generators are great, there aren't a lot of easy options when you want a customized generator.  In the remainder of this post, I'll discuss the gem Pattern Generator which lets you put together

# Caveats

If you're working with a fork of Pattern Generator you should be aware that your fork is inherently going to be publicly available on Github.  Keep that in mind if you view the model that you've generated is proprietary.  In that case you may need to break the fork and make it non-public.  
