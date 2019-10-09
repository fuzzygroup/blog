---
layout: post
title: Never Underestimate Your Own Stupidity - A Jekyll CSS Issue
category: css
tags: ["css", "jekyll"]
---
{:.center}
![IMG_9444.jpeg](/blog/assets/IMG_9444.jpeg)

For a long, long time, I've wanted the ability to center things, specifically images, in my blog posts.  I use a tool called Jekyll for blogging and the directions in the Github [Jekyll thread on this](https://github.com/jekyll/jekyll/issues/3219) are pretty clear:

    {: .center}
    ![image](https://education.github.com/assets/sdp-backpack-6f872c4211af1bac3aef0c6e2b5fbb7a.png "Github Developer Pack")
    
And then put this in your CSS file:

    /* To center images */
    .center {
        text-align: center;
    }
    
And, as with many CSS things, I failed (miserably) at it the first few (dozen) times I tried to make this work.  Then, as generally happens, I got busy and simply forgot (well ignored in an embarrassed fashion) about it.  

Given that I've been busily taking pictures as of late, mostly, to put at the top of blog posts, I thought I'd take another pass at it.

I started in my coding editor by trying to add the .center directive to my css file.  And I did so but it failed.  I then thought "Hm... what if something else is overriding it" and I looked at all my css files and I found this:

{:.center}
![css_stupid.png](/blog/assets/css_stupid.png)

What that says is take anything with a center attribute and "center it" and then the next directive says take anything with a center attribute and "left align" it.  Oof!.  

Yep.  I'm a bozo.  