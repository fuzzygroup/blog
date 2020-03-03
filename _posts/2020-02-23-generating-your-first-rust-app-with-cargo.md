---
layout: post
title: Generating Your First Rust App with Cargo
category: rust
tags: ["rust", "docs"]
---
{:.center}
![IMG_0833.jpeg](/blog/assets/IMG_0833.jpeg)

The Rust tool cargo is the Rust equivalent of rake and bundler and rails combined (these are Ruby tools).  Cargo is what you use to generate a new Rust app.  Here's an example:

    cargo new loader_datastreamer_to_kafka_rust
    
This generates a new, correctly laid out project directory.  And here's what it looks like:

    ❯ tree
    .
    ├── Cargo.toml
    └── src
        └── main.rs

    1 directory, 2 files
    
The Cargo.toml file is a package manifest which has a default contents of this:

    ❯ cat Cargo.toml
    [package]
    name = "loader_datastreamer_to_kafka_rust1"
    version = "0.1.0"
    authors = ["Scott Johnson <blahblah@gmail.com>"]
    edition = "2018"

    # See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

    [dependencies]
    
Any Rust packages, which are named **crates**, you use in your application would be listed under the dependencies section.  Here's an example of that:

    [dependencies]
    notify = "4.0.15"

That's an example of using the [notify crate](https://crates.io/crates/notify).

Your default main.rs file is always stored in src and looks like this initially:

    ❯ cat src/main.rs
    fn main() {
        println!("Hello, world!");
    }

Yep -- you get a Hello World for free when you create any Rust application.  

Cargo actually does quite a bit more than just creating your Rust application but that's a topic for another day.

