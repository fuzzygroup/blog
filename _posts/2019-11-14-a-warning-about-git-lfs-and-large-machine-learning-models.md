---
layout: post
title: A Warning About Git LFS and Large Machine Learning Models and Automated Deployments
category: machine_learning
tags: ["machine_learning", "git", "git_lfs"]
---
{:.center}
![IMG_7930.jpeg](/blog/assets/IMG_7930.jpeg)

Github has a maximum size of 50 mb per file under management.  And that normally works just fine -- until the age of machine learning.  Machine learning models are **big**, staggeringly **big**.  I'm currently working on a project where the underlying model is like 830 + mb.  

Now when you have large files, git has a facility called ["Git LFS" (large file support)](https://git-lfs.github.com/) and they purport that it is the solution but, well, it really, really isn't.  Here's what I just ran across (platform is Ubuntu 18 and Ansible):

1.  I have a playbook that handles git clone / git update.  
2. When you initially install, the git clone only brings down the non lfs files.
3. I then remembered the lfs issue and modified the playbook to install lfs and run the per repository installation command (cd into your repo directory and then **git lfs install**).
4. The next stage in the playbook did a git pull and my expectation was that the pull would bring in the large model.  Unfortunately it did not so I had a real wtf moment.

I then logged into the machine manually and deleted the repo and cloned it manually.  And, voila, I got the full model coming down.  

## Before Git LFS Install

    du -hcs hate-language-modeling/
    16K	0hate-language-modeling/
    16K	total
    
## After Git LFS Install Using Manual Git Clone

    du -hcs hate-language-modeling/
    836M	hate-language-modeling/
    836M	total

## Conclusion

Given the importance of automated deploys, this really makes me concerned about using git lfs moving forward.  Yes it is wonderful that I can run the per repository installation command and have it work even after the directory is installed but the git pull, after that command was run, should have brought down the entire model.