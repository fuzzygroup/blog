---
layout: post
title: Your Basic Rust Workflow For the Noobie Rustacean
category: rust
tags: ["rust"]
---
{:.center}
![IMG_3270.jpeg](/blog/assets/IMG_3270.jpeg)

**Note 1**: The term Rustacean is the term for a [developer who uses Rust](https://rustacean.net/).  

Learning a new language isn't just syntax and keywords, it is tooling, people in the ecosystem to trust and follow, workflows and more.  For a particular project at my day job, I've hit the limits of Python and Ruby in terms of performance so I'm looking into Rust (the other suggested alternative is Elixir and that's tempting but Rust "feels" like a better match).

**Note  2**: The underlying need is for high performance (think C like performance) file processing.  I'm a firm believer in the power of languages and it is hard for me to conceive of starting a new project in 2020 in terms of C.  Hence the choice of Rust.  Go is theoretically another choice but Go's "Nanny State" approach to dependencies I find to be an extraordinary turn off.

Here is the basic workflow for a noobie Rust developer:

**Note 3**: The project I'm creating is called "datastreamer_to_sqs".

1. Create a new project with: **cargo new datastreamer_to_sqs**
2. Change into the directory: **cd datastreamer_to_sqs**
3. Edit the main.rs file: **vi src/main.rs**
4. Edit the dependencies file: **vi Cargo.toml** and add any crates (crates are Gems in the Ruby ecosystem and modules in the Python ecosystem)
4. Build it: **cargo build**
5. Run it: **cargo run**

## What a Rust Project's Filesystem Looks Like

I'm a big believer in understanding how your tooling looks under the hood (such a big believer that I have a [52 minute Youtube lecture on your Rails directory structure](https://www.youtube.com/watch?v=ZfgFKieFWgQ&t=12s)).  Here is what your initial Rust project looks like:

    tree -d
    .
    ├── src
    └── target
        └── debug
            ├── build
            │   ├── bitflags-5286617fe4cbd497
            │   │   └── build_script_build-5286617fe4cbd497.dSYM
            │   │       └── Contents
            │   │           └── Resources
            │   │               └── DWARF
            │   ├── bitflags-6c9ee2bffe990008
            │   │   └── out
            │   ├── libc-a4b511fa588bdb61
            │   │   └── build_script_build-a4b511fa588bdb61.dSYM
            │   │       └── Contents
            │   │           └── Resources
            │   │               └── DWARF
            │   ├── libc-efb0751362c01003
            │   │   └── out
            │   ├── ryu-7d41145565b2c286
            │   │   └── build_script_build-7d41145565b2c286.dSYM
            │   │       └── Contents
            │   │           └── Resources
            │   │               └── DWARF
            │   ├── ryu-fb8024d4dae56f97
            │   │   └── out
            │   ├── serde-0a56bc622e5e711b
            │   │   └── out
            │   └── serde-cbedf66c03524f7e
            │       └── build_script_build-cbedf66c03524f7e.dSYM
            │           └── Contents
            │               └── Resources
            │                   └── DWARF
            ├── datastreamer_to_sqs.dSYM -> deps/datastreamer_to_sqs-a3353696ddf372df.dSYM
            ├── deps
            │   ├── datastreamer_to_sqs-6936248b823719d4.dSYM
            │   │   └── Contents
            │   │       └── Resources
            │   │           └── DWARF
            │   └── datastreamer_to_sqs-a3353696ddf372df.dSYM
            │       └── Contents
            │           └── Resources
            │               └── DWARF
            ├── examples
            └── incremental
                ├── datastreamer_to_sqs-2czos8oun4ynx
                │   ├── s-fn6jki8f4t-127088i-1mwkjufnu9gix
                │   └── s-fn6k88njhj-1u0uvuo-working
                └── datastreamer_to_sqs-qs761qw9768j
                    └── s-fn6dhpfqbo-s6bz9f-248f3hvpx7dsy

    49 directories

## References

* [Dependencies / Cargo.toml](https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html)
* [Installing Binaries](https://doc.rust-lang.org/1.27.2/book/second-edition/ch14-04-installing-binaries.html)



