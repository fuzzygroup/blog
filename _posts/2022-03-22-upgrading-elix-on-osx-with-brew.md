---
layout: post
title: Upgrading Elix on OSX with Brew
date: 2022-03-22 13:42 -0400
category: elixir
tags: ["elixir"]
---
This is simple but I keep needing to look it up.  

First check your elixir version:

    elixir -v

Second confirm that you actually installed Elixir using brew:

    brew list | grep elixir
		
Third do the upgrade:

    brew upgrade elixir
		
**Note**: You are probably going to find more than just elixir itself is upgraded.  Theoretically you should be able to look at just the upgrade tree with:

    brew deps --tree --include-build elixir

and only those things will be upgraded but when I noted a much larger group of packages being upgraded which makes me suspect some kind of circular dependency that needed to be handled.

Fourth check the version again:

    elixir -v