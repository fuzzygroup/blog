---
layout: post
title: When Your Brand New Windows PC Goes into a The Computer Restarted Unexpectedly Loop
category: windows
tags: ["windows"]
---
{:.center}
![IMG_1083.jpeg](/blog/assets/IMG_1083.jpeg)

Note: This blog post is for Max, my youngest son, so he can learn what I did to fix this problem.

So my youngest son got a new Windows gaming PC for this Christmas from his Grandmother (thank you Nanny) and when he started it up, all he saw was this:

{:.center}
![IMG_1097.jpeg](/blog/assets/IMG_1097.jpeg)

The normal diagnostic steps of:

* Pull the graphics card and use motherboard graphics
* Check that the RAM is seated
* Double check all cables are connected
* Change the boot order options and make sure that the right boot device (SSD) is used

We ordered this from Best Buy and my suspicion is that someone had previously bought this computer and partially run thru Windows setup and failed.  Since the device is brand new, all we need to do is trick Windows into running through the setup process from scratch.

Here's how I solved this:

1. Press shift+F10 to get a command prompt.  Clap loudly for seeing a DOS prompt for the first time in ages.
2. Type regedit and press enter.
3. Navigate to this key: **HKLM/SYSTEM/SETUP/STATUS/ChildCompletion**
4. Click on setup.exe and change the value from 1 to 3.
5. Press ALT+F and select Exit from the File menu to exit RegEdit.
6. Exit out of the command prompt by typing exit and pressing ENTER.
7. Reboot the computer by clicking ok at the "The Computer Restarted Unexpectedly..." dialog box.
8. Run through the Windows setup process from scratch and all should be good.

## Reference:

* [TheWindowsClub](https://www.thewindowsclub.com/computer-restarted-unexpectedly-encountered-unexpected-error)
