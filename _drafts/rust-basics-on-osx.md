---
layout: post
title: Rust Basics On OSX
---


   Compiling percent-encoding v2.1.0
error: `core::slice::<impl [T]>::len` is not yet stable as a const fn
   --> /Users/sjohnson/.cargo/registry/src/github.com-1ecc6299db9ec823/bytes-0.5.3/src/bytes.rs:121:18
    |
121 |             len: bytes.len(),
    |                  ^^^^^^^^^^^
    |
    = help: add `#![feature(const_slice_len)]` to the crate attributes to enable

   Compiling pin-project-lite v0.1.2
   Compiling vec_map v0.8.1
error: aborting due to previous error

error: Could not compile `bytes`.
warning: build failed, waiting for other jobs to finish...
error: failed to compile `what v0.5.1`, intermediate artifacts can be found at `/var/folders/76/mqchlgzs6x5cv2f11jh3jkjw0000gn/T/cargo-installhiDCX7`

Caused by:
  build failed

~ via ⬢ v12.8.1 via 💎 v2.3.1 on ☁️  us-west-2 took 46s
❯ rust --version
zsh: command not found: rust

~ via ⬢ v12.8.1 via 💎 v2.3.1 on ☁️  us-west-2
❯ cargo --version --verbose
cargo 1.39.0-nightly (3f700ec43 2019-08-19)
release: 1.39.0
commit-hash: 3f700ec43ce72305eb5315cfc710681f3469d4b4
commit-date: 2019-08-19

~ via ⬢ v12.8.1 via 💎 v2.3.1 on ☁️  us-west-2
❯ rustc --version
rustc 1.39.0-nightly (9b91b9c10 2019-08-26)

~ via ⬢ v12.8.1 via 💎 v2.3.1 on ☁️  us-west-2
❯ history | grep cargo
   69  git commit -m "Start to remove cargo culted functionality from metric.rb"
  780  brew install cargo
  786  cargo
  787  cargo install nushell
  789  source $HOME/.cargo/env
  804  cargo install nu
10489  cargo install what
10519  cargo install what
11620* cargo install broot
11638  cargo install what
11641  cargo install what
11643  cargo install what
11645  cargo --version --verbose
11649* history | grep cargo
