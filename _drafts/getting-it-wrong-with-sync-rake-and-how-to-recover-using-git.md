---
layout: post
title: Getting It Wrong with sync.rake and how to recover using git
---
	
I'm working with a pretty complex source code model where I'm pulling in functionality from other git repos via shell scripts. This morning I got it wrong and a bunch of code disappeared. git checkout -- . cleaned up my problem perfectly. Thanks! 

http://stackoverflow.com/questions/5807137/how-to-revert-uncommitted-changes-including-files-and-folders

Here was the crucial portion of my manifest:

    "app/models/user.rb":[
      "../hyde_web",
      "../hyde_admin",
      "../hyde_worker",
      "../cartazzi_site",
      "../cartazzi_web_app"],
