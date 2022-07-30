---
layout: post
title: Nerd Humor - When You Blog in Bright Sunlight in a Convertible
category: humor
tags: ["humor", "blogging"]
---
{% pizzaforukraine  %}

Disclaimer: There is likely only one person on the planet who will find this funny.  Hi!

So I found myself last night in a convertible with my wife driving and I thought to myself, "I know; I'll write something".  And I began writing a screed on the use of the underlying Rails Migration commands that manipulate the state of your database.  Rails has a number of these commands that, after MORE THAN A DECADE of daily rails programming, I've never bothered to use.  I have known for a long time I need to master these and I finally have.  

I finish up that post this morning and go to find it and publish it and a git status shows me **nothing**.  Gulp.  This just doesn't happen to me.  Scramble around looking for it -- no love.  Confirm that it actually exists in my editor and I didn't just have a surreal "out of keyboard" experience -- yep.  It is there.  And then it hits me -- I have multiple blogs, one for nerd writing and one for recipes.  Yep:

    ➜  recipes git:(gh-pages) ✗ git commit -m "updates to pickle"
    [gh-pages 0e34bce] updates to pickle
     1 file changed, 3 insertions(+), 1 deletion(-)
    ➜  recipes git:(gh-pages) git push origin gh-pages
    Counting objects: 4, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (4/4), 568 bytes | 0 bytes/s, done.
    Total 4 (delta 3), reused 0 (delta 0)
    remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
    remote: 
    remote: GitHub found 7 vulnerabilities on fuzzygroup/recipes's default branch (1 critical, 1 high, 4 moderate, 1 low). To find out more, visit:
    remote:      https://github.com/fuzzygroup/recipes/network/alerts
    remote: 
    To github.com:fuzzygroup/recipes
       9fc96ec..0e34bce  gh-pages -> gh-pages
    ➜  recipes git:(gh-pages) jekyll post "Rails Migration Tips and Tricks"
    New post created at _posts/2019-07-30-rails-migration-tips-and-tricks.md.
    ➜  recipes git:(gh-pages) ✗ mate _posts/2019-07-30-rails-migration-tips-and-tricks.md 
    ➜  recipes git:(gh-pages) ✗   

Moral of the story?  Don't tech blog where you food blog.  Sigh.
