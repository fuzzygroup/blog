---
layout: post
title: Random Thoughts on Elixir
category: elixir
tags: ["elixir", "elixirconf"]
---

Things overheard in conversations:

* datetime support is still a mess; the erlang libs are just as bad; Just rely on a unix timestamp on the box and manipulate it yourself (Pete)
* deal with deployment at the container level; don't do native deployment (Ben)
* whenever possible pick a stable Erlang library over an immature hex project (Ian)  [Pete's libraries](https://github.com/gamache?tab=repositories) are an exception; he's using them in production.
* tests run so fast (and concurrently) that you've lost your "Go get a coffee" excuse while the test runs break.  Damn.  (Ian)

Things I came up with:

* One thing that concerns me is the ability to parachute into an Elixir project and work on it.  Say what you want about Rails but its standard nature has made it very easy for a consultant to drop in on a project and fix it.  I'm less sure about that with Elixir.
* When you don't fully understand the syntax yet (and you won't if you're like most of us) then you can ctrl+c ctrl+c in and out of console to test that your code is right (**iex -S mix)**.  Since Elixir is compiled, just bringing up the repl means it works
* Elixir is all over the place.  I've met more people from, well, **insert generic middle of the country location** than I have from San Francisco.  That's damn odd for a cutting edge technology.  I don't know what it says about San Francisco.
* Because the elixir language is implemented as macros instead of as language constructs, there are some syntactical oddities that mess you up.  Here's an example:

    <%= if @current_user do %>
      # do something
    <% else %>
      # do something ese
    <% end %>
    
* Coming from a rails perspective you'd expect that to be <% if %>    not <%= %>
* Immutable, Immutable, Immutable (just to remind myself)
* Pattern matching over conditionals.  Ok this one was from Sonny as part of the Phoenix class.  Yesterday in that class we build a login system with only 1 if / else block.  Astonishing.
* The lack of a prebuilt login system is astonishing.  Yes we built one ourselves and did it pretty easily but that's not the same as "we should have done it".  There are so many edge cases in authentication that I tend to shy away from it.  Wolfram Arnold taught me this on my very first Rails gig and it remains as good advice now as it was then.  
* The generators in Phoenix are astonishingly good.  Wow. 

I'll update this as the conference runs.

