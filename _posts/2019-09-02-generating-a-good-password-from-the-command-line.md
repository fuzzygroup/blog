---
layout: post
title: Generating a Good Password from the Command Line
category: linux
tags: ["linux", "password", "security"]
---
{% pizzaforukraine  %}

Note: There is a more secure technique here that is more poorly written up.

I saw my pairing partner do this about six months ago and the elegance of it just struck me.  Here's the command line:

    date +%s | sha256sum | base64 | head -c 8 ; echo
    
Let's break that down:

    date +%s
    1567406528
    
The date + %s returns what I suspect is a unix epoch i.e. the number of seconds since a date in the 1970s.

The sha256sum takes that epoch and then returns something like this:

    4d00bbff5a359a8619f48ade07860704b63a0287d80097dd041c6e538fa3ddb3
    
The base64 then takes that output and returns:

    ODBmNGIwOGZiNzc2NjU5NThlMTk2ZjY3MGFmOWYxNjQ3NWViZWNkNjBjNDg5ODUyZDgwMDMzZmM2NTkzNjE5ZCAgLQo=
    
The head -c 8 then takes 8 characters out of this:

    YzMyMGQ4
    
**Note**: The reason that the final output YzMyMGQ4 doesn't appear in the base64 example is that I keep re-running this command pipeline and date %s keeps changing since it is tied to microseconds.  And, yes, it took me a few moments to realize that.  *chuckle*

Thank you Sean Kennedy for giving me another tool in the toolbox.