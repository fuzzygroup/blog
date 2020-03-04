---
layout: post
title: When to Use a Helper Method in Rails
category: rails
tags: ['rails', 'ruby', 'netlabeler']
---
One of the more interesting facilities in Rails *helpers* which reside in app/helpers/*.rb and are used, well, as helpers.  Helpers are basically display level execution of Ruby code.  I recently wrote what I thought was a great example of a helper so I thought I'd document it.  What I had was a object, stored in the database which had a bunch of data that I needed to display:

    the object, called a label
      A serialized hash called labeled_data
         label0 
         label1
         label2
         label3
         label4
         label5
         label6
         label7
         label8
         label9

What I wanted to do was transform this, at display time, to an HTML structure like this:

    <p>label0: <b>The Data for Label 0</b>
    <p>label1: <b>The Data for Label 0</b>

and, correctly, not show label2, etc if they were blank.  And, naturally, do the right thing when there was no data in the labeled_data hash, etc.  And while I could have done this with a view and code wrapped in evaluation / output tags:

    <% and %> or <%= or %>

it is dramatically cleaner to write this type of thing as a helper and then call it as a function like display_labeled_data(label).  Not only does this make the code much cleaner than evaluation / output tags, it also has the advantage of being testable.  Now all that said, here is the code:

```ruby
def display_labeled_data(label)
  return if label.labeled_data.nil?
  return if label.labeled_data.keys.nil?
  output = []
  label.labeled_data.keys.each do |key|
    output << "<p>"
    output << key
    output << ":"
    tmp = label.extracted_data[key]
    if tmp
      tmp = tmp.gsub(/\n/,'<br/>')
    end
    output << tmp
    output << "</p>"
  end
  output.join("\n").html_safe
end
```

The key idea here is:

* create an output object, in this case an array or []
* loop a data structure -- label.labeled_data.keys
* as you loop the data structure, put things into the output object like a paragraph tag, the name of the key i.e. "label0", a ':' 
* clean up the data by converting new lines to html line breaks
* add the data into the output element
* add a closing p tag
* add a line break onto every element of the output object (using join which acts like a map command) and then tell the Rails environment to NOT escape the output because it is known to be "html_safe"

This routine is then called in my display template like this:

    <%= display_labeled_data(@label) %>
    
on the show page for the labels controller.  See -- Rails helpers, easy peasy!

## Pro Tip - Helpers, like Rake Tasks, have a Global Namespace

And, in closing here's the pro tip:

* Helpers, like Rake tasks, are stored in different files
* This makes you think that a display_labeled_data method in, say, labels_helper.rb which is different from a method called display_labeled_data in say projects_helper.rb.
* Nope!  It is a global namespace

And that is why I simply put all my helpers into the project level application_helper.rb instead of into the controller level, automatically generated helpers -- it helps me always remember that helpers share a global namespace.  And keep in mind that methods defined in rake tasks also share a global namespace.

Oh and did I mention that when you have multiple versions of the same method, which one gets called is often random because it depends on compilation order which is tied to filesystem return order on lists of all files with a .rb extension ...

**Note**: The global namespace thing on Rake tasks can be particularly tricky when you a Ruby gem which injects Rake tasks into your project behind the scenes.  This one time, I had a one day contractor who checked in a Rake task with a method named **run**.  And that was just fine until 9 months later when we switched our deployment method from Capistrano to Vlad and Vlad, at least at that time, had a method internal to its Rake task called **run**.  Chasing that one down literally gave me some gray hairs.  Ah, happy, happy joy joy!