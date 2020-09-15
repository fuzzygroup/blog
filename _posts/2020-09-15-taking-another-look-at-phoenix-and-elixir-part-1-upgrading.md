---
layout: post
title: Taking Another Look at Phoenix and Elixir - Part 1 - Upgrading
date: 2020-09-15 10:23 -0400
category: elixir
tags: ["elixir", "phoenix"]
---
{:.center}
![IMG_3241.jpeg](/blog/assets/IMG_3241.jpeg)

I've been on the fence about Phoenix and Elixir for a while and I thought I'd take at least a quick dive.  I've had a development system for Phoenix and Elixir since at least 2016 but I haven't done much.  This means that the first task is bringing it into the 2020s.

## Upgrading Elixir

I installed Elixir via HomeBrew which means it is a simple:

    which elixir
    /usr/local/bin/elixir

**Note**: It can be hard sometimes to know if you installed things via HomeBrew and checking their location is an easy cheap as HomeBrew installs stuff to /usr/local/bin

And then:

    brew upgrade elixir

And then:

    elixir --version
    Erlang/OTP 23 [erts-11.0.3] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [hipe] [dtrace]

    Elixir 1.10.4 (compiled with Erlang/OTP 23)

You can also use just -v:

    elixir -v
    Erlang/OTP 23 [erts-11.0.3] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [hipe] [dtrace]

    Elixir 1.10.4 (compiled with Erlang/OTP 23)

## Upgrading Mix and Hex

Mix and Hex give the equivalent of a build tool (like Rake from the Rails world) and a Package Manager (like Gem / Bundler).

To upgrade mix, you use:

    mix local.hex
    Found existing entry: /Users/sjohnson/.mix/archives/hex-0.20.5
    Are you sure you want to replace it with "https://repo.hex.pm/installs/1.10.0/hex-0.20.5.ez"? [Yn] Y
    * creating /Users/sjohnson/.mix/archives/hex-0.20.5

And that will upgrade both mix and hex.

## Upgrading Phoenix

The phoenix framework version I have dates back to 1.2 or 1.3 I think.  The first step is to figure out what version I have:

    mix phoenix.new --version
    Phoenix v1.3.3

The method to upgrade the Phoenix framework itself is:

    mix archive.install hex phx_new 1.5.4
    
I used a google query to discover that the current Phoenix framework version was 1.5.4.  The other way to find this version number is to go to this url:

    https://hexdocs.pm/phoenix/installation.html
    
And then look at the drop down of different versions in the left hand sidebar.  The latest version is always at the top.

## Creating a Sample App

My first step was to create a location to work on Phoenix apps.  I'm going to be experimenting with a version of my JobHound app written in Phoenix so I created this directory:

    mkdir -p /Users/sjohnson/Sync/coding/jobhound/phoenix

I can then move my existing Rails source code into:

    /Users/sjohnson/Sync/coding/jobhound/phoenix/rails
    
and be able to open both code bases in the same editor window which should facilitate copy and paste based code rewriting.

With all the tooling updated, creating a new Phoenix app is as a simple matter of:

    cd /Users/sjohnson/Sync/coding/jobhound/phoenix
    mix phx.new jobhound

You should see a bunch of output looking like this:

    * creating jobhound/config/config.exs
    * creating jobhound/config/dev.exs
    * creating jobhound/config/prod.exs
    * creating jobhound/config/prod.secret.exs
    * creating jobhound/config/test.exs
    * creating jobhound/lib/jobhound/application.ex
    * creating jobhound/lib/jobhound.ex
    * creating jobhound/lib/jobhound_web/channels/user_socket.ex
    * creating jobhound/lib/jobhound_web/views/error_helpers.ex
    * creating jobhound/lib/jobhound_web/views/error_view.ex
    * creating jobhound/lib/jobhound_web/endpoint.ex
    * creating jobhound/lib/jobhound_web/router.ex
    * creating jobhound/lib/jobhound_web/telemetry.ex

This created the canonical structure for a Phoenix app:

     
## See Also

* [Installation](https://hexdocs.pm/phoenix/installation.html)
* [Getting Up and Running](https://hexdocs.pm/phoenix/up_and_running.html)
