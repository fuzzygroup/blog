---
layout: post
title: Setting Up a Github Pages Jekyll Blog
category: jekyll
tags: ["jekyll", "blogging"]
---
I don't recommend that anyone blog the way I do.  Git and Jekyll are both fairly user hostile but I found myself having to do this the other day so i thought I'd document it at least for myself.

Note the First: This assumes that you have a working local ruby installation and the Jekyll gem installed.  

Note the Second: These instructions are rough -- there's a fair bit of jiggery / pokery going on here and I may have missed a step.  Dust off your Google Fu, sacrifice a goat and pray.  That's usually how I setup a new blog.

Things in **bold** or otherwise emphasized are what you type.

1.  Do a **jekyll new blogname** and create a new blog.  blogname is how this is going to appear online so get that name right.
2. Change into that directory.  I don't know what it is so the only help I can give you is **cd**.
3.  In that directory, do a **git init**.
4. On github create a new repository named blogname (in step 1).
5. On your local machine, in that directory, do a:

    git remote add origin git@github.com:fuzzygroup/blogname.git

6. Do a **bundle install** to setup all the code for your Jekyll blog.
7. Edit _config.yml and setup your metadata.
8.  Do a **git add .**
9.  Do a **git commit -m "initial commit"**
10.  Do a **git branch gh-pages**.
11. Do a **git co gh-pages**.
12. Do a **git push origin gh-pages**

Try and view it on github. I know that's not very specific and I apologize; a bit rushed this morning.

# References

* [https://help.github.com/pages/](https://help.github.com/pages/)
* [https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll)

