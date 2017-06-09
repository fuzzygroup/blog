---
layout: post
title: Fixing Chart.js Sizing Issues with Rails Using chartjs-ror
category: rails
tags: ["rails", "chartjs-ror", "chartjs"]
---
I've spent the past few weeks struggling with a Chart.js graph sizing issue.  I'm not a real JavaScript guy so I'm using the Ruby gem [chartjs-ror](https://github.com/airblade/chartjs-ror) from AirBlade.  Out of all the charting gems I've looked at recently, Airblade's has been the best (so thank you!).  The problem was that my graphs were appearing like this:

![bad_graphs](/blog/assets/chartjs_graph_size_bad.png)

where what I was really looking for was this:

![good_graphs](/blog/assets/chartjs_graph_size_good.png)

Here's the partial I'm using to render the graph:

    <%
    times = []
    metrics.each do |metric|
      times << metric.created_at.in_time_zone(current_user.time_zone).to_s(:db)
    end
    data = {
  
      labels: times,
      datasets: [
        {
            label: label,
            background_color: "rgba(220,220,220,0.2)",
            border_color: "rgba(220,220,220,1)",
            data: metrics.map(&:amount)
        }
    
      ]
    }
    %>

    <% options = { :height => 100, 
                   :responsive => true, 
                   maintainAspectRatio: true, # <== this option needs to be true not false
                   :yAxes => [:ticks => {:beginAtZero => false }] } %>
    <%= line_chart data, options %>
    
The issue was the **maintainAspectRatio: true** setting.  Somehow it got mistakenly set to false and that completely changes the look and feel of the graph.  Bizarre but apparently true.