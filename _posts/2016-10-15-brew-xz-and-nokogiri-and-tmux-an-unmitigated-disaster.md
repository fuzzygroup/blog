---
layout: post
title: Brew XZ and Nokogiri and Tmux - An Unmitigated Disaster
category: ruby
tags: ["ruby", "nokogiri", "rvm", "brew", "tmux"]
---
It has been one really, really bad day this past 24 hours.  While my AWS stability problems have gone away entirely, I had to get a new Rails code base up and running locally today, one done by another developer here.  This required Gem install and since it was Rails, that meant a Nokogiri install.  And I love what Nokogiri does but I *hate*, *loathe*, *despise* the installation process.  In every single repo I work on there is a top level docs directory and then a file called gems.txt which lists what I internally refer to as *the incantations*.  These are those crap ass command lines that are so long you just can't remember them.  Here's the list of the tricks that I use to install Nokogiri when it inevitably fails:

    gem install nokogumbo -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries
    gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries
    gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries --with-pkg-config=/usr/local/bin/pkg-config
    gem install nokogiri -- --with-xml2-include=/usr/local/opt/libxml2/lib --use-system-libraries --with-pkg-config=/usr/local/bin/pkg-config
    
And not one of those worked.  The one that usually works without fail is:

    gem install nokogiri -- --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/libxml2 --use-system-libraries
    
but not today.  I knew this was going to be a bad day.  I told the other guy here "your code, doesn't install; give me solution".  He found this [nugget of disturbing truth](https://github.com/sparklemotion/nokogiri/issues/1483).  Apparently there is an incompatibility between Nokogiri and xz.  His suggestion was uninstall xz and I did that.  And Nokogiri was then fine -- but I had to also reinstall ruby.   And that did work -- until about an hour ago when I had a late night desire to write about Docker (hey - it is my Friday night; I can spend it however I please) -- and I started getting this little gem of an error:

    jekyll post "Learning From a Docker Captain - Nick Janetakis - Making AWS Monitor Run Under Docker"
    Your bundle is locked to i18n (0.7.0), but that version could not be found in any of the sources listed in your Gemfile. If you haven't changed sources, that means the author of i18n (0.7.0) has removed it. You'll need to update your bundle to a different version of i18n (0.7.0) that hasn't been removed in order to install.
    Run `bundle install` to install missing gems.
    
And this led to the inevitable cavalcade of swearing, muttering and normal gyrations when something absolutely essential to you is broken and you have no idea why.  Brew wouldn't work, Gem wouldn't work, Bundler wouldn't work, etc.  Here was the problem:

1.  I run jekyll under a Tmuxinator/Tmux shell which runs the server in one window, runs the command line in another and a 3rd tab to remind me to migrate my old Radio Userland blog into Jekyll.  
2.  Remember that ruby re-install?  Well Tmuxinator knows what the Ruby is and that ruby had gone away.
3.  So everything was trying to reference an executable that was no longer there and apparently the normal error for that is something about i18n.  Sheesh.  

And I do get it, this was an exceptional set of circumstances but it still did cost me about half a man day on a day when I can ill afford it.  And it made me surly, nasty and unresponsive to my family and while that's on me, that's definitely not cool.

# What to Do?

This is a hard one.  I rely on brew as does, well, every developer I know on OSX.  And since xz is a required part of brew (as well as the miraculous ag), getting rid of it is likely bad.  What I should have done is:

* brew unlink xz BEFORE my nokogiri install
* nokogiri install (with one of my incantations) 
* brew link xz

But, honestly, it is 2016 after all, doesn't that feel, well, *dated*?  I don't know about anybody else out there but it feels like this is my Murtagh Moment, the *I'm too old for this shite* point of a technology transition.  [Nick](http://nickjanetakis.com) has been pushing me for a while to make the Docker transition for development and I think it is time.  [Dv](http://dasari.me) and I tried this back in 2014 and failed miserably at it but Docker is loads better now.  And since I can't run my monitoring code on the machine that is permanently hooked up to the internet (again a Nokogiri failure), well, I guess I'll make that work first and then figure this all out.  Sigh.  What a craptastic day here in the "what's broken today world".  

And I am sure that this will get fixed at some point but the question:

* when will it be fixed
* will I then even update to that version 

If I move to Docker for my development then I skip the whole bundle install crap fest and everything will run under Linux.  I'm finding it harder and hard to object to that.

# A Great Docker Resource

Obligatory disclaimer -- Nick Janetakis is now a friend of mine.  But he is a bona fide Docker expert, a Docker Captain.  He also has a good course on [Docker for Devops](http://bit.ly/2ecakFU) hosted on Udemy.  he has a few others too but this one I've taken parts of and I know is excellent.  Recommended.

