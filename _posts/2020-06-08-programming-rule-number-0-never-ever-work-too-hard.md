---
layout: post
title: Programming Rule Number 0 - Never, Ever Work too Hard
category: ruby
tags: ["programming", "ruby"]
---
{:.center}
![IMG_3941.jpeg](/blog/assets/IMG_3941.jpeg)

One of the better lessons that you learn as a programmer is that you never want to work too large, in short, that laziness can be a virtue.  I'm speaking, of course, of doing things manually that you can automate.  I recently wanted to download a set of images from github that represented anonymous animals.  Here's the repo:

    [https://github.com/wayou/anonymous-animals/tree/master/icons](https://github.com/wayou/anonymous-animals/tree/master/icons)

What I needed to automate downloading these was two things:

* A set of filenames
* A means to iterate them and fetch the data

The set of filenames I got just by copying text from the github page and using a text editor macro to reduce it to a set of filenames that %w could easily make into an array.  Here's the code for that:

```ruby
  def self.animals
    anims = %w(
    Alligator.png
    Anteater.png
    Armadillo.png
    Auroch.png
    Axolotl.png
    Badger.png)
  end
```

My routine to download these looks like this:

```ruby
  def self.wgets
    AnonAnimalCommon.animals.each do |animal|
      `cd /Users/sjohnson/Sync/coding/rails/wipmarks/app/assets/images && wget wget https://raw.githubusercontent.com/wayou/anonymous-animals/master/icons/#{animal}`
    end
  end
```

My final step was to call this routine from the Rails console (the entire class is called AnonAnimal):

```ruby
AnonAnimal.wgets
```

Downloading all of these manually would have been likely about a half hour.  Writing this code took maybe 10 minutes.  Laziness for the win!