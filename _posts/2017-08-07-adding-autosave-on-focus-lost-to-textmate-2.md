---
layout: post
title: Adding AutoSave on Focus Lost to TextMate 2
category: textmate
tags: ["textmate"]
---
I've looked this up and set this on every single mac I've used since I switched to [TextMate 2](https://macromates.com/) so I guess it is time to finally write it down for myself:

1.  Open a command prompt.
2.  Edit the file ~/Library/Application Support/TextMate/Global.tmProperties
3.  Add the line saveOnBlur = true in the top region before the square bracket sections.
4.  Save and Exit
5.  Relaunch and it should be there.

