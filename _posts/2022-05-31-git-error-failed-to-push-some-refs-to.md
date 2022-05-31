---
layout: post
title: 'Git Error: failed to push some refs to'
date: 2022-05-31 00:34 -0400
category: git
tags: ["git"]
---
So I was just stumbling through setting up a new project and getting it deployed when I hit this little gem:

		❯ git push -u origin main
		error: src refspec main does not match any
		error: failed to push some refs to 'github.com:fuzzygroup/cartazzi.git'

I did the obligatory "scratch my chin and play with my beard" that you do when you are confused (and it is late and you are **tired**).  And then I realized -- "Oh crap, it is NEW; I bet I never added yet."  And lo and behold -- a simple add / commit and push worked!  Crappy ass error message though.  Sigh.

**Note**: Deployment first development is my new best practice -- make things deploy initially when they are still simple.  This is particularly easy when you use a deployment engine like [HatchBox](https://www.hatchbox.io)