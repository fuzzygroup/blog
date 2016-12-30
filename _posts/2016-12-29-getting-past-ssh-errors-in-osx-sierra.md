---
layout: post
title: Getting Past SSH Errors in OSX Sierra
category: osx
tags: ["osx", "ssh", "sierra", "sshagent"]
---
If you are having problems with OSX Sierra and authenticating with github, the issue is that OSX Sierra doesn't automatically add ssh keys by default.  



# References:

* [Reddit](https://www.reddit.com/r/osx/comments/52zn5r/difficulties_with_sshagent_in_macos_sierra/)
* [SSH Keys in MacOS Sierra](https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain)
* [Adding SSH Identities via Terminal](http://askubuntu.com/questions/363404/ssh-add-command-does-not-add-my-identity-to-ssh-agent)
* [Github SSH Add](https://help.github.com/articles/error-permission-denied-publickey/)

One solution is to add the below lines to your .ssh/config file:

    Host *
      IdentityFile ~/.ssh/id_rsa
      AddKeysToAgent yes