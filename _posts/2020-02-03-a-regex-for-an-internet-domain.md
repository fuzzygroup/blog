---
layout: post
title: A Regular Expression for Validating An Internet Domain
categories: regex
tags: ["regex"]
---
{% pizzaforukraine  %}

Despite the power and truth of Jamie Zawinski's law:

> Regular Expressions: Now You Have Two Problems [Jeff Atwood's Perspective](https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/)

Like Jeff, I too really, really **love** regular expressions or regexes.  I use this one a lot and I finally learned to use \S (Any non-whitespace character) so here's a regex

    ^\S+\.\S+$

that I wrote yesterday to "validate" the permitted characters in an Internet domain.  I was all proud of this and wrote this blog post only to realize that pride really does goeth before a fall -- this will NOT correctly validate an Internet domain.  As I write this post, I realize that the number of allowed characters in an Internet domain are actually NOT any non-whitespace characters and here's the proof that I actually got that wrong yesterday when I put something online using it:

{:.center}
![rubular_and_underscores.png](/blog/assets/rubular_and_underscores.png)

**Note**: The fact that Rubular allows through an _ which is NOT a valid character in domains is problematic.  

So the right way to do this, DAMN IT, is something like this:

    ^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$
    
And this actually works:

{:.center}
![rubular_no_s.png](/blog/assets/rubular_no_s.png)

The [A-Za-z0-9\-]+ is a "character class" which says "Any uppercase or lowercase letter plus 0-9 plus a -" are allowed (any order, any quantity)".

Regular Expressions -- Now you have two problems.
