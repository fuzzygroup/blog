---
layout: post
title: How a Software Engineer Cuts Video Down to Size
category: video
tags: ["video", "starbase_indy"]
---
{:.center}
![IMG_7373.jpeg](/blog/assets/IMG_7373.jpeg)

**Note**: Editing videos makes me feel this old ...

I can do a lot of things with a computer -- a lot.  But one skill that has been eluding me since the mid 1990s is that of editing video.  I don't know what it is about non linear editing (NLE) but I just can't master it.  I recently had to help the [StarBaseIndy folks](https://www.starbaseindy.org) with some video editing and they asked me to trip a video clip from seconds 8 to 15 and I said "Sure!" and then began sweating. 

I started with ScreenFlow figuring that of course ScreenFlow can import an MP4 file -- NOPE!.  Sigh.  I continued onto QuickTime which has a really easy to use Trim feature but while I was able to trim from the left of the video, trimming from the right seemed, well, sketchy.

I finally thought to google for "Command Line Video Cutter" and found an excellent [Stack* forum](https://askubuntu.com/questions/59383/extract-part-of-a-video-with-a-one-line-command).

Here is what ended up being the command:

    ffmpeg -ss 00:00:08 -i VID_20190717_214004.mp4 -t 00:00:07 -vcodec copy -acodec copy starbase_indy_cmd_line.mp4

Basically you tell it the starting point and then the duration.  And you'll get a great clip of someone saying something in Klingon about Starbase Indy!