---
layout: post
title: Modifying Zed's Default Keystrokes
date: 2022-07-12 11:54 -0400
category: zed
tags: ["zed", "rust"]
---
I'm now deep into my week of using the [Zed editor](https://www.zed.dev/), a new code editor written in Rust.  In this blog post, I'll document how to change the default keystrokes.

## Commands

This happens from the Zed menu, the Preferences command.  There are two commands you need:

* Open Default Key Bindings
* Open Key Bindings

What you want to do is:

1. Zed menu => Preferences => Open Default Key Bindings.  This gives you a giant JSON file in a buffer which you can CMD+A, CMD+C.
2. Zed menu => Preferences => Open Key Bindings.  You can then paste this in and make changes. 

For example, I am used to these keystrokes which I use constantly:

* CMD+T -- fuzzy file finder; By default this is CMD+P in Zed
* CMD+L -- goto line
* SHIFT+CMD+F -- Global Cross File Search (already the same in Zed!)
* CMD+/ -- block comment the selected region or line

Once I knew the keystrokes I wanted, I simply needed to search the json file and then make changes as needed.   I did notice that CMD+/ was already defined as a commenting feature and it simply didn't work which is why I thought I needed to change it.
