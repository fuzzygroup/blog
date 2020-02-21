---
layout: post
title: Great Rust Libraries / Tools
category: rust
tags: ["rust"]
---
{:.center}
![IMG_1986.jpeg](/blog/assets/IMG_1986.jpeg)

I don't often do the dance with new languages.  I suspect you could view my approach to languages as monogamy -- I've been in a long term, monogamous relationship with Ruby now since 2007.  But 12 years is a long time and deciding to dance with Python this past fall was perhaps my break through event away from "language monogamy".  I'm now happily dating other languages and the latest one to turn my head is [Rust](https://www.rust-lang.org/).  

I've been very impressed with the quality of the core tooling around Rust and here are some of those tools:

* [https://github.com/IntrepidPig/orca](https://github.com/IntrepidPig/orca) -- Reddit client library
* [https://github.com/BurntSushi/aho-corasick](https://github.com/BurntSushi/aho-corasick) -- String / Substring matcher
* [https://crates.io/crates/kafka](https://github.com/BurntSushi/aho-corasick) -- Kafka client
* [https://github.com/notify-rs/notify](https://github.com/notify-rs/notify) -- Filesystem watcher; this is what drew me to using Rust; I have a high performance application where I'm virtually certain Ruby is going to fall over and die.  Rust gives me an alternative.
* [https://github.com/francesca64/hotwatch](https://github.com/francesca64/hotwatch) - make notify easier to use
* [http://eradman.com/entrproject/](http://eradman.com/entrproject/)  -- A filesystem watcher built on top of Rust; possible alternative.
* [https://github.com/watchexec/watchexec](http://eradman.com/entrproject/) -- Another filesystem watcher built on top of Rust; possible alternative.
* [https://github.com/spacejam/sled](https://github.com/spacejam/sled) -- An embedded database built in Rust

One of the reasons you use Rust is performance and the metrics on Sled are pretty impressive:

* over a billion operations in under a minute at 95% read 5% writes on 16 cores on a small dataset
* a crash-safe monotonic ID generator capable of generating 75-125 million unique ID's per second

## Sources / Things to Read

* [Getting Started with Rust](https://www.rust-lang.org/learn/get-started)
* [Rust and Ruby](https://blog.codeship.com/coming-rust-ruby/)
* [Rust and Kafka](https://www.confluent.io/blog/getting-started-with-rust-and-kafka/)
* [Rust File Watcher](https://www.reddit.com/r/rust/comments/57ybqa/watchexec_rustbased_file_watcher_for_os_x_linux/)
* [Textmate 2 and Rust](https://github.com/carols10cents/rust.tmbundle)
* [Rust Package Index](https://crates.io/)


