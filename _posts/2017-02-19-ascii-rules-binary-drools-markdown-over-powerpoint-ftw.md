---
layout: post
title: ASCII Rules; Binary Drools - Markdown Over PowerPoint FTW
category: software_engineering
tags: ["markdown", "writing", "udemy", "deckset", "software_engineering", "knowledge_capture"]
---
When an engineer leaves an organization there is a vital need to capture knowledge from that engineer.  In short that engineer needs to give a presentation or presentations.  And if they've been there a long time, say 7 years or so, capturing that amount of knowledge is damn near impossible.  Or so I would have thought.  Over the past 48 hours I have authored over 243 slides organized into 22 presentations outlining my knowledge on a project that I am transitioning out of.  Yeah -- the 7 years is me.  

My secret weapon for this was actually MarkDown.  Here's what I did:

* Buy a copy of [DeckSet](http://www.decksetapp.com/) or use [MARP](https://github.com/yhatt/marp)
* Write your slides in a limited subset of markdown where --- delimits a slide and ## is a slide title
* Write in your programming editor
* Present with DeskSet or MARP (MARP doesn't really have a presentation mode but it works kind of ok and is cross platform)
* Use [ScreenFlow](http://www.telestream.net/screenflow/overview.htm) to record your screen
* Pray hard that you have a brilliant friend like [Nick Janetakis](https://nickjanetakis.com/) who knows how to set your audio options correctly so your voice doesn't sound horrible and then thank him profusely for listening to 4 different versions of audio until it was just right while he tells you exactly what you need to adjust.  Or you could just buy his Docker courses(https://nickjanetakis.com/products/); I did and they are awesome.

Seriously - 265 slides in 48 hours.  There is no way I could have done that with PowerPoint.  Being able to work in my code editor and focus on pure content made all the difference.

Note: I used to build corporate enterprise knowledge management systems back in the 90s and sold them to clients like the U.S. Navy, etc.  This, with about $130 of software, was a better knowledge capture solution than what we used to ship for about $250,000 / installation.  My how the world has changed.

Oh and when you are working in a pure ASCII medium you can manipulate your data in bulk like this script (below) which compiled a full table of contents and did a slide count.  Yeah its not elegant but I wrote it in about 10 minutes.

```ruby
directories = Dir.glob("*")

slide_ctr = 0
outline_entries = []

directories.each do |directory|
  if directory =~ /^[0-9]/
    filename = File.join(directory, "notes.md")
    next if !File.exists?(filename)
    markdown_content = File.readlines(File.join(directory, "notes.md"))
    outline_entries << filename
    markdown_content.each do |markdown|
      if markdown =~ /^##/
        outline_entries << "  #{markdown}"
        slide_ctr = slide_ctr + 1
      end
    end
  end
end

outline_entries.each do |outline_entry|
  puts outline_entry
end

puts "Total slides: #{slide_ctr}"
```

Thank you [John Gruber](http://daringfireball.net/) for MarkDown.  Thank you, Thank you, Thank you, Thank you!