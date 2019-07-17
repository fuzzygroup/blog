---
layout: post
title: Fixing ByeBug Madness
category: ruby
tags: ["ruby", "rails"]
---
I learned an interesting and subtle trick today.  As is all too true lately, my pairing partner, [Sean Kennedy](https://csphere.github.io/), gets the credit for this one.  I had the ruby debugger, byebug, embedded in a view context and I noticed that while this should have brought up a breakpoint, it way, way, way, way overstepped the break point and shot beyond, going into core Rails stuff.  And then Sean told me this trick:

    <%# a = 1; byebug; b = 2; %>
    <%= link_to "Sign in with OAuth 2 provider", user_doorkeeper_omniauth_authorize_path, class: "btn btn-primary" %>
    
Apparently byebug has a known issue with execution context and wrapping the byebug call inside two assignment statements gives it enough of an execution context for it to stop properly.  

And yes this is a sucky thing but all tools have issues and this one can be trivially worked around. 