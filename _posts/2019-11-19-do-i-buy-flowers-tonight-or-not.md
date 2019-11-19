---
layout: post
title: Do I Buy My Wife Flowers Tonight or Not
category: relationships
tags: ["relationships"]
---
{:.center}
![IMG_9420a.jpeg](/blog/assets/IMG_9420a.jpeg)

Like a lot of software developers, I can be pretty forgetful at times.  If you're in the industry, you know how it goes:

* You start working on a project and it is February
* You look up and ... it is May and 
* You don't remember all that much of your life between

A good friend of mine refers to this as falling down a code hole (Thank you Mister Mott) and it really is a thing.  Some people's code holes are a few days long.  Other people's code holes can, in the case of a death march, last for months.

A bunch of years ago, I came out of a code hole and realized that I couldn't remember when I had last bought my wife flowers (if your wife doesn't like flowers then substitute chocolates, wine, etc).  Any husband worth his salt knows what I mean -- that little treat that says to the person you love that you remember their existence and they matter.  I regard that for my personal relationships, buying a woman flowers unexpectedly as akin to lubrication on a mechanical device; something that makes the underlying machine work better. Call if "relationship lubrication" if you will.

After realizing this, I thought about how I could solve it -- in a **natural** fashion.  I didn't want to put it on a calendar; I didn't want it to be regular so I realized that I could tie it to:

* Something I did regularly
* Make it quasi random

Since I've an old school Unix guy (originally SunOS back in '89 on a Sun 3 running Qunitus Prolog), what I did was tie this to my shell startup routine:

* For non computer folks, a "shell" is a program you use to interface directly with the machine
* A startup routine is a script which runs when the shell starts up
* As a heavy terminal user, I open a shell 10 or 20 times a day so, over time, I adjusted the probabilities to reflect that.

What I did was write a "throw of the dice routine" that randomly tells me whether or not to buy flowers.  This can be as complex as you want it to be. I made the example below a little complex and tied in a "on her birthday" routine just in case.

Here's what this looks like when the throw of the dice doesn't succeed:

{:.center}
![flowers_no.png](/blog/assets/flowers_no.png)

Here's what this looks like when it does succeed:

{:.center}
![flowers_yes.png](/blog/assets/flowers_yes.png)

Here's the code:

```ruby
#!/Users/sjohnson/.rvm/rubies/ruby-2.3.1/bin/ruby
require 'date'

things_to_buy = ['flowers', 'wine', 'chocolates', 'card']

# raise this if you want to buy things less often; lower it for more
improbability_constant = 5

birthday = Date.new(1968,9,11)

improbability_constant.times do
  things_to_buy << nil
end

thing_to_buy = things_to_buy.sample

if thing_to_buy
  puts "You should buy #{thing_to_buy}"
elsif Date.today.month == birthday.month && Date.today == birthday.year
  puts "Doofus - it is her birthday; buy at least: #{thing_to_buy.compact.join(',')}"
end
```

I call this from ~/.zshrc just by calling the ruby script directly.  The same trick works in ~/.bashrc.

I should admit that a lot of times when this said "Buy Flowers", I actually didn't -- life can be messy and complex and I never intended it directly drive my behavior. What it did do, however, was make me much more aware of the need for this.

**Note 1**: I haven't needed this now for a lot of years so below is a quick reproduction designed to select between flowers, wine, chocolates and a card.  Once I ran it for enough years, I internalized this type of activity as a habit.  And then I moved laptops one year and realized "Heh.  I changed!".

**Note 2**: I told my wife about this a few weeks ago and she laughed.  Oh gosh did she laugh ...

**Note 3**: While my personal relationship involves a wife and husband, this tool can work regardless of the gender or configuration of your relationship.

