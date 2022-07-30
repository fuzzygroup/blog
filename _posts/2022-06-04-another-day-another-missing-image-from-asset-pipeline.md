---
layout: post
title: Another Day, Another Missing Image from Asset Pipeline
date: 2022-06-04 05:21 -0400
category: rails
tags: ["rails", "asset_pipeline"]
---
{% pizzaforukraine  %}

The asset pipeline is the component of Rails that I, well, let me quote myself from a recent email:

> I've been tracking down that crazy image related issue for an age now and I think I just got it.  Every single time it is always the damn asset pipeline (this is the one component in Rails that I have a literal deep and abiding hatred for; it is finicky code and instead of sticking with a solution they keep replacing it which I have the deep suspicion means that the heisenbugs keep migrating).

I hit this again recently with this kind of crap:

    I, [2022-06-04T09:11:21.177736 #7055]  INFO -- : [b4a4b65f-beb6-437b-b465-8cdf93a3b00d]   Rendering errors/error_500.html.erb within layouts/application
    I, [2022-06-04T09:11:21.177896 #7055]  INFO -- : [b4a4b65f-beb6-437b-b465-8cdf93a3b00d]   Rendered errors/error_500.html.erb within layouts/application (Duration: 0.0ms | Allocations: 5)
    I, [2022-06-04T09:11:21.179045 #7055]  INFO -- : [b4a4b65f-beb6-437b-b465-8cdf93a3b00d]   Rendered layouts/_meta_tags.html.erb (Duration: 0.1ms | Allocations: 11)
    I, [2022-06-04T09:11:21.179779 #7055]  INFO -- : [b4a4b65f-beb6-437b-b465-8cdf93a3b00d]   Rendered layouts/_header.html.erb (Duration: 0.4ms | Allocations: 119)
    I, [2022-06-04T09:11:21.180298 #7055]  INFO -- : [b4a4b65f-beb6-437b-b465-8cdf93a3b00d]   Rendered layouts/_footer.html.erb (Duration: 0.1ms | Allocations: 27)
    I, [2022-06-04T09:11:21.180679 #7055]  INFO -- : [b4a4b65f-beb6-437b-b465-8cdf93a3b00d] Completed 500 Internal Server Error in 8ms (Views: 3.2ms | Allocations: 2093)
    I, [2022-06-04T09:16:21.177692 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6] Started HEAD "/" for 208.115.199.28 at 2022-06-04 09:16:21 +0000
    I, [2022-06-04T09:16:21.178505 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6] Processing by HomeController#index as HTML
    I, [2022-06-04T09:16:21.179534 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendering home/index.html.erb within layouts/application
    I, [2022-06-04T09:16:21.179763 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendered home/_jumbotron.html.erb (Duration: 0.0ms | Allocations: 7)
    I, [2022-06-04T09:16:21.180168 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendered home/_intro.html.erb (Duration: 0.2ms | Allocations: 32)
    I, [2022-06-04T09:16:21.180481 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendered home/_paypal_donate_final.html.erb (Duration: 0.1ms | Allocations: 6)
    I, [2022-06-04T09:16:21.180820 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendered thanks/_thanks_10.html.erb (Duration: 0.1ms | Allocations: 6)
    I, [2022-06-04T09:16:21.181155 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendered home/_thanks.html.erb (Duration: 0.5ms | Allocations: 130)
    I, [2022-06-04T09:16:21.181886 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendered home/_images2.html.erb (Duration: 0.4ms | Allocations: 148)
    I, [2022-06-04T09:16:21.182121 #7055]  INFO -- : [bde57e27-882b-44ff-922c-a74f218bd4e6]   Rendered home/index.html.erb within layouts/application (Duration: 2.5ms | Allocations: 773)
    E, [2022-06-04T09:16:21.182379 #7055] ERROR -- : [bde57e27-882b-44ff-922c-a74f218bd4e6] Rendering 500 with exception: #<ActionView::Template::Error: The asset "285385998_128981183132811_252806448
    895874059_n.jpeg" is not present in the asset pipeline.

This one image -- *4059_n.jpeg refuses to render.  But:

    ls -l /home/deploy/PIZZAFORUKRAINE/releases/20220604085553/app/assets/images/*4059_n*
    -rw-rw-r-- 1 deploy deploy 764353 Jun  4 08:55 /home/deploy/PIZZAFORUKRAINE/releases/20220604085553/app/assets/images/285385998_128981183132811_252806448895874059_n.jpeg

so it is present.  And it is actually a jpeg image:

    file /home/deploy/PIZZAFORUKRAINE/releases/20220604085553/app/assets/images/*4059_n*
    /home/deploy/PIZZAFORUKRAINE/releases/20220604085553/app/assets/images/285385998_128981183132811_252806448895874059_n.jpeg: JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, baseline, precision 8, 2048x1365, frames 3

And it is referenced EXACTLY the same way as all other images:

```ruby
# don't judge me; no cms; no cloud storage; just simple deployment
def index
  @images = []
  @images << "285385998_128981183132811_252806448895874059_n.jpeg"
  @images << "284957118_128981213132808_7721233249568534083_n.jpeg"
  @images << "285811112_128981256466137_6541637073014697215_n.jpeg"
  @images << "285157808_128620399835556_4520671403161856263_n.jpeg"
end
```

and

```ruby
<div class="row">
<% @images.each do |image| %>
  <div class="col-md-4">
    <div class="thumbnail">
			<%= link_to(image_tag(image, style: "width: 50%"), "images?id=#{image}")%>
    </div>
  </div>
<% end %>
</div>
```

And the damn image file exists in as the output of the asset compiler:

     ls -l /home/deploy/PIZZAFORUKRAINE/releases/20220604085553/public/assets/*4059*
    -rw-rw-r-- 1 deploy deploy 764353 Jun  4 09:08 /home/deploy/PIZZAFORUKRAINE/releases/20220604085553/public/assets/285385998_128981183132811_252806448895874059_n-17c6a2082fe0e4da00de003c9350260905fa36412917a7dd3d14432f10395af6.jpg

And, yes, the asset compiler runs correctly on every deploy without errors.

The normal melange of google, stack overflowing, even some searches via you.com and kagi.com failed to turn up anything save my continual default:

    # config/environment/production.rb
    # Do not fallback to assets pipeline if a precompiled asset is missed.
    #config.assets.compile = false
    config.assets.compile = true
    
Switching this from false to true did fix it but the mystery of why this ONE damn file isn't found via nothing but an image_tag makes no damn sense at all.

Oh and Rails 6.  Yes I could move to Rails 7 but I fear the "solution" might be worse than the disease.

    rails -v
    Rails 6.0.4