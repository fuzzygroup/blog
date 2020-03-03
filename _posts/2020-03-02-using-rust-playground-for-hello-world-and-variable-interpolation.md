---
layout: post
title: Using Rust Playground for Hello World and Variable Interpolation
category: rust
tags: ["rust", "variables"]
---
{:.center}
![IMG_1313.jpg](/blog/assets/IMG_1313.jpg)

{:.center}
[Artwork by my friend Autumn Mott; Hopefully I can find a better link to put here](https://www.facebook.com/autumnmottart)

It is a Monday and what better way to start your 6 am Monday morning then learning some of the elements of a new language -- Rust.

I started by adding a link in my Browser toolbar to the Rust Playground which amounts to a web based REPL (Read Evaluate Print Loop) for Rust where you can type in Rust code and run it.  Yes I know it really isn't a REPL because Rust is a compiled language not an interpreted one but it functions well enough as a REPL that I can wrap my Ruby tinged mind around it.  

Here's the Hello World program that automatically appears in the Rust playground

```rust
fn main() {
    println!("Hello, world!");
}
```

The output of this is:

    Hello, world!

That's pretty easy to understand:

* A main function defined with fn
* A print line function defined with a ! (my previous Rust reading tells me that's a macro indicator)
* { and } to denote structure
* A ; to denote the end of lines

I wanted to make a simple change to experiment with the use of variables so I added a main2() function and called it from main():

```rust
fn main() {
    println!("Hello, world!");
    main2();
}

fn main2() {
    let x = 5;
    println!("The value of x is: {}", x);
    let y = 6;
    println!("The value of y is: {}", y);
}
```

The output of this is:

    Hello, world!
    The value of x is: 5
    The value of y is: 6


You can see that the **let** keyword assigns a variable and that {} binds a variable into a string (which is generally called interpolation). 

Note: Variables quickly bring you in to the heart of Rust -- [immutability](https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html) -- and here there by dragons that hopefully come up tomorrow after some reading.

## Link

Here's a [permanent link](https://play.rust-lang.org/?version=stable&mode=debug&edition=2018&gist=496e2617d024958faf48d84553bd8cf1) to this if you want to try it out.

## What about Repl.it?

Another way to have a web based REPL for Rust is [Repl.it](https;//www.repl.it).  And while I like the concept of repl.it, they have eliminated any privacy without a paid account: Upgrade your account for private repls.  This appears on the bottom of every new REPL you create and at $74 / 12 months that feels [expensive](https://repl.it/site/pricing) simply for the basics of privacy.
