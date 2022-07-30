---
layout: post
title: Registering a Domain with Name Silo
date: 2022-07-07 09:12 -0400
category: dns
tags: ["dns"]
---
{% pizzaforukraine  %}

So I needed to register a .IO domain today.  Amazon had .io domains at **$71** per and Google had them at **$60**.  A quick check with my [guru of cheapness](https://nickjanetakis.com/blog/why-i-have-started-to-move-my-domains-from-internetbs-to-namesilo), Nick Janetakis, said:

> [NameSilo.com](https://www.namesilo.com/)

And he convinced me.  Here are some tips:

1. Do not accept any of their options.
2. Just the domain, Sir, just the domain.  
3. Use DDOS protection from CloudFlare instead of their option.  CloudFlare is free.
4. Once you are registered then the option you likely need is to create an A record.  This is done by selecting the domain from the Domain Manager view and then clicking the blue icon.
5. Amazon is way prettier but double the price is a hard sell.
6. After you create it, wait some period of time and ping it.  Verify the ip address is yours.

## References:

* [Review of NameSilo](https://nickjanetakis.com/blog/why-i-have-started-to-move-my-domains-from-internetbs-to-namesilo)
* [Mass Migration to NameSilo](https://nickjanetakis.com/blog/how-to-transfer-a-domain-name-with-zero-downtime)