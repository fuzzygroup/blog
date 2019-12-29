---
layout: post
title: Updating to the Lastest Version of JumpStart Pro
category: rails
tags: ["rails", "jumpstart"]
---
{:.center}
![IMG_0939.jpeg](/blog/assets/IMG_0939.jpeg)

So I've been using JumpStart Pro to  build a new side project and in a discussion with Chris Oliver, the creator of JumpStart Pro, I reported a bug which he said "Oh - you should update to the latest".  He viewed the update process as something seamless and I, honestly, didn't get it.  And, in researching this, I discovered that I made a fatal mistake.  The rest of this blog post covers that mistake and explains how you update JumpStart Pro.  Here's the tldr (too long; did not read):

* ALWAYS, ALWAYS, ALWAYS create a new app based on JumpStart Pro by cloning it from the GitLab source i.e. you start with: "git clone git@gitlab.com:gorails/jumpstart-pro.git YOUR_PROJECT_NAME"
* Go to github and create a repo for YOUR_PROJECT_NAME
* Copy the github clone info and add it as a separate remote: git remote add YOUR_PROJECT_NAME git@github.com:YOUR_GITHUB_USERNAME/YOUR_PROJECT_NAME.git
* Make a change like updating the README.md and do the add / commit dance and push to your repo as  git push YOUR_PROJECT_NAME master

Even though I've worked with Git for more than a decade now, I've previously only worked with Heroku as a git remote so I missed the implications of this when I originally cloned my first JumpStart Pro app.  Sigh.

The critical mistake I made was that I had started my second JumpStart Pro project by copying from the first JumpStart Pro project I had made and the NOT moving over the .git folder.  This meant that my new project was now disconnected from the original remote so I couldn't just do a git pull to update it.

## Fixing My Own Stupidity

Here's what I did to fix this:

1. I started by creating a new application cloning into a new location: git clone git@gitlab.com:gorails/jumpstart-pro.git okrsnow
2. I created a new git repo for my app
3. I added the new repo with: git remote add okrsnow git@github.com:fuzzygroup/okrsnow.git
4. I made a change and pushed to git push okrsnow master
5. I manually copied over all the code from my original JumpStart pro repo.  Given that Rails apps have such a clearly defined directory structure, this was tedious but not insurmountable.  
6. I had to adapt my normal development practices so that I remember to always use the remote when workign with branches.

## Oh and About that Bug

I noticed that Chris fixed it within a few hours of my reporting it.  Thanks Chris!
