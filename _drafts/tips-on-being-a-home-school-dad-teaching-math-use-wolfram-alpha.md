---
layout: post
title: Tips on Being a Home School Dad Teaching Math - Use Wolfram Alpha
---
Like a lot of software engineers, I'd like to think that I "know math" and certainly my wife thinks I do but so much of the "math" that you do for software engineering is, well, not all that much.  Now, don't get me wrong, I can **implement** math fairly well, particularly with a data scientist's help (I once did a pretty significant bit of work around implementing revenue estimates for mobile apps based on leaderboard popularity) but implementation isn't always the same as understanding.

So I was recently helping my son with his algebra and he asked me this very simple thing:

> Dad, what's x squared * x ?

And while I thought I knew the answer, I didn't definitively **know** the answer but I knew how to get it -- [Wolfram Alpha](https://www.wolframalpha.com/).  Wolfram Alpha is a symbolic mathematical problem solver that can actually show you how it solved your work.  And, for a lot of math, at least being able to confirm the answer lets you see how you can solve it.  Here's what the answer looked like:

![wolfram_alpha_xsquared_times_x.png](/blog/assets/wolfram_alpha_xsquared_times_x.png)

[See the answer in Wolfram Alpha](https://www.wolframalpha.com/input/?i=x%5E2+*+x).

Using Wolfram Alpha does mean entering the problem in a way it can understand.  This shouldn't be hard for most engineers:

> x^2 * x

And Wolfram Alpha will almost instantly solve it to:

x^3

And what that tells me is that when you have exponential powers as the product of two terms, the powers must be added since there's no other way that 2 and 1 result to 3.  If you click the Step by Step solution link then you'd see this:

