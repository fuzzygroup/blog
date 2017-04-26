---
layout: post
title: Using the Bing Cognitive Search API - Decrypting the Search Result Url
---
There are times when you use someone's API that just make you go *What the Hell???* -- what were they thinking???  I hit this recently using the CognitiveBing gem in Ruby.  This is a gem which lets you execute queries against the Bing search engine. What I found was that an interface to the search engine **fails** to give you the **actual url** to the search results that it finds.  What Bing instead does is send down a tracking url on Bing itself that is a redirector to the search result in question.  This is so ludicrous that it astonishes me.  Sure, I get it, this gives Bing more tracking information but the CognitiveSearch api is a **paid** api.  If I'm paying good money for an api then I wouldn't expect that the destinations of everything I care about in the search result get fed bank to Bing.  And, just to clarify, this isn't a part of the gem, it is in the raw search result sent back from Bing.


http://stackoverflow.com/questions/2733007/urldecode-in-ruby

You can't use display url

My Fork: https://github.com/fuzzygroup/cognitivebing/

Pagination rference: https://github.com/kaminari/kaminari

https://github.com/aggounix/cognitivebing

https://msdn.microsoft.com/en-us/library/dn760794.aspx#responsefilter

https://msdn.microsoft.com/en-us/library/dn760787.aspx

https://msdn.microsoft.com/en-US/library/dn760794.aspx

https://docs.microsoft.com/en-us/azure/cognitive-services/Speech/GetStarted/GetStarted-cURL

https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account