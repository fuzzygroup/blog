---
layout: post
title: Ruby Metaprogramming - Passing Parameters with .send
---

http://stackoverflow.com/questions/13795627/ruby-send-method-passing-multiple-parameters

send("i_take_multiple_arguments", *[25.0,26.0]) #Where star is the "splat" operator

send("i_take_multiple_arguments", *[25.0,26.0]) #Where star is the "splat" operator