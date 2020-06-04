---
layout: post
title: Simple Rust Programming 01 - Checking The Existence of a Directory
category: rust
tags: ["rust"]
---
{:.center}
![IMG_2284.jpeg](/blog/assets/IMG_2284.jpeg)

So I'm at the very early learning stage of Rust, that stage where almost nothing you type in works.  And this, for me, usually means "make the learning stick by writing it down".  So here goes ...

Note: I wrote this code using the [Rust playground](https://play.rust-lang.org/), a web based repl, which was invaluable.  

## A Simple Program for Testing the Existence of a Directory

I'm going to start with an assumption that I need to get the location of my input based on the type of the machine: either a Mac or a Linux box.  Given that we know that a user's home directory exists in /home on Linux and /Users on Mac, this gives us an easy way to differentiate the two. 

### Pass 1: Problems with Scopes

```rust
use std::path::Path;

fn main() {
    if path_exists("/home") { 
      let environment = "unix";
    } 
    else {
      let environment = "other";
    }
    println!("{}", environment);
}

fn path_exists(path: &str) -> bool {
  if Path::new(path).is_dir() { 
    return true;
  } 
  else {
    return false
  }
}
```

This program has a core problem - the environment variable isn't in scope:

      Compiling playground v0.0.1 (/playground)
    error[E0425]: cannot find value `environment` in this scope
      --> src/main.rs:11:20
       |
    11 |     println!("{}", environment);
       |                    ^^^^^^^^^^^ not found in this scope
    

The implication of this is that code within { } braces is a true local block and thus out of scope with what came  before.  The Ruby work around for something like this is to have an outer variable that "shadows" the name of the variable within the block and thus allows its value to pass out.  Unfortunately Rust identifies that technique as a bug since the outer variable is never read.  My refactor on this is to write a function which returns this.

### Pass 2: Problems with Return Types

Here was my first pass at moving environment fetching into a function of its own.  I got tired of typing environment so I moved to calling it my_env.  

```rust
use std::path::Path;

fn main() {
    let my_env = get_env();
    println!("{}", my_env);
}

fn get_env() {
    if path_exists("/home") { 
      return "unix";
    } 
    else {
      return "other";
    }
}

fn path_exists(path: &str) -> bool {
  if Path::new(path).is_dir() { 
    return true;
  } 
  else {
    return false
  }
}
```

Here are the errors we have:

     Compiling playground v0.0.1 (/playground)
    error[E0277]: `()` doesn't implement `std::fmt::Display`
     --> src/main.rs:5:20
      |
    5 |     println!("{}", my_env);
      |                    ^^^^^^ `()` cannot be formatted with the default formatter
      |
      = help: the trait `std::fmt::Display` is not implemented for `()`
      = note: in format strings you may be able to use `{:?}` (or {:#?} for pretty-print) instead
      = note: required by `std::fmt::Display::fmt`
      = note: this error originates in a macro (in Nightly builds, run with -Z macro-backtrace for more info)

    error[E0308]: mismatched types
      --> src/main.rs:10:14
       |
    8  | fn get_env() {
       |              - help: try adding a return type: `-> &'static str`
    9  |     if path_exists("/home") { 
    10 |       return "unix";
       |              ^^^^^^ expected `()`, found `&str`

    error: aborting due to 2 previous errors

    Some errors have detailed explanations: E0277, E0308.
    For more information about an error, try `rustc --explain E0277`.
    error: could not compile `playground`.

    To learn more, run the command again with --verbose.

### Pass 3: Working

The solution to the above was to add a return type or this odd bit of syntax:

    fn get_env() -> &'static str

Apparently the bit following the () identifies the return value of the function as a statically allocated string.  This is syntactically similar to the:

     -> bool
     
but the single quote really threw me.

```rust
use std::path::Path;

fn main() {
    let my_env = get_env();
    println!("{}", my_env);
}

fn get_env() -> &'static str {
    if path_exists("/home") { 
      return "unix";
    } 
    else {
      return "other";
    }
}

fn path_exists(path: &str) -> bool {
  if Path::new(path).is_dir() { 
    return true;
  } 
  else {
    return false
  }
}
```

## The Learnings

Here are bullet points for what we learned from writing these 24 lines of code:

* The let keyword defines a variable.
* To insert a variable into string output you use {} inside quotes followed by the name of the variable
* If you are going to return something from a function you need to return its type as well
* Variables set within { } are local to the { }