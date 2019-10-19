---
layout: post
title: Rails 6 and Markdown Rendering - An Abject Personal Failure
category: rails
tags: ["rails"]
---
**Note**: I am not bitching here about the quality of Rails, High Voltage or any of the Markdown gems.  This is all open source software and I am delighted to have the abundance of free tools available to me.  And, trust me, I know that when people bitch, they should put on their big boy pants and contribute a pull request back to fix things.  And, if I had been capable of fixing this, I would have.  Alas I failed at fixing this.

Since I am a software engineer, I am experienced at failure.  One of the absolutely soul diminishing aspects of being a software engineer that none of us talk about is that we **fail**.  We fail **a lot**.  Last night, for example, I spent about four hours in engaged in a soul crushing battle to get the High Voltage gem to work with Rails 6.

The [High Voltage gem](https://github.com/thoughtbot/high_voltage) is a gem that lets you put a series of pages like about, support, faq, etc in a directory and it injects into your application a "pseudo controller" that handles the display.  And then, if you aren't running Rails 6, you can add a markdown gem like [kramdown-rails](https://github.com/chrisroberts/kramdown-rails) and then have a directory of files like about.md, faq.md and have these be part of your application.  High voltage, along with a markdown gem, makes static pages an absolute delight.

And then came Rails 6.  I put an alpha release of a side project live last night and my buddy [Nick Janetakis](https://nickjanetakis.com/blog/) helpfully clicked on the Faq link only to get a 500 error.  "Oh yeah I commented, I've got an [issue](https://github.com/thoughtbot/high_voltage/issues/289) open on this".  I checked the issue and even tho I reported it 24 days ago, it was lying fallow.  

I figured, well, it is 2:30 in the morning and I had a craptacular night, why not dig into a complicated technical issue?  I mean how hard can this be -- it is just a pseudo controller, right?  Well that was the beginning of a multiple hour session of low level gem debugging complete with a full round of Tourette's style cursing that I'm not real proud of but at least no one else was around.  

Here are the branch names I created during this fiasco:

* markdown_bullshit_fucking_waste_of_time
* 294-anti-markdown
* 295-fuck-markdown-again

And here are some of the github issues I made:

* 295-fuck-markdown-again
* throw out fucking markdown insanity and rewrite pages into html erb

And I'd like to point out that no matter how pissed I got, I still followed good engineering practices:

* all code was always in a branch so I could always revert
* issues were created
* pull requests were used

Good engineering practices, when truly ingrained, when they are **habits**, carry you through bad experiences.  Thank you Sean Kennedy for beating this into my head.  Appreciated.

# Things I Learned, Debugging and Otherwise

Here are some of the things I learned:

When you are doing gem debugging on osx and using TextMate, it is really, really helpful to open the gem in question with:

    bundle show high_voltage
    mate /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/high_voltage-3.1.2 

This one, admittedly, I knew already but I always forget it when debugging gems.  This opens the gem in a TextMate window with the full file tree of the gem available so you can add byebug calls freely.

After you add a byebug call to a gem, you **have** to start and stop the development server.

Not a one of the different markdown gems or techniques worked:

* [https://github.com/chrisroberts/kramdown-rails](https://github.com/chrisroberts/kramdown-rails)
* [https://github.com/vmg/redcarpet](https://github.com/vmg/redcarpet)
* [https://github.com/ytbryan/emd](https://github.com/ytbryan/emd)
* [https://bloggie.io/@kinopyo/rails-render-markdown-views-and-partials](https://bloggie.io/@kinopyo/rails-render-markdown-views-and-partials)
* [https://stackoverflow.com/questions/4163560/how-can-i-automatically-render-partials-using-markdown-in-rails-3/10131299#10131299](https://stackoverflow.com/questions/4163560/how-can-i-automatically-render-partials-using-markdown-in-rails-3/10131299#10131299)
* 

Rails 6 changed the render template call from 1 parameter to two parameter and I suspect that's at the heart of this.

And there were a few other things I tried.  I got fairly close at the end but I kept getting Markdown issues and, ultimately, I felt it was wiser to just, well, **stop**.

# My Final Solution

I ended up using the techniques that [teamtreehouse](https://blog.teamtreehouse.com/static-pages-ruby-rails) advocated which amounted to:

* A simple pages controller
* A cool routing trick 

And to make it easier for me, I added a dynamic index template which handles giving me a list of all static pages so I can easily review them. This was a dead simple (and mildy crappy) view but at this point I was about dead on my feet and I just wanted it done.  Here's the view syntax:

```ruby
<h1>Index</h1>
<ul>
  <% Dir.entries(File.join(Rails.root, "app/views/pages")).sort.each do |file| %>
    <% next if file =~ /^_/%>
    <% next if file == 'index.html.erb'%>
    <% next if file == '.'%>
    <% next if file == '..'%>
    <% filename = File.basename(file, ".html.erb")%>
    <li><%=link_to(filename, "/pages/#{filename}")%>
  <% end %>
</ul>
```

This could obviously be quite a bit better but this is one of those features that you write solely for yourself.  It isn't linked to from anywhere on the site and the only one using it should be me or people on the project. 

# Conclusion

If you do this stuff long enough, you are bound to fail at things.  I mean a software engineer's entire day basically amounts to "try stuff over and over and stop when it starts working". And, if you are lucky, then you get to take the time to make it better and maybe improve it.  An embarrassingly large amount of the time that first working bit gets shipped.
