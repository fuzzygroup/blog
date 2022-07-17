---
layout: post
title: Getting NuShell Usable Under OSX for Myself
date: 2022-07-17 11:20 -0400
category: nushell
tags: ["nushell", "rust"]
---
{:.center}
![Pizza](/blog/assets/pfu/2022_05_19_thursday_04.jpg)

{:.center}
Pizza courtesy of Pizza for Ukraine!

{:.center}
[Donate Now to Pizza for Ukraine](https://www.pizzaforukraine.com/)


As I've written, I'm acutely interested in using software written in Rust as my daily drivers.  What I've seen so far is that programs written in Rust, based on an admittedly tiny sample, seem to be higher quality than programs not written in Rust.

In this blog post, I'm going to talk about what I had to do to make NuShell be usable for myself under OSX Monterey.  To be perfectly honest, I don't know if my experiences are normal or not.  I seem to have a high personal level of entropy with respect to software and it appears that at least sometimes this level of entropy causes bugs.  This is the main reason that I document things so dogmatically -- I often need to refer to my own blog.

## Step 00: Changing Your Shell to NuShell

After you install NuShell, you are left a bit on your own.  You can invoke it via the nu command but what you really want is it to come up as the default shell.  This is done with chsh:

    sudo chsh -s /usr/local/bin/nu sjohnson

**NOTE**: DO NOT CLOSE ALL YOUR OLD TERMINALS!!!  If you are like me and are heavily reliant on history then you want to do this in an existing Bash / Zshell / Fish / Whatever terminal window:

    history > ~/history_old.txt
    chmod +r ~/history_old.txt

Yes - I think that strongly about history that I want this read only so it doesn't get killed inadvertently.

## Step 01: Getting Brew to Function 

After you switch over to using NuShell, you may find that programs like brew aren't found.  This is a path issue (isn't everything???).  Here's an example:

    /Users/sjohnson/Sync/coding/flow_analytics〉brew                                                                                 07/17/2022 10:59:12 AM
    Error: nu::shell::external_command (link)
    
      × External command
       ╭─[entry #11:1:1]
     1 │ brew
       · ──┬─
       ·   ╰── can't run executable
       ╰────
      help: No such file or directory (os error 2)      

The solution is to add brew's path into the NuShell environment.  Back in your old shell window, type:

    Sync/coding/flow_analytics on ☁️  (us-west-2)
    ❯ which brew
    /usr/local/bin/brew
    
This tells us we want to add **/usr/local/bin/** to our path.  This can be done in two ways:

1. Locally in the current shell window's execution context (so this only affects your current session).
2. In the configuration file for Nu.

### Setting Path Locally

Your overall environment is available in the $env variable:

    /Users/sjohnson/Sync/coding/flow_analytics〉$env                                                                                 07/17/2022 11:18:06 AM
    ╭────────────────────────────┬────────────────────────────────────────────────────────────────────╮
    │ CMD_DURATION_MS            │ 4                                                                  │
    │ COLORFGBG                  │ 7;0                                                                │
    │ COLORTERM                  │ truecolor                                                          │
    │ COMMAND_MODE               │ unix2003                                                           │
    │ DISPLAY                    │ /private/tmp/com.apple.launchd.irNmAizE05/org.macosforge.xquartz:0 │
    │ ENV_CONVERSIONS            │ {record 2 fields}                                                  │
    │ HOME                       │ /Users/sjohnson                                                    │
    │ ITERM_PROFILE              │ Default                                                            │
    │ ITERM_SESSION_ID           │ w3t2p0:CCE4A07C-C0EC-4B6A-BEF4-CA697D4905C9                        │
    │ LANG                       │ en_US.UTF-8                                                        │
    │ LAST_EXIT_CODE             │ 1                                                                  │
    │ LC_TERMINAL                │ iTerm2                                                             │
    │ LC_TERMINAL_VERSION        │ 3.3.9                                                              │
    │ LOGNAME                    │ sjohnson                                                           │
    │ LaunchInstanceID           │ 680CF766-28B5-428D-A77C-A7F910569794                               │
    │ NUSHELL_CURRENT_SHELL      │ 0                                                                  │
    │ NUSHELL_SHELLS             │ [list 1 item]                                                      │
    │ NU_LIB_DIRS                │ [list 1 item]                                                      │
    │ NU_PLUGIN_DIRS             │ [list 1 item]                                                      │
    │ OLDPWD                     │ /Users/sjohnson/Sync/coding                                        │
    │ PATH                       │ [list 5 items]                                                     │
    │ PROMPT_COMMAND             │ <Block 42>                                                         │
    │ PROMPT_COMMAND_RIGHT       │ <Block 43>                                                         │
    │ PROMPT_INDICATOR           │ <Block 44>                                                         │
    │ PROMPT_INDICATOR_VI_INSERT │ <Block 45>                                                         │
    │ PROMPT_INDICATOR_VI_NORMAL │ <Block 46>                                                         │
    │ PROMPT_MULTILINE_INDICATOR │ <Block 47>                                                         │
    │ PWD                        │ /Users/sjohnson/Sync/coding/flow_analytics                         │
    │ SECURITYSESSIONID          │ 186a6                                                              │
    │ SHELL                      │ /usr/local/bin/nu                                                  │
    │ SSH_AUTH_SOCK              │ /private/tmp/com.apple.launchd.FNFdrFKEZA/Listeners                │
    │ TERM                       │ xterm-256color                                                     │
    │ TERM_PROGRAM               │ iTerm.app                                                          │
    │ TERM_PROGRAM_VERSION       │ 3.3.9                                                              │
    │ TERM_SESSION_ID            │ w3t2p0:CCE4A07C-C0EC-4B6A-BEF4-CA697D4905C9                        │
    │ TMPDIR                     │ /var/folders/t1/8wysbvsx2h50nm_26pqnq2780000gn/T/                  │
    │ USER                       │ sjohnson                                                           │
    │ XPC_FLAGS                  │ 0x0                                                                │
    │ XPC_SERVICE_NAME           │ 0                                                                  │
    │ __CFBundleIdentifier       │ com.googlecode.iterm2                                              │
    │ __CF_USER_TEXT_ENCODING    │ 0x1F5:0x0:0x0                                                      │
    │ config                     │ {record 26 fields}                                                 │
    ╰────────────────────────────┴────────────────────────────────────────────────────────────────────╯

Here's how to view the current path:

    env.PATH                                                                            07/17/2022 11:18:52 AM
    ╭───┬─────────────────────╮
    │ 0 │ /usr/bin            │
    │ 1 │ /bin                │
    │ 2 │ /usr/sbin           │
    │ 3 │ /sbin               │
    │ 4 │ /usr/local/bin/brew │
    ╰───┴─────────────────────╯

Here's how to update your local path:

    let-env PATH = ($env.PATH | append "/usr/local/bin")
    
After that a which brew gives you:

    which brew                                                                           07/17/2022 11:33:30 AM
    ╭───┬──────┬─────────────────────┬──────────╮
    │ # │ arg  │        path         │ built-in │
    ├───┼──────┼─────────────────────┼──────────┤
    │ 0 │ brew │ /usr/local/bin/brew │ false    │
    ╰───┴──────┴─────────────────────┴──────────╯

### Setting Path Persistently

Your configuration file is located here (change your login directory appropriately):

    "/Users/sjohnson/Library/Application Support/nushell/config.nu"

So you can edit this with vi:

    vi "/Users/sjohnson/Library/Application Support/nushell/config.nu"

And then you can add a line at the end like:

    let-env PATH = ($env.PATH | append "/usr/local/bin")

## Step 02: Never Type Bundle Exec Again - An Alias

Aliases allow shells to expand text commands into their underlying syntax.  For example, I've long had **be** aliased to **bundle exec** (which any rubyist knows and loathes).

The command for aliases is:

    alias be = bundle exec

As with path, you can execute this locally for your current session or you can put it in your config.nu file.  Here's what my config.nu file is starting to look like:

## Step 03: Adding mate As an Alias

Yeah, yeah.  I want to get out of my 20 year long dysfunctional relationship with TextMate but I'm not there yet.  Here's what to alias to make it work for now:

    alias mate = /usr/local/bin/mate

## Step 04: Loading Configuration Changes from config.nu

It is important to understand that if you make changes to config.nu and then launch a new terminal, you will NOT get the changes you just added to config.nu.  This seems insane to me but my assumption is that there is a master process which has a cached copy of the config.nu file from when the first terminal was launched.  

To get your changes, you need to source the config.nu file just as you would source a .bashrc or .zshrc file.  Your config.nu file can be accessed from the variable:

    $nu.config-path                                                                      07/17/2022 01:31:28 PM
    /Users/sjohnson/Library/Application Support/nushell/config.nu

There is one issue -- you can't source that value as, apparently, the nushell environment is compiled.  

What you would think would work would be:

    source $"($nu.config-path)"

or some variant but it simply will not work.  So you need to do this manually:

    source "/Users/sjohnson/Library/Application Support/nushell/config.nu"

This feels damn weird to me but just memorize **$nu.config-path** and then write a source command manually with copy and paste.  And, alas, you have to have "" around the path expression because Apple was insane in the brain when they named it "Application Support" and not "ApplicationSupport".  Cupertino at its absolute most stupid.

## A Known Issue -- Any Errors in config.nu STOP all config.nu changes

I originally attempted to execute this in my config.nu file:

    source /Users/sjohnson/.rvm/scripts/rvm

That threw an error since it doesn't work in NuShell (there isn't Bash compatibility).  And, interestingly, even though that came AFTER my alias lines, nothing from my config.nu came thru until I removed this line.

## And the Killer Issue is Lack of RVM Support

After getting to those point, I finally dealt with my RVM issue (the source line above) and discovered that [there isn't support for this in NuShell](https://github.com/nushell/nushell/issues/1960).

So I guess the likely answer for me is:

    sudo chsh -s /bin/bash sjohnson

For right now I have enough existing windows where RVM had run that I don't have to switch back yet but the minute I have a machine crash, well, I'm toast and then back to Bash.

And if I want NuShell, I'm going to have to just execute nu.  DAMN IT; I really like NuShell and I want it to work.  NuShell feels to me the way ZShell did when I first tried it but without that awful feeling of all the Bash compatibility it lugs around.

## Sidebar: NuShell is Aware of Virtual Environment Issues

I had a bit of a discussion with some of the NuShell folk about this with respect to RVM.  They are aware of it and they do have support for [Python's Conda](https://github.com/nushell/nu_scripts/tree/main/virtual_environments).  There was a long [RVM github issue](https://github.com/nushell/nushell/issues/1960) written up 2 years ago but it had gone stale until recently.

NuShell is looking for help on this topic (I looked at the Conda example and I suspect my shell scripting isn't up to the task; alas).

I suspect if I had to give NuShell advice, they should look into supporting [asdf](https://asdf-vm.com/) since asdf supports multiple languages.  While I like RVM, it only gives me support for Ruby while I've used asdf with lots of things including Elixir.

## Thank You's

The following folks on the NuShell discord server were enormously helpful - welcoming, gracious and knowledgable:

* [Reilly](https://github.com/rgwood) 
* JT
* EpThinker

Thank you all.  Truly appreciated.

## See Also

* [NuShell and Virtual Environments](https://github.com/nushell/nu_scripts/tree/main/virtual_environments)
* [NuShell and RVM](https://github.com/nushell/nushell/issues/1960)
* [NuShell Configuration](https://www.nushell.sh/book/configuration.html)
* [NuShell and String Interpolation](https://www.nushell.sh/book/working_with_strings.html#string-interpolation)
* [NuShell and Environment Variables](https://www.nushell.sh/cookbook/setup.html#how-to-list-your-environment-variables)
* [NuShell and Aliases](https://www.nushell.sh/book/aliases.html#how-to-write-an-alias-with-pipes)
* [Reilly's NuShell Configuration File](https://github.com/rgwood/dotfiles/blob/master/nu/config.nu#L3)
* [NuShell Discord Server](https://discord.com/channels/601130461678272522)

