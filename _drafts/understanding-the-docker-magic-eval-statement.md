---
layout: post
title: Understanding the Docker Magic Eval Statement
---
eval "$(docker-machine env)"
that should be enough for your eval command btw
that auto-grabs the "default" machine
which you can verify with: docker-machine ls
you would use eval "$(docker-machine env foobar)" , if you had another machine with the name foobar
ah.
Nick Janetakis (nick.janetakis@gmail.com)
and it's not magic at all hehe
it just sets up a bunch of ENV variables to configure your docker client to connect to the docker daemon
Just so you know once you get on a black list you often cannot get off since there's no one in charge of them.  They're often amateur efforts that get rolled up into other things
Nick Janetakis (nick.janetakis@gmail.com)
if someone watched the docker toolbox lecture you would know this!
you can actually run:  docker-machine env , as is
and it prints out a bunch of stuff -- that's what the eval command does for you
it takes that output and executes as "real" bash code