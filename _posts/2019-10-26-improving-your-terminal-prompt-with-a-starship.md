---
layout: post
title: Improving Your Terminal Prompt with a Starship
category: terminal
tags: ["zsh", "terminal", "prompt", "rust", "starship"]
---
{:.center}
![sifry_london_sunrise.jpg](/blog/assets/sifry_london_sunrise.jpg)

{:.center}
Photo courtesy of my boss and friend, Dave Sifry who is in London right now attending MozFest; lucky guy!

I have a lot of computer skills.  I can program in multiple languages, I can remember how to use Norton Utilities for DOS, I can remember how to use Sun OS, I can tell you about not HTML, not XML, not SGML but GML (which begat SGML which in turn begat HTML which in turn begat XML), etc.  One of those computer skills that I don't have is *nix shell scripting -- I suck at Bash; I suck at Zshell, etc.  And *nix shell scripting is how you customize your Terminal prompt.  

Now I know this sounds like Nerd minutiae (and it is) but your Terminal prompt is this rich land of information (or it can be; normally mine isn't).  About 6 months ago, Sean Kennedy, my pairing partner in crime, got me to change over to Zshell from Bash and, in doing so, update my prompt.  

My prompt now looks like this:

{:.center}
![prompt_zsh.png](/blog/assets/prompt_zsh.png)

And that's damn good.  I mean it tells me the git repo and everything.  That's awesome.  

But, and this is a big but -- if you have to customize it with bash, we can do better.  The easy way to do better is to use [Starship](The cross-shell prompt for astronauts) aka "The cross-shell prompt for astronauts".  This is a Rust powered prompt that is designed for:

* ease of use
* cross platform compatibilty
* [customization](https://starship.rs/config/)

Here's how to get going with it on OSX:

1. Install it with HomeBrew:  **brew install starship**
2. Add the following to the END of ~/.zshrc: **eval "$(starship init zsh)"**
3. Source it with: source ~/.zshrc

One of the reasons the prompt is so damn important isn't your local box but when you're logged into remote boxes such as AWS EC2 instances.  I cannot say just how much I wish this had existed when I was maintaining a large cluster of EC2 instances that I used to log into daily.  Sigh.  

Here's how my prompt looks out of the box:

{:.center}
![prompt_starship.png](/blog/assets/prompt_starship.png)

I haven't delved too deeply into customization but the fact that I can use emojis to display my terminal state including shrug for untracked fills me a deep and unending joy:

{:.center}
![prompt_starship_configuration.png](/blog/assets/prompt_starship_configuration.png)

Now if you're not a hard core developer nerd, and even then one that spends a lot of time in a terminal, the picture above likely looks like line noise.  Here's just some of what you learn from it:

* current directory
* git branch name
* that the git branch isn't pushed yet
* git status
* ruby version
* aws region

**Note**: I tried the customization quickly and it worked flawlessly.  My git prompt now shrugs at me with indifference when I add new files to a project.  w00t!!!  I love me some snarky software...

Starship.  Wow.  Just plain wow.  This one thing has done more to convince me to look into Rust than all the damn tutorials / blog posts I've ever seen.  Fricking outstanding.

{:center}
![sbi_logo.jpg](/blog/assets/sbi_logo.jpg)

And since we're talking about Starships, if you are in the Midwest / Indiana area, I'd like to point out that **Starbase Indy is coming up soon**.  I'm actually Head of Engineering for this fan run convention and I hope to see any local readers there.  Head over to [StarbaseIndy.org](https://www.starbaseindy.org/) to buy your ticket today.  Starbase Indy happens over Thanksgiving weekend and it is the best way in Indiana to run away from difficult relatives!  


