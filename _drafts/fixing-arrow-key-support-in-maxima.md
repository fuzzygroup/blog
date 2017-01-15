---
layout: post
title: Fixing Arrow Key Support in Maxima
category: maxima
tags: ["maxima", "readline", "readlinewrapper", "osx"]
---

Note: All of this is tested only on OSX but I suspect the suggestions, slightly adapted, would work on other platforms.

I recently started using the [Maxima](http://maxima.sourceforge.net) symbolic math tool as a way to help my son with his Algebra I class.  You wouldn't think a practicing sotware engineer with a background in data science and analytics would have issues helping a teenager with math but when I actually brought his grade **down** after helping him, I knew I needed some help from technology.  

If you need help on using Maxima then you might want to check my earlier post.  A great guide to installing Maxima on OSX can be found [here](https://coeurdecode.com/2015/02/27/installing-maxima-on-mac-os-x-2/).

The first real issue that I found using Maxima was that the **arrow keys didn't work**.  Maxima is based on common lisp, specifically the SBCL variant.  Given that I'm from the VI / VIM side of the Internet, I had a feeling that somehow the issue was tied to the underlying lisp / emacs orientation of Maxima.  This is one of those odd things that is actually hard to google for.  I finally found the answer in a post on using Sublime Text with SBCL:

> One unfortunate aspect of SBCL on OS X is its poor cursor support: you may have noticed that already if you tried to press the left or right arrow keys while using SBCL's REPL. This can be fixed by installing a readline module. [More...](https://marktrapp.com/blog/2014/01/20/lisp-with-os-x-sublime-text/)

Here's what to do to make your arrow keys work correctly with Maxima on OSX:

1.  brew install rlwrap
2.  rlwrap maxima

Step #1 installs the rlwrap utility which wraps the readline library.  Step #2 launches the command line version of maxima but "wrapped by readline" so it knows how to handle You then use it to launch maxima.  

**Note 1**: This only works with the command line version of maxima.  If you are using the graphical version this won't work.  But if you are using the graphical version of Maxima, you should really be using wxMaxima and actually have a user interface instead of just Maxima running in what is essentially a shell window.

**Note 2**: There are some other instructions in the Mark Trapp blog about using linedit and and a .sbclrc file.  I was not able to make those work with Maxima to make any of this more automatic.  My best advice is that if you are using Maxima on OSX and want to avoid the wxMaxima package is to use rlwrap to launch Maxima; that's what I am doing.

