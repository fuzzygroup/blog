---
layout: post
title: Practical Things Learned at ElixirConf
category: elixir
tags: ["elixir", "elixirconf"]
---
Its been a few days since ElixirConf and I was reflecting on the practical stuff I learned.  Yes I saw the grand vision driving things but I'm always more concerned about the little stuff because everything you build is entirely dependent on the little stuff.  Attribution given by name only since I don't want to call anyone out.

* **It's real**.  People are really using this in production which means that I can too.  Just knowing that is huge.  Thanks Ben!
* Deploy is still kind of a mess.  At least one company I met is handling deploy via building it into containers and then deploying the containers.  Again thanks to Ben!
* [Timex](https://hex.pm/packages/timex) is the rough equivalent to the Rails ActiveSupport Time.now style stuff.  That's huge since I rely on that constantly.
* Despite the above comment on Timex, I was advised that datetime stuff is kind of a mess and "just get the unix epoch from the server and do with it what you will".  I don't know how to reconcile this yet but I'm sure I will.  Thanks Pete!
* As with Rails development local development using containers "just doesn't feel right".  Not terribly surprising given how many times I've tried to get a full rails stack running for local development using Docker and how many times I've failed.
* Ecto is surprisingly robust and I'm looking forward to using
* There are starting to be lots of good development tools including an [IntelliJ plugin for Elixir](https://github.com/KronicDeth/intellij-elixir).  This is the first time I've ever even considered a JetBrains product so that's surprising.  Hat tip to [KronicDeath](https://github.com/KronicDeth) who I'm pretty sure I had dinner with; its all a bit blurry now in retrospect.
* I purely can't wait to start using [FuzzyUrl](https://github.com/gamache/fuzzyurl.ex)  I've written a lot of this kind of code over the years.  Curious to see how it compares (hint - this will be better)
