---
layout: post
title: Nushell Rocks - Go Yehuda Go
category: nushell
tags: ["nushell", "rust"]
---
NuShell is a damn interesting approach to a shell.  Here's a description:

"Today, we’re introducing a new shell, written in Rust. It draws inspiration from the classic Unix philosophy of pipelines, the structured data approach of PowerShell, functional programming, systems programming, and more."

Nu is written by Jonathan Turner, Yehuda Katz and more.  Given that I'm a rubyist, it is no surprise that I'm a Yehuda Katz fan (hence the reference to Yehuda in the title).  But this is Jonathan Turner's project.

I had a bunch of issues getting running with Nu so I wrote up this blog post.  
# Installing Nu

In order to install Nu, you need the whole Rust environment and toolchain.  Additionally you need to make sure that you are using the nightly build of Rust.  I'm on OSX and this is what I did:

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
    rustup default nightly
    cargo install nu

Depending on the state of your OSX Mojave installation, you may need to run:

    xcode-select --install
    
before your installation will complete (in this event, just re-run from the curl statement).

# Running Nu

Just call the nu executable:

    nu

Here's an example of what Nu looks like:

     ls Desktop/| sort-by name | first 5

    ---+--------------------+------+----------+----------+--------------+-------------+-------------
     # | name               | type | readonly | size     | created      | accessed    | modified 
    ---+--------------------+------+----------+----------+--------------+-------------+-------------
     0 | Desktop/.DS_Store  | File |          | 92.2 KB  | 2 years ago  | 2 weeks ago | a day ago 
     1 | Desktop/.localized | File |          | <empty>  | 12 years ago | 2 years ago | 2 years ago 
     2 | Desktop/1.png      | File |          | 255.2 KB | 2 years ago  | 2 years ago | 2 years ago 
     3 | Desktop/2.png      | File |          | 269.7 KB | 2 years ago  | 2 years ago | 2 years ago 
     4 | Desktop/3.png      | File |          | 276.3 KB | 2 years ago  | 2 years ago | 2 years ago 
    ---+--------------------+------+----------+----------+--------------+-------------+-------------

And nu extends into even ps:

    ps | where cpu > 1 | sort-by cpu | first 5

    ---+-------+----------+------+--------------------------------------------------------------------------------------------------
     # | pid   | status   | cpu  | name 
    ---+-------+----------+------+--------------------------------------------------------------------------------------------------
     0 | 89054 | Runnable | 1.34 | /Applications/Firefox.app/Contents/MacOS/firefox 
     1 | 313   | Runnable | 2.45 | /System/Library/CoreServices/Finder.app/Contents/MacOS/Finder 
     2 | 766   | Runnable | 4.80 | /System/Library/PrivateFrameworks/PhotoLibraryPrivate.framework/Versions/A/Support/photolibraryd 
    ---+-------+----------+------+--------------------------------------------------------------------------------------------------

# Exiting Nu

Press ctrl+c twice.

# Example Commands

Here are some interesting command examples:

    ls
    ls | where size > 4kb
    ls | where size > 1gb
    ps | where cpu > 5
    open file.json
    ls | get name | echo $it
    open https://www.jonathanturner.org/feed.xml
    ls | sort-by size
    ls | pick name size
    ls | sort-by size | first 5
    ls | sort-by size | first 5 | skip 2
    ls | sort-by name
    enter docs 
    (this is changing into a directory and then you have a second embeded shell 
      which you can navigate between with n and p)

# References
* [Website](http://www.nushell.sh/)
* [Introduction](http://www.jonathanturner.org/2019/08/introducing-nushell.html)
* [Hacker News](https://news.ycombinator.com/item?id=20783006)
* [The Nu Book](https://book.nushell.sh/en/)
* [Rustup](https://rustup.rs/)
* [Nushell Github](https://github.com/nushell/nushell)
* [Reddit](https://www.reddit.com/r/rust/comments/cukfnj/announcing_nushell_a_modern_shell_written_in_rust/)
* [Rust Nightly](https://www.oreilly.com/library/view/rust-programming-by/9781788390637/e07dc768-de29-482e-804b-0274b4bef418.xhtml)
* [Installation](https://book.nushell.sh/en/installation)
