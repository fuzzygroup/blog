---
layout: post
title: Ansible for Configuring Your Mac - SO MUCH BETTER
category: osx
tags: ["osx", "mac", "ansible", "postmac"]
---
**Wow**.  That's all I have to say.  **Wow**.  So even tho I'm fully in the postmac world at this point with an Ubuntu-Mate box running 24/7 right alongside my Mac, I did just purchase a new mac -- a top of the line previous generation PowerBook 13.  This at least got me a memory upgrade from the paltry 8 gigs on my Macbook Air to 16 gigs.  Yes it wasn't the 32 gigs or 64 gigs that I wanted but I can suck it up -- even though I still steadfastly maintain that Apple should have shipped Macbook Pros with more memory in a laptop form factor **than they've been shipping since 2010**.  And no I'm not going to let that one go.  

Anyway I'm now faced with configuring a brand new Mac.  I very specifically don't want to use Time Machine in the event that any of my many recent issues are tied to cruft that has built up since my last machine.  So that's out -- damn it.  Which places me in the spot of an absolutely virgin install.  I haven't done this in years.  And since I'm a developer that means I need a lot of stuff: 

* xcode tools
* all the normal unix crap 
* server tools - mariadb, redis and the like
* frameworks like node
* rails / ruby / r* (note this is using rbenv / ruby build to see if I can get out of my current rvm hell; since I'm dumping rvm server side anyone this seemed like a good choice)
* tmux, ah blessed tmux, the love-hate-hate relationship I have with you

And to make matters worse I'm going on the road just after Thanksgiving so I really want this to be right.  I'd love to **just** carry one laptop with me.  This means that it needs to be fully working -- apps, data, etc.

Happily data is already handled.  A few months ago [Dv](http://dasari.me) convinced me that Dropbox could handle everything I use on a daily basis so all my data syncs automatically as I work.  I can see the little Dropbox notices flashing by on all my boxes.  I honestly worry a hell of a lot less about Time Machine than I ever used to because the data I actually care about is a working set of 35 gigs of data which is ALWAYS in place on 1 of at least 4 development boxes.

Apps are a very different matter.  

# Ansible Stuff I Learned From This Project

Here are some of the things I learned:

* 0.0.0.0 in hosts means "run this on the local box"
* there's a [homebrew module](http://docs.ansible.com/ansible/homebrew_module.html)
* there's a [homebrew_cask module](http://docs.ansible.com/ansible/homebrew_cask_module.html)
* there's [file globbing](http://docs.ansible.com/ansible/playbooks_loops.html#id4)

In case you haven't recently been following the arcana of Mac package managers, brew installs command line things like, say, redis.  brew cask does the same thing for true mac apps.

# References / Examples to Setting Up Your Mac with Ansible

Some of the sources I found are below.  There's some great stuff here.

* [https://github.com/geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
* [https://github.com/ricbra/mac-dev-playbook](https://github.com/ricbra/mac-dev-playbook) (I pulled my bootstrap dependencies from here; Thanks!)
* [https://medium.com/@kojiitp/automation-of-installation-on-mac-w-ansible-21354cce0d7b#.duu26pqay](https://medium.com/@kojiitp/automation-of-installation-on-mac-w-ansible-21354cce0d7b#.duu26pqay) (great overview)
* [https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/](https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/) (also great overview)
* [http://www.nickhammond.com/automating-development-environment-ansible/](http://www.nickhammond.com/automating-development-environment-ansible/) (solid)
* [https://github.com/fgimian/macbuild](https://github.com/fgimian/macbuild)
* [https://github.com/mpereira/macbook-playbook](https://github.com/mpereira/macbook-playbook)
* [https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/](https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/)


I ended up taking a slightly different approach.  I didn't try to be as complete (I mean wow - setting your dock icons) but instead focused on the tools I use and I wanted to get my box to a usable state by morning (i.e. its 2 am when I started; I wanted to be running my code by say 8 am).  This constraint meant that I wasn't going to get as specific as say mpereira in moving ssh keys over for example.  Nothing wrong with that approach but I want to think it over a bit more before I go there.

Note: Well I wrote the above playbook then I delved deeper into mpereira's stuff and I thought "well this isn't too bad" and damn it if I wasn't moving over knownhosts pretty quick.  *chuckle* -- thanks man!

Note: I don't know if the SSH key stuff is right or wrong.  I still can't push to github but I'm also having issues with even creating new ssh keys so maybe those issues are part of that.  Apologies.

In specific I find that Ansible stuff gets deep and confusing quickly.  I wanted to focus on the organization by clearly naming exactly what's going on.  All my install roles, for example, start with "install_".  I did everything with a focus on clarity right down to avoiding pkg lists; that just felt **right** (verbose but right).

Here's mine:

* [https://github.com/fuzzygroup/ansible-macbook-pro](https://github.com/fuzzygroup/ansible-macbook-pro)

If you're at all technical I'd highly recommend this as an approach for setting up a new Mac.  I did some reading and then starting in about 4 hours I managed to get almost everything I needed setup.  Yes the per app config happened post install but I don't think that I could have possibly installed just all the stuff I need manually in that amount of time.  Scratch that -- I COULD NOT POSSIBLY HAVE DONE THIS AS QUICKLY.  **Beyond Recommended**.
