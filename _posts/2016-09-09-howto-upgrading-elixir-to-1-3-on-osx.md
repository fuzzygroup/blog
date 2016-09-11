---
layout: post
title: Howto - Upgrading Elixir to 1.3 on OSX
category: elixir
tags: ["elixir"]
---
So I realized that even though I'm just getting started, I'm already behind.  *chuckle*.  Here you go:

    elixir --version
    Erlang/OTP 18 [erts-7.3] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

    Elixir 1.2.4
  
So it is the normal brew process (you type what's in bold):

    **brew update**
  
    **brew upgrade elixir**
  
    elixir --version
  
    elixir --version
    Erlang/OTP 19 [erts-8.0.2] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

    Elixir 1.3.2  
