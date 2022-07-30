---
layout: post
title: A Bootstrap 4 Two Column Example that Just Works
category: bootstrap
tags: ["boostrap", "css"]
---
{% pizzaforukraine  %}

I remain, alas, CSS Challenged.  I'm from an era where the height of HTML layout was tables and once upon a time I know all the tricks including images in the corners for that rounded corner effect.  But, as is all too often in technology, the tricks that once served you well -- don't.  

Now we exist in a whole new world for layout i.e. CSS and for me that means [bootstrap introduction](https://getbootstrap.com/docs/4.0/getting-started/introduction/) or [bootstrap main page](https://getbootstrap.com/).  Bootstrap isn't perfect but I fully respect what it tries to do and the simple fact that, imho, Bootstrap made the Internet **better**.  So when I want to make two columns and I naturally reach for a table tag, I need to come look this example up from [CodePen](https://codepen.io/SitePoint/pen/WMYOxb)

    <div class="container">
      <div class="row header">
        <div class="col-xs-12 text-center">
          <h1>Bootstrap 4 2-Column Layout </h1>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6 first-column">
          <p>This column takes the full height as its sibling column thanks to Flexbox</p>
        </div>
        <div class="col-sm-6 second-column">
          <p>
            Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum 
          </p>
        </div> 
      </div>
      <div class="row">
      </div>
    </div>
    
And I'm not pretending that this is hard or not but the shift from tables to a css grid isn't exactly simple (or at least it isn't for me).  

I'm noting this particular example because I've tried several and this one just worked right out of the box.  The others should have -- and maybe it was just my ham fisted approach -- but this one did.  Recommended. 