---
layout: post
title: Gitlab and The Danger of Short Names
category: sysadmin
tags: ["sysadmin", "devops", "gitlab", "iterm"]
---
So the other day we had the gitlab disaster.  As my friend Nick described it to me via chat: 

> did you hear about gitlab?

> an ops guy did rm -rf on a production db with 300GB of data by accident, and they lost 295GB of data -- luckily it was only on a backup, but they are expecting 6h of data loss for production data [Nick](http://nickjanetakis.com)

Or as Robin might say in a grim and gritty version: **Holy F'ing Hell Batman!**  

Apparently they were using short names like db1.foo.com and db2.foo.com.  Nick's comment on Hacker News was to the effect of their [naming structure was wrong](https://news.ycombinator.com/item?id=13539876) and that a name like dbproduction might have saved the day.  

Perhaps but I've seen a lot of this kind of stuff over the years.  Happily I've only ever had one such incident - I actually dropped a table once during a group pairing session with [Dv](http://dasari.com) and [Jared](http://www.alloycode.com/) due to getting confused between production and development.

The thing that I've wanted most of all to address this is **color**.  If you look at the structure of the brain we have an inordinate amount of our cortex devoted to visual processing -- why not approach that to preventing stupid terminal mistakes?  What I've wanted for years upon years is really simple - I want my terminal window to change color when I log into a remote server.  If its a staging server or a back up server give me a light gray background.  If its a production web or api server then give me a green background and if its a production database server then give me a BRIGHT RED BACKGROUND.

The iTerm2 badging feature can do a bit of this but its not in your face enough to really protect you.  I suspect that with sufficient console trickery this is possible but neither I or Dv ever managed to accomplish it.  Personally I think its important enough that I'd name it the GitLab feature and built it into iTerm but that's not my core skill set.  Still I'm putting it out there.  Thoughts?

Cross Links:

* [Official Incident Report](https://docs.google.com/document/d/1GCK53YDcBWQveod9kfzW-VCxIABGiryG7_z_6jHdVik/pub)
* [Hacker News Thread](https://news.ycombinator.com/item?id=13537052)

