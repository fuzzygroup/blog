---
layout: post
title: Rust Editors to Replace TextMate 2 - The Agony of Despair
date: 2022-07-08 08:59 -0400
category: rust
tags: ["rust", "editor"]
---
{:.center}
![Pizza](/blog/assets/DSC01552.JPG)

{:.center}
Pizza courtesy of Pizza for Ukraine!

{:.center}
[Donate Now to Pizza for Ukraine](https://www.pizzaforukraine.com/)

**Note**: This has now appeared on [Hacker News](https://news.ycombinator.com/item?id=32034893#32036250) -- thank you for the upvotes; I'm very flattered.  I got some good information on Lapce from - maybe - the author and I've updated that.

## Change Log
* Updated: 2022-07-10 added Neovide, a description of each editor, github start count and more. Oh and this Change Log.
Updated: 2022-07-09 updated with additional info on Lapce and Zed thanks to input from people related to those projects on Twitter (thank you)
* Authored: 2022-07-08 in a post crash state of despair

## Introduction

The older I get and remain an *active* software engineer, the less accepting I am of **poor software quality**.  I think all of us gray beards know that software crashes, generally, are a choice of the developer in terms of his:

* technology platform -- some technologies are inherently riskier than others i.e. "Friends don't let friends use C++"  or "Practice safe computing my son"
* development practices -- things like test driven development and pair programming (stop arguing on pair programming; we can debate this later; I'll wager I've spent more time actively pairing than you) that demonstrably improve code quality
* engineering philosophy -- Erlang is a fabulous demonstration that by embracing failure you can make more reliable software

But when you fail to address any of the above, you end up with today's software quality crisis -- crashes, bloat and more.  And, honestly, I'm tired of it.

This morning, at about 6:53 am, my beloved TextMate 2, an editor that less than 2 hours ago, I had typed into a Discourse thread "You can pry out of my cold dead hands", went insane once again.  TextMate 2 has a lockup context where it won't crash but it will just sit there and refuse to respond to keystrokes.  Then you have to force quit it and depending on the severity of its insanity will recover its context on restart or not.  This is why I write down things like this:

* [Fixing TextMate 2 When It Goes Insane](https://fuzzyblog.io/blog/textmate/2020/01/15/fixing-textmate-2-when-it-goes-insane.html)
* [Forensic Computing 1 - Finding TextMate Untitled Documents](https://fuzzyblog.io/blog/text/2017/10/08/forensic-computing-1-finding-textmate-untitled-documents.html)
* [Adding AutoSave on Focus Lost to TextMate 2](Adding AutoSave on Focus Lost to TextMate 2)

> Sidebar: When TextMate had to be Force Quit, it was using 1.76 gigs of RAM.  Now, despite doing nothing but opening this one document (and all my history it recovered), it is now using 2.93 gigs of RAM.  This document is only 562 words.  Somehow, maybe it is just me, that doesn't explain the additional 1.18 gigs of RAM used for just 562 words.  I am on a computer with 64 gigs of RAM and 1/20th of that is my FSCKING TEXT EDITOR!!!

{:.center}
![Pizza](/blog/assets/textmate.png)

Every time you have a crash in something as fundamental as an editor for a software developer, it is an excuse for someone to lose focus, stop, take a break, etc.  Me?  I went to the grocery story -- at a point when I had been closing in on making a release of an open source package I've been promising myself to finish for **6 years**.  I still haven't gotten back to that Zen point of coding I had been at even though hours have passed.  I am instead still fuming and looking for a different editor and writing this rant.  And that's why I hate crashes.  

**Note**: I have now been writing about this since 2003 when I first (roughly) calculated the impact of Windows stability on the economy in terms of reboot resulting time away from work.

It has been said that insanity is doing the same thing repeatedly and expecting different results.  And, yes, I've been expecting classically written software to simply get better over time.  This clearly isn't going to happen so it is time to look for alternatives.

## About Rust

Rust is a relatively new programming language with a focus on speed, correctness and memory safety.  Rust essentially makes the crazy gyrations that are so common -- and inherently wrong -- in C derived languages so hard that you simply don't make them.  And this:

1. Makes Rust hard to learn.
2. Self selects the programmers willing to learn rust down to an elite handful.
3. Results in higher quality software.

I don't think I'm incorrect in saying that when a piece of software written in Rust exists, it is going to be higher quality than something written in C / Swift / C++ / Java.  And, because of that, I have started using more software written in Rust whenever possible.  I recently switched my terminal from iTerm 2 to [Warp.dev](https://www.warp.dev/) because of this.

## The Hacker News Reaction and Rebuttal

Much to my surprise, this blog post got picked up on [Hacker News to mixed response](https://news.ycombinator.com/item?id=32034893#32036250) -- and a lot of the comments were right.  Rust doesn't automatically make things better and there is (apparently) a lot of bad rust out there.  The Hacker News audience was very kind to my rant and made me think.  Thank you.

## Examples of Good End Users, Graphical Software Written in Rust

A point in the Hacker News article was my assertion that Rust makes things better but that I hadn't proven this.  Here are my examples:

* [StarShip](https://starship.rs/) command prompt (ok maybe not so graphical)
* [NuShell](https://www.nushell.sh/)
* [Warp.dev](https://www.warp.dev/)

Yes this isn't a big sample but I'm a software engineer and I live in three things: My Shell, My Terminal and My Editor.  My shell and prompt were improved by Rust. And now I'm trying a Rust editor.  Maybe Rust won't save the world but it is making my life demonstrably better.

## What Do I Need in an Editor

I'm a hard core rubyist with a focus on Rails.  Yes I do other languages but the Ruby stuff is not going to change.  Here's what I need in an editor:

1. Graphical; Sorry I do like the WIMP interface; I did my half million lines of code in VIM and I love Bram Moolenar but no; just no
2. Basic conformation to platform conventions
3. Able to be invoked easily from the command line and open a directory of files with a tree view on the left
4. Able to be used for documents (markdown / ascii) as well as code
5. Syntax highlighting
6. Keystroke macro recording
7. Autosave on focus lost
8. Extensibility if at all possible; TextMate succeeded in large part because there are bundles for everything 
9. A window menu that lists all windows
10. Configurable keystrokes
11. Fuzzy Finder for quick navigation to files
12. Cross file search
13. Features need to be discoverable
14. Fast
15. Side by Side display.  TextMate doesn't have this but I noticed it in Lapce and added it to the list because it was that damn impressive.
16. Has to be low enough overhead that I can create a new doc, not bother to save it, drop some text bits into it and get back to it when I please; in essence I'm treating editor windows / buffers at virtual scraps of paper.  Periodically I will recurse through them and deal with but it may not be for weeks. And don't tell me that's my problem -- right now I have 50 windows open.  Each with maybe a few K of text.  On a 64 gig machine.

And I don't have to have everything but that's the core nexus of what I use daily.

## Let's Look at Some Options

And now for the feature level comparison.  I tried to write this as a traditional table comparing all features but the blithering ball of suck that is Jekyll and table layout left me in a rage.  So there are 15 tables each of which focus on one element of the editors.  The benefit to the multiple table approach is the selective winnowing down of options.

**NOTE**: If you want a good looking, well formatted version of this then please follow this link over to the gist version of this section.

[Gist!](https://gist.github.com/fuzzygroup/8a5ad188e368df0796180d150eb41f67)

### What's Being Actively Worked On

This looks at the editors by commit count and it pretty clearly shows you what is actively under development.  With this analysis, we can reduce 8 editors down to 4.

| Editor      | Commit Count | Stars |
| ----------- | ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | 1,170 | 3.2K |
| [glyph](https://github.com/zackradisic/glyph)      | 50| 68 |
| [helix](https://github.com/helix-editor/helix) | 3,028 | 10.5K |
| [hired](https://github.com/sidju/hired)| 78 | 14 |
| [kibi](https://github.com/ilai-deutel/kibi) | 179 | 784 |
| [lapce](https://github.com/lapce/lapce) | 1,669 | 12.9K |
| [Neovide](https://github.com/neovide/neovide) | 887 | 7.6K|
| [pepper](https://github.com/vamolessa/pepper) | 3,133 | 247 |
| [Zed](https://zed.dev/)| 1,200 |1.9K |
| [zee](https://github.com/zee-editor/zee) | 137 | 1k |

### Sidebar: Each Editor Briefly Described

With the number of editors winnowed down from 8, I've now had some additional time to assess each editor and I can try and craft a coherent paragraph on each.  Think of this as the tldr for each editor.  My apologies to the project authors where I got stuff wrong; I know you all work hard on your project and I do appreciate it.

* Amp -- A light weight character mode editor with a VI like feel.
* Helix -- A very impressive character mode editor.  It feels like there's a lot of tech under the hood.
* Lapce -- A graphical editor with split screening and an embedded terminal.  There is a lot of good stuff in the head branch of the git repo so it looks like it will be getting much better in the near future.
* Neovide -- The only one I wasn't able to try.  This is a graphical front end on top of NeoVim.  Unfortunately Apple wouldn't let it execute either from Brew or a cargo build (cargo is the Rust build tool).
* Zed -- A very impressive graphical editor and the one that is robust enough for me to use today.  One of its most intriguing promises is the ability to edit files concurrently with another person.  I suspect this is a pair programming style business model.  Overall Zed having a commmercial focus is I think good because it argues for a long live span.
* Zee -- A light weight character mode editor.

### Editing Style - Vim or Emacs

I know this isn't listed above but it is one of the great Litmus tests for editors.

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | Emacs |
| [helix](https://github.com/helix-editor/helix) | VI | 
| [lapce](https://github.com/lapce/lapce) | Graphical; modal mode for VI fans in settings(1) |  
| [Neovide](https://github.com/neovide/neovide) | VI|
| [Zed](https://zed.dev/) | Graphical; configurable key bindings although rough - keymap.json file  | 
| [zee](https://github.com/zee-editor/zee) | Emacs  | 

Normally I'd toss out anything Emacs style right from the jump but it is already a small pool.

1 - source: [Jakub Panek](https://twitter.com/panekj_dev) on Twitter

### Graphical vs Character Mode

| Editor      | Graphical |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | N |
| [helix](https://github.com/helix-editor/helix) | N | 
| [lapce](https://github.com/lapce/lapce) | Y |  
| [Neovide](https://github.com/neovide/neovide) | Y |
| [pepper](https://github.com/vamolessa/pepper) | N | 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) | N | 

Note 1: I left Zee in here because of its 100 fps claim.  Performance really matters; they get props for realizing that.

Note 2: With exactly 2 graphical editors, I have to relax this criteria (perhaps).

Note 3: Neovide is graphical but it is also a VIM style editor (technically a front end to NeoVim) so the graphics are minimal (but if you are a VI person that's what you want).

### Basic Conformation to Platform Conventions

Computing platforms have a style and conforming to that style / conventions matters.

| Editor      | Graphical |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | N |
| [helix](https://github.com/helix-editor/helix) | N | 
| [lapce](https://github.com/lapce/lapce) | N - Only a single menu; File picker responds to ~ but doesn't allow pasting in a path |  
| [Neovide](https://github.com/neovide/neovide) | ?|
| [pepper](https://github.com/vamolessa/pepper) | N | 
| [Zed](https://zed.dev/) | Yes; Clearly early days but going the right direction | 
| [zee](https://github.com/zee-editor/zee) | N | 

Note: Given that nothing conforms to platform conventions, either I give up and go home or plow on and accept change.

Lapce gets huge props for integrating a Terminal into its environment giving a very integrated feeling.

Neovide - I couldn't try it so its hard for me to say but it appears to follow platform conventions as much as you can while being true to VI styling.

Zed gets huge props for being recognizably a modern style programming editor.  I had no issues conceptually mapping it in the Sublime / TextMate school of design.

### Invoke from Command Line and Open Directory

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | N |
| [helix](https://github.com/helix-editor/helix) | YES - Beautifully implemented; Kudos | 
| [lapce](https://github.com/lapce/lapce) | There is a basic CLI interface in HEAD not yet released so its coming!(1) |  
| [Neovide](https://github.com/neovide/neovide) | Y |
| [pepper](https://github.com/vamolessa/pepper) | ? | 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) | ? | 

1 - source: [Jakub Panek](https://twitter.com/panekj_dev) on Twitter

**Note**: There is an Install CLI option and while it didn't have feedback at all, once I did it and typed:

    zed .

The directory I was in opened instantly; **beautiful**.

### Useful for Documents

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | ? |
| [helix](https://github.com/helix-editor/helix) | ? | 
| [lapce](https://github.com/lapce/lapce) | N - Seems to be a single editor window only |  
| [Neovide](https://github.com/neovide/neovide) | Y|
| [pepper](https://github.com/vamolessa/pepper) | ? | 
| [Zed](https://zed.dev/) | Y - it even highlights markdown syntax; swoon | 
| [zee](https://github.com/zee-editor/zee) | ? | 

### Syntax Highlighting for Ruby

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | Y |
| [helix](https://github.com/helix-editor/helix) |  N | 
| [lapce](https://github.com/lapce/lapce) | Y |  
| [Neovide](https://github.com/neovide/neovide) | ?|
| [pepper](https://github.com/vamolessa/pepper) | N  | 
| [Zed](https://zed.dev/) | N | 
| [zee](https://github.com/zee-editor/zee) | N  | 

**Note**: I'm really not sure why I'm not getting syntax highlighting more and I'm worried that I'm doing something wrong.  The lack of it deeply surprises me in programming editors.  Perhaps it is a generalized shift to LSP support; unclear.

I was really quite sorry to see Pepper drop out here.  I was even more annoyed to see that Helix has support for syntax highlighting in Elvish but not for ruby:

    hx --grammar fetch ruby

    Grammar 'bash' checked out at '275effdfc0edce774acf7d481f9ea195c6c403cd'.
    Grammar 'c' checked out at 'f05e279aedde06a25801c3f2b2cc8ac17fac52ae'.
    Grammar 'c-sharp' checked out at '53a65a908167d6556e1fcdb67f1ee62aac101dda'.
    Grammar 'cairo' checked out at '5155c6eb40db6d437f4fa41b8bcd8890a1c91716'.
    Grammar 'clojure' checked out at 'e57c569ae332ca365da623712ae1f50f84daeae2'.
    Grammar 'cmake' checked out at 'f6616f1e417ee8b62daf251aa1daa5d73781c596'.
    Grammar 'comment' checked out at '5dd3c62f1bbe378b220fe16b317b85247898639e'.
    Grammar 'cpon' checked out at '0d01fcdae5a53191df5b1349f9bce053833270e7'.
    Grammar 'cpp' checked out at 'e8dcc9d2b404c542fd236ea5f7208f90be8a6e89'.
    Grammar 'css' checked out at '94e10230939e702b4fa3fa2cb5c3bc7173b95d07'.
    Grammar 'dart' checked out at '6a25376685d1d47968c2cef06d4db8d84a70025e'.
    Grammar 'devicetree' checked out at '877adbfa0174d25894c40fa75ad52d4515a36368'.
    Grammar 'dockerfile' checked out at '7af32bc04a66ab196f5b9f92ac471f29372ae2ce'.
    Grammar 'edoc' checked out at '1691ec0aa7ad1ed9fa295590545f27e570d12d60'.
    Grammar 'eex' checked out at 'f742f2fe327463335e8671a87c0b9b396905d1d1'.
    Grammar 'elixir' checked out at '1dabc1c790e07115175057863808085ea60dd08a'.
    Grammar 'elm' checked out at 'bd50ccf66b42c55252ac8efc1086af4ac6bab8cd'.
    Grammar 'elvish' checked out at 'e50787cadd3bc54f6d9c0704493a79078bb8a4e5'.
    Grammar 'embedded-template' checked out at 'd21df11b0ecc6fd211dbe11278e92ef67bd17e97'.
    Grammar 'erlang' checked out at '0e7d677d11a7379686c53c616825714ccb728059'.
    Grammar 'fish' checked out at '04e54ab6585dfd4fee6ddfe5849af56f101b6d4f'.
    Grammar 'gdscript' checked out at '2a6abdaa47fcb91397e09a97c7433fd995ea46c6'.
    Grammar 'git-commit' checked out at '318dd72abfaa7b8044c1d1fbeabcd06deaaf038f'.
    Grammar 'git-config' checked out at '0e4f0baf90b57e5aeb62dcdbf03062c6315d43ea'.
    Grammar 'git-diff' checked out at 'c12e6ecb54485f764250556ffd7ccb18f8e2942b'.
    Grammar 'git-rebase' checked out at '332dc528f27044bc4427024dbb33e6941fc131f2'.
    Grammar 'gitattributes' checked out at '3dd50808e3096f93dccd5e9dc7dc3dba2eb12dc4'.
    Grammar 'gitignore' checked out at 'f4685bf11ac466dd278449bcfe5fd014e94aa504'.
    Grammar 'gleam' checked out at 'd7861b2a4b4d594c58bb4f1be5f1f4ee4c67e5c3'.
    Grammar 'glsl' checked out at '88408ffc5e27abcffced7010fc77396ae3636d7e'.
    Grammar 'go' checked out at '0fa917a7022d1cd2e9b779a6a8fc5dc7fad69c75'.
    Grammar 'gomod' checked out at 'e8f51f8e4363a3d9a427e8f63f4c1bbc5ef5d8d0'.
    Grammar 'gowork' checked out at '6dd9dd79fb51e9f2abc829d5e97b15015b6a8ae2'.
    Grammar 'graphql' checked out at '5e66e961eee421786bdda8495ed1db045e06b5fe'.
    Grammar 'hare' checked out at 'bc26a6a949f2e0d98b7bfc437d459b250900a165'.
    Grammar 'haskell' checked out at 'b6ec26f181dd059eedd506fa5fbeae1b8e5556c8'.
    Grammar 'hcl' checked out at '3cb7fc28247efbcb2973b97e71c78838ad98a583'.
    Grammar 'heex' checked out at '961bc4d2937cfd24ceb0a5a6b2da607809f8822e'.
    Grammar 'html' checked out at 'd93af487cc75120c89257195e6be46c999c6ba18'.
    Grammar 'iex' checked out at '39f20bb51f502e32058684e893c0c0b00bb2332c'.
    Grammar 'java' checked out at 'bd6186c24d5eb13b4623efac9d944dcc095c0dad'.
    Grammar 'javascript' checked out at '4a95461c4761c624f2263725aca79eeaefd36cad'.
    Grammar 'jsdoc' checked out at '189a6a4829beb9cdbe837260653b4a3dfb0cc3db'.
    Grammar 'json' checked out at '65bceef69c3b0f24c0b19ce67d79f57c96e90fcb'.
    Grammar 'julia' checked out at '12ea597262125fc22fd2e91aa953ac69b19c26ca'.
    Grammar 'kotlin' checked out at 'a4f71eb9b8c9b19ded3e0e9470be4b1b77c2b569'.
    Grammar 'latex' checked out at '7f720661de5316c0f8fee956526d4002fa1086d8'.
    Grammar 'lean' checked out at 'd98426109258b266e1e92358c5f11716d2e8f638'.
    Grammar 'ledger' checked out at '1f864fb2bf6a87fe1b48545cc6adc6d23090adf7'.
    Grammar 'llvm' checked out at '3b213925b9c4f42c1acfe2e10bfbb438d9c6834d'.
    Grammar 'llvm-mir' checked out at '06fabca19454b2dc00c1b211a7cb7ad0bc2585f1'.
    Grammar 'lua' checked out at '6f5d40190ec8a0aa8c8410699353d820f4f7d7a6'.
    Grammar 'make' checked out at 'a4b9187417d6be349ee5fd4b6e77b4172c6827dd'.
    Grammar 'markdown' checked out at 'ab15701d8f3f68aeb74e30573b7d669a6ef2a7ed'.
    Grammar 'meson' checked out at 'feea83be9225842490066522ced2d13eb9cce0bd'.
    Grammar 'nickel' checked out at '9d83db400b6c11260b9106f131f93ddda8131933'.
    Grammar 'nix' checked out at '6b71a810c0acd49b980c50fc79092561f7cee307'.
    Grammar 'nu' checked out at 'db4e990b78824c8abef3618e0f93b7fe1e8f4c0d'.
    Grammar 'ocaml' checked out at '23d419ba45789c5a47d31448061557716b02750a'.
    Grammar 'ocaml-interface' checked out at '23d419ba45789c5a47d31448061557716b02750a'.
    Grammar 'odin' checked out at 'da885f4a387f169b9b69fe0968259ee257a8f69a'.
    Grammar 'openscad' checked out at '5c3ce93df0ac1da7197cf6ae125aade26d6b8972'.
    Grammar 'org' checked out at '1c3eb533a9cf6800067357b59e03ac3f91fc3a54'.
    Grammar 'perl' checked out at '0ac2c6da562c7a2c26ed7e8691d4a590f7e8b90a'.
    Grammar 'php' checked out at '57f855461aeeca73bd4218754fb26b5ac143f98f'.
    Grammar 'prisma' checked out at '17a59236ac25413b81b1613ea6ba5d8d52d7cd6c'.
    Grammar 'protobuf' checked out at '19c211a01434d9f03efff99f85e19f967591b175'.
    Grammar 'python' checked out at 'd6210ceab11e8d812d4ab59c07c81458ec6e5184'.
    Grammar 'r' checked out at 'cc04302e1bff76fa02e129f332f44636813b0c3c'.
    Grammar 'regex' checked out at 'e1cfca3c79896ff79842f057ea13e529b66af636'.
    Grammar 'rescript' checked out at '4cd7ba91696886fdaca086fb32b5fd8cc294a129'.
    Grammar 'ruby' checked out at 'dfff673b41df7fadcbb609c6338f38da3cdd018e'.
    Grammar 'rust' checked out at 'a360da0a29a19c281d08295a35ecd0544d2da211'.
    Grammar 'scala' checked out at '0a3dd53a7fc4b352a538397d054380aaa28be54c'.
    Grammar 'scheme' checked out at '27fb77db05f890c2823b4bd751c6420378df146b'.
    Grammar 'solidity' checked out at 'f3a002274744e859bf64cf3524985f8c31ea84fd'.
    Grammar 'sql' checked out at '0caa7fa2ee00e0b770493a79d4efacc1fc376cc5'.
    Grammar 'sshclientconfig' checked out at '769d7a01a2e5493b4bb5a51096c6bf4be130b024'.
    Grammar 'svelte' checked out at '349a5984513b4a4a9e143a6e746120c6ff6cf6ed'.
    Grammar 'swift' checked out at 'e75240f89bb3bfd3396155859ae364e5c58d7377'.
    Grammar 'tablegen' checked out at '568dd8a937347175fd58db83d4c4cdaeb6069bd2'.
    Grammar 'toml' checked out at '7cff70bbcbbc62001b465603ca1ea88edd668704'.
    Grammar 'tsq' checked out at '48b5e9f82ae0a4727201626f33a17f69f8e0ff86'.
    Grammar 'tsx' checked out at '3e897ea5925f037cfae2e551f8e6b12eec2a201a'.
    Grammar 'twig' checked out at 'b7444181fb38e603e25ea8fcdac55f9492e49c27'.
    Grammar 'typescript' checked out at '3e897ea5925f037cfae2e551f8e6b12eec2a201a'.
    Grammar 'v' checked out at '3e8124ea4ab80aa08ec77f03df53f577902a0cdd'.
    Grammar 'vala' checked out at 'c9eea93ba2ec4ec1485392db11945819779745b3'.
    Grammar 'verilog' checked out at '514d8d70593d29ef3ef667fa6b0e504ae7c977e3'.
    Grammar 'vue' checked out at '91fe2754796cd8fba5f229505a23fa08f3546c06'.
    Grammar 'wgsl' checked out at 'f00ff52251edbd58f4d39c9c3204383253032c11'.
    Grammar 'yaml' checked out at '0e36bed171768908f331ff7dff9d956bae016efb'.
    Grammar 'zig' checked out at '93331b8bd8b4ebee2b575490b2758f16ad4e9f30'.

And, yes, Ruby is in the damn list but opening a .rb file doesn't highlight squat.  And this must be a design decision because opening a .py file didn't work either.  Still it is 2022 -- expecting highlighting to work automatically -- in a programming editor isn't a big conceptual leap for me.  Even so the handling of opening a directory nicely has me keeping Helix in the comparison list.

### Keystroke macro recording

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | ? |
| [helix](https://github.com/helix-editor/helix) |  ? | 
| [lapce](https://github.com/lapce/lapce) |  ?|  
| [Neovide](https://github.com/neovide/neovide) | ?|
| [Zed](https://zed.dev/) | N | 
| [zee](https://github.com/zee-editor/zee) |  ?| 

I wasn't able to confirm this on any of the tools.  This is one of those arcane features.

### Autosave on focus lost

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | N |
| [helix](https://github.com/helix-editor/helix) |  N | 
| [lapce](https://github.com/lapce/lapce) | N; maybe it has it but if so it isn't easily discoverable. |  
| [Neovide](https://github.com/neovide/neovide) | ?|
| [Zed](https://zed.dev/) | N | 
| [zee](https://github.com/zee-editor/zee) | N | 

This doesn't seem to be in any editor. However, as much as I believe in autosave, if the underlying editor is actually stable then it matters less. 

**IMPORTANT**: However not only is Auto Save lacking but Lapce allows you to quit without prompting for save.  I only just discovered that or I'd have cut it from the options right here.  That's not just user hostile but basic hating on the user (imho).

### Extensibility 

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | Unknown |
| [helix](https://github.com/helix-editor/helix) | Unknown | 
| [lapce](https://github.com/lapce/lapce) | Unknown |  
| [Neovide](https://github.com/neovide/neovide) | Y|
| [pepper](https://github.com/vamolessa/pepper) | Unknown | 
| [Zed](https://zed.dev/) | Unknown | 
| [zee](https://github.com/zee-editor/zee) | Unknown | 

Yes I need to do more research here.  I freely admit that I punted on this one as I've spent far more time on this than I wanted.

### Window Menu that Lists All Windows

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | N |
| [helix](https://github.com/helix-editor/helix) |N  | 
| [lapce](https://github.com/lapce/lapce) | N - Lapce skips this by only having 1 menu! |  
| [Neovide](https://github.com/neovide/neovide) | N|
| [pepper](https://github.com/vamolessa/pepper) | N | 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) | N | 

The reason for specifically listing this feature is that I'm also running Warp.dev as a terminal manager and it is written in Rust and the bizarre feature omission is a Window menu that lists all the windows.

### Configurable keystrokes

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | ? |
| [helix](https://github.com/helix-editor/helix) | ? | 
| [lapce](https://github.com/lapce/lapce) | ? |  
| [Neovide](https://github.com/neovide/neovide) | Y|
| [pepper](https://github.com/vamolessa/pepper) | ? | 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) | ? | 

As with extensibility, I punted on this one.  I was only able to confirm this for Zed but I suspect it is coming down the pike for Lapce.

### Fuzzy Finder

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | ? |
| [helix](https://github.com/helix-editor/helix) | ? | 
| [lapce](https://github.com/lapce/lapce) |  N |  
| [Neovide](https://github.com/neovide/neovide) | ?|
| [pepper](https://github.com/vamolessa/pepper) |  ?| 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) |  ?| 

I'm pretty sure this is in at least Helix and Pepper but I didn't specifically use it.  I did use this in Zed and it worked perfectly.  Zed also had the more traditional C language style Go to Symbol / Definition stuff you use for C / Java style programming.

### Cross File Search

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | ? |
| [helix](https://github.com/helix-editor/helix) | ? | 
| [lapce](https://github.com/lapce/lapce) | Y (1) |  
| [Neovide](https://github.com/neovide/neovide) | Y|
| [pepper](https://github.com/vamolessa/pepper) | ?| 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) | ? | 

I'm unsure of this feature because, honestly, I couldn't really find info on it.

1 - source: [Jakub Panek](https://twitter.com/panekj_dev) on Twitter

### Discoverable Features

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      |  N|
| [helix](https://github.com/helix-editor/helix) |  N| 
| [lapce](https://github.com/lapce/lapce) |  N|  
| [Neovide](https://github.com/neovide/neovide) | N|
| [pepper](https://github.com/vamolessa/pepper) |  N| 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) |  N| 

None of these editors are particularly discoverable.  The lack of overt user interfaces means they get out of the way but that has a cost of making features unknown unless you really dig in -- and you aren't likely to dig in when you can't tell if it has the features you need.

### Fast

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      |  Y|
| [helix](https://github.com/helix-editor/helix) | Y | 
| [lapce](https://github.com/lapce/lapce) |  Y|  
| [Neovide](https://github.com/neovide/neovide) | Y|
| [pepper](https://github.com/vamolessa/pepper) | Y | 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) | Y | 

Uniformly these felt fast.  Hooray!

### Side by Side display

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      | N |
| [helix](https://github.com/helix-editor/helix) | ? | 
| [lapce](https://github.com/lapce/lapce) |  Y |  
| [Neovide](https://github.com/neovide/neovide) | ?|
| [pepper](https://github.com/vamolessa/pepper) |  N| 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) |  N| 

### Treat Buffers as Virtual Paper

| Editor      | Open |
| ----------- | ----------- |
| [amp](https://github.com/jmacdonald/amp)      |Y |
| [helix](https://github.com/helix-editor/helix) |N  | 
| [lapce](https://github.com/lapce/lapce) | N |  
| [Neovide](https://github.com/neovide/neovide) | Y|
| [pepper](https://github.com/vamolessa/pepper) |  N| 
| [Zed](https://zed.dev/) | Y | 
| [zee](https://github.com/zee-editor/zee) | N | 

With none of the editors supporting save on loss of focus, I wouldn't come close to thinking I could use them in this way.   Auto Save, in 2022, should be a default (imho).  To paraphrase the great Ted Nelson who said something like "Real people trust the car to shift itself", I would argue "Real people trust the editor to automatically save".

### LSP Support

Some reached out to me on Twitter and confirmed that Lapce does have LSP integration -- "although we don't have much LSP plugins yet, only Rust/Go/Clangd".  That's awesome and I'll be sure to experiment with it.

Digging through Helix docs brought up the issue of LSP (language server protocol) support and the hx --health command.  Here is how it looks on my machine:

    ❯ hx --health
    Config file: default
    Language file: default
    Log file: /Users/sjohnson/.cache/helix/helix.log
    Runtime directory: /Users/sjohnson/.cargo/bin/runtime

    Language                      LSP                           DAP                           Highlight                     Textobject                    Indent
    bash                          ✘ bash-language-server        None                          ✘                             ✘                             ✘
    c                             ✔ clangd                      ✘ lldb-vscode                 ✘                             ✘                             ✘
    c-sharp                       ✘ OmniSharp                   None                          ✘                             ✘                             ✘
    cairo                         None                          None                          ✘                             ✘                             ✘
    clojure                       ✘ clojure-lsp                 None                          ✘                             ✘                             ✘
    cmake                         ✘ cmake-language-server       None                          ✘                             ✘                             ✘
    comment                       None                          None                          ✘                             ✘                             ✘
    cpon                          None                          None                          ✘                             ✘                             ✘
    cpp                           ✔ clangd                      ✘ lldb-vscode                 ✘                             ✘                             ✘
    css                           ✘ vscode-css-language-serv…   None                          ✘                             ✘                             ✘
    dart                          ✘ dart                        None                          ✘                             ✘                             ✘
    devicetree                    None                          None                          ✘                             ✘                             ✘
    dockerfile                    ✘ docker-langserver           None                          ✘                             ✘                             ✘
    edoc                          None                          None                          ✘                             ✘                             ✘
    eex                           None                          None                          ✘                             ✘                             ✘
    ejs                           None                          None                          ✘                             ✘                             ✘
    elixir                        ✘ elixir-ls                   None                          ✘                             ✘                             ✘
    elm                           ✘ elm-language-server         None                          ✘                             ✘                             ✘
    elvish                        ✘ elvish                      None                          ✘                             ✘                             ✘
    erb                           None                          None                          ✘                             ✘                             ✘
    erlang                        ✘ erlang_ls                   None                          ✘                             ✘                             ✘
    fish                          None                          None                          ✘                             ✘                             ✘
    gdscript                      None                          None                          ✘                             ✘                             ✘
    git-attributes                None                          None                          ✘                             ✘                             ✘
    git-commit                    None                          None                          ✘                             ✘                             ✘
    git-config                    None                          None                          ✘                             ✘                             ✘
    git-diff                      None                          None                          ✘                             ✘                             ✘
    git-ignore                    None                          None                          ✘                             ✘                             ✘
    git-rebase                    None                          None                          ✘                             ✘                             ✘
    gleam                         None                          None                          ✘                             ✘                             ✘
    glsl                          None                          None                          ✘                             ✘                             ✘
    go                            ✘ gopls                       ✘ dlv                         ✘                             ✘                             ✘
    gomod                         ✘ gopls                       None                          ✘                             ✘                             ✘
    gowork                        ✘ gopls                       None                          ✘                             ✘                             ✘
    graphql                       None                          None                          ✘                             ✘                             ✘
    hare                          None                          None                          ✘                             ✘                             ✘
    haskell                       ✘ haskell-language-server-…   None                          ✘                             ✘                             ✘
    hcl                           ✘ terraform-ls                None                          ✘                             ✘                             ✘
    heex                          None                          None                          ✘                             ✘                             ✘
    html                          ✘ vscode-html-language-ser…   None                          ✘                             ✘                             ✘
    idris                         ✘ idris2-lsp                  None                          ✘                             ✘                             ✘
    iex                           None                          None                          ✘                             ✘                             ✘
    java                          ✘ jdtls                       None                          ✘                             ✘                             ✘
    javascript                    ✘ typescript-language-serv…   ✘                             ✘                             ✘                             ✘
    jsdoc                         None                          None                          ✘                             ✘                             ✘
    json                          ✘ vscode-json-language-ser…   None                          ✘                             ✘                             ✘
    jsx                           ✘ typescript-language-serv…   None                          ✘                             ✘                             ✘
    julia                         ✘ julia                       None                          ✘                             ✘                             ✘
    kotlin                        ✘ kotlin-language-server      None                          ✘                             ✘                             ✘
    latex                         ✘ texlab                      None                          ✘                             ✘                             ✘
    lean                          ✘ lean                        None                          ✘                             ✘                             ✘
    ledger                        None                          None                          ✘                             ✘                             ✘
    llvm                          None                          None                          ✘                             ✘                             ✘
    llvm-mir                      None                          None                          ✘                             ✘                             ✘
    llvm-mir-yaml                 None                          None                          ✘                             ✘                             ✘
    lua                           ✘ lua-language-server         None                          ✘                             ✘                             ✘
    make                          None                          None                          ✘                             ✘                             ✘
    markdown                      None                          None                          ✘                             ✘                             ✘
    meson                         None                          None                          ✘                             ✘                             ✘
    mint                          ✘ mint                        None                          ✘                             ✘                             ✘
    nickel                        ✘ nls                         None                          ✘                             ✘                             ✘
    nix                           ✘ rnix-lsp                    None                          ✘                             ✘                             ✘
    nu                            None                          None                          ✘                             ✘                             ✘
    ocaml                         ✘ ocamllsp                    None                          ✘                             ✘                             ✘
    ocaml-interface               ✘ ocamllsp                    None                          ✘                             ✘                             ✘
    odin                          None                          None                          ✘                             ✘                             ✘
    openscad                      ✘ openscad-language-server…   None                          ✘                             ✘                             ✘
    org                           None                          None                          ✘                             ✘                             ✘
    perl                          None                          None                          ✘                             ✘                             ✘
    php                           ✘ intelephense                None                          ✘                             ✘                             ✘
    prisma                        ✘ prisma-language-server      None                          ✘                             ✘                             ✘
    prolog                        ✘ swipl                       None                          ✘                             ✘                             ✘
    protobuf                      None                          None                          ✘                             ✘                             ✘
    python                        ✘ pylsp                       None                          ✘                             ✘                             ✘
    r                             ✘ R                           None                          ✘                             ✘                             ✘
    racket                        ✘ racket                      None                          ✘                             ✘                             ✘
    regex                         None                          None                          ✘                             ✘                             ✘
    rescript                      ✘ rescript-language-server…   None                          ✘                             ✘                             ✘
    rmarkdown                     ✘ R                           None                          ✘                             ✘                             ✘
    ron                           None                          None                          ✘                             ✘                             ✘
    ruby                          ✘ solargraph                  None                          ✘                             ✘                             ✘
    rust                          ✘ rust-analyzer               ✘ lldb-vscode                 ✘                             ✘                             ✘
    scala                         ✘ metals                      None                          ✘                             ✘                             ✘
    scheme                        None                          None                          ✘                             ✘                             ✘
    solidity                      ✘ solc                        None                          ✘                             ✘                             ✘
    sql                           None                          None                          ✘                             ✘                             ✘
    sshclientconfig               None                          None                          ✘                             ✘                             ✘
    starlark                      None                          None                          ✘                             ✘                             ✘
    svelte                        ✘ svelteserver                None                          ✘                             ✘                             ✘
    swift                         ✔ sourcekit-lsp               None                          ✘                             ✘                             ✘
    tablegen                      None                          None                          ✘                             ✘                             ✘
    tfvars                        ✘ terraform-ls                None                          ✘                             ✘                             ✘
    toml                          ✘ taplo                       None                          ✘                             ✘                             ✘
    tsq                           None                          None                          ✘                             ✘                             ✘
    tsx                           ✘ typescript-language-serv…   None                          ✘                             ✘                             ✘
    twig                          None                          None                          ✘                             ✘                             ✘
    typescript                    ✘ typescript-language-serv…   None                          ✘                             ✘                             ✘
    v                             ✘ vls                         None                          ✘                             ✘                             ✘
    vala                          ✘ vala-language-server        None                          ✘                             ✘                             ✘
    verilog                       ✘ svlangserver                None                          ✘                             ✘                             ✘
    vue                           ✘ vls                         None                          ✘                             ✘                             ✘
    wgsl                          ✘ wgsl_analyzer               None                          ✘                             ✘                             ✘
    yaml                          ✘ yaml-language-server        None                          ✘                             ✘                             ✘
    zig                           ✘ zls                         None                          ✘                             ✘                             ✘

And yes I did do a:

    brew install solargraph

and then a:

    cp /Users/sjohnson/helix/languages.toml ~/.config/helix/languages.toml

as per [this](https://github.com/helix-editor/helix/issues/340).  And then a 

    gem install --user-install solargraph

(which fails since I'm an RVM user) so then a:

    gem install solargraph

I was still left without syntax highlighting or code completion for Ruby.  Alas.

Actually I just figured it out.  Solargraph is an executable gem and when you run it like this:

    solargraph stdio

It runs as a LSP server which then Helix can use for autocomplete.  It still doesn't color code the syntax but the autocomplete options were slick as all get out.  Absolute Kudos here.

**NOTE**: I got this to work one time.  A second go around, I was entirely unable to make it work.

## Helix Weirdness

I tried to brew install helix as per the instructions.  This led to my needing to re-install XCode which still isn't done.  I got past it with a pure Rust install and then using Cargo.  

## Conclusion

### My Original Conclusion

I really, really, really wanted to make the shift away from TextMate 2 into something written in Rust.  I suspect I'll experiment with Lapce since it supports a mouse.  I'm deeply sorry that Helix didn't work out.  I could, maybe, make the transition to character mode editing if highlighting worked (and I'm sure with the right sorcery it would; I'm just too old to mess about any more).

Overall it is very early in the Rust editor space and what I use is frightfully mature -- crappy quality but damn mature.  I hope that in another year or so, I'll have better options.

### My Current Conclusion

I wrote this on a Friday morning in the fit of rage inspired by another horrific experience (I hate crashes).  On Saturday morning it showed up on Hacker News and someone who I didn't know (Hello and thank you again; I'm sorry I can't remember your handle) messaged me and say "Here's a Zed invite"'.  I just finished reviewing Zed and its awfully impressive.  I think enough of it that I'm going to try actually shifting my usage away from TextMate into Zed for next week (I'm also intrigued by Lapce but I think the next release is where I need to be).

Zed looks damn good.  

Update the Next Morning: I've now been using Zed as both a document and code editor.  Markdown support is good and it is quite functional as a document editor.  As a code editor, I'm missing auto complete and syntax highlighting but I'm surving and the overall experience is lovely.

## Notes: 

* Kibi is notable for being a clone of [Kilo](https://github.com/antirez/kilo) by [AntiRez](https://github.com/antirez); Kilo is one of the great current illustrative lessons in software engineering
* Zed is conceptual afaict - exists only on a web page; sounds great but absolutely NOT filling
* Zee explicitly doesn't load the [Ruby TreeSitter](https://github.com/tree-sitter/tree-sitter-ruby) grammar; for Ghu's sake Zee, Why?  It isn't like you have an anti-package philosophy like Pepper
* Zee is absolutely impressive.  Just watching the crates it uses as it compiles is like a laundry list of editor related goodness (yes I'm an editor wonk)