---
layout: post
title: Using Simple Form for Rails without a Model
category: rails
tags: ["rails", "forms", "simple_form"]
---
Like a lot of Rails users, I use the Simple Form gem pretty devotedly -- I don't think I've used the native form_for now in the past few years.  The Simple Form gem has a bunch of advantages, notably bootstrap support for making your forms look good *easily*.  The one gotcha with Simple Form is that it is a mapper over the top of the native form_for construct which means that it is **inherently tied** to a model -- or that's at least what I used to think.

Yesterday I was programming up a form using the older form_tag structure and it honestly, truly looked horrible so I found myself longing for the bootstrap support of Simple Form.  A quick google, however, happily led me to [this Stack Overflow answer](https://stackoverflow.com/questions/9342277/does-form-tag-work-with-simple-form) on Simple Form without models.

The controller I was building was called SeoCompares and here's the form that I constructed using SimpleForm:

    <%= simple_form_for :seo_compares, { url: "/seo_compares/new/", method: :get } do |f| %>
      <%= f.hidden_field :id, value: "foo"%>

      <% current_user.courses.each do |course| %>
        <li><%= check_box_tag("my_courses[]", course.id)%>
      <% end %>

      <%= f.submit "Compare", class: 'btn btn-primary btn-lg', style: "text-center"%>
    <% end %>
    
There are three techniques here that are of note:

* Specifying the destination form action with url: and the method (:get) allows us to get past Simple Form's inherent object ties; this is the core technique you need.
* Because this is a **new** action and the controller is restful, there is an implied id attribute and I'm stubbing past that with :id as a hidden_field.
* I made a choice to use the older check_box_tag instead of f.check_box because I find the array handling of check_box_tag for multi selects to be easier to understand.  The ability to intermix the older _tag form tools with form_for's newer f. tools can actually make form operations pretty convenient.
