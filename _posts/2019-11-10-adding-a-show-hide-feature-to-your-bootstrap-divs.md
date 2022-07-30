---
layout: post
title: Adding a Show / Hide Feature to Your Bootstrap 4 Divs
category: bootstrap
tags: ["bootstrap", "html", "css"]
---
{% pizzaforukraine  %}

I know this is simple but I am JavaScript / CSS challenged so I'm writing it down because I've had continuous problems with it in the past and I know that this solution works for Bootstrap 4. 

Let's say that you have a div that you want hidden and only displayed by a button when you click it.  Here's the solution:

```html
<a href="#feeds" class="btn btn-default" data-toggle="collapse">Toggle Feeds</a>
<div id="feeds" class="collapse">
    This div (feeds) is hidden by default.
</div>
```

Here's how this works:

1.  Add a div named *feeds* around the content you want hidden.  This needs to have a class named *collapse* added to it because its default display state is collapsed.
2. Add an A tag with an href of "#feeds"  above the content and a data-toggle named *collapse*.
3. When the user clicks the A tag then the a tag's data-toggle will be applied to the matching div.

Thank you to this [Stack Overflow post](https://stackoverflow.com/questions/23873005/hide-div-by-default-and-show-it-on-click-with-bootstrap).
