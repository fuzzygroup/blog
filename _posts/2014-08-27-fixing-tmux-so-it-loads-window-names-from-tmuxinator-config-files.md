---
layout: post
title: Fixing Tmux So it Loads Window Names from tmuxinator config files
---
Dv hooked me on using Tmuxinator with iTerm 2 as a way of getting my rampant terminal usage under control and while it still makes me swear like a sailor from time to time, I found that if you add this to your ~/.tmux.conf file:

<pre>
set-window-option -g allow-rename off
</pre>

That tells Tmux to NOT allow the process that launches after the window is created to rename the window.  Thanks to [jlipps](https://github.com/tmuxinator/tmuxinator/issues/141) for asking the question.  Oddly enough, jlipps wrote the original version of [AppData](http://www.appdata.com/) which I rewrote and now own with [Jared](http://www.alloycode.com/).  Small damn world.