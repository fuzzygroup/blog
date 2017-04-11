---
layout: post
title: Building Graphs with the chartjs-ror Gem
category: rails
tags: ["rails", "graphs", "chartjs", "chartjs-ror"]
description: If you're not really a JavaScript guy then building a nice dashboard can really be an exercise in pain and futility.  Here I use the chartjs-ror gem to build a nice looking dashboard.
image: http://fuzzyblog.io/blog/assets/sideproject01_cartazzi_.png
---
There a lot of times in 2017 when, as a Rails developer who's mostly backend, it feels like the world has passed us by when it comes to something that is purely front end like, say, dashboards and graphs.  I'm building a side project right now that is graph heavy and I've looked at a lot of different graph technologies:

* [d3.js](https://d3js.org/) - which I really like but I don't feel I have the javascript mojo to use
* [highcharts](http://www.highcharts.com/) - which I've used in the past but is commercially licensed and this is a side project
* [chartjs](http://www.chartjs.org/) - which I really, really like

Overall I've had the best luck with chartjs in terms of the ratio between time invested and graphs produced i.e. I got farther with chartjs with less effort than anything else so that's where I've been focused lately.  

The single best reference I've found to using chartjs with rails was buried at the bottom of a message board from a guy in New Zealand who uses chartjs and rails to graph has big races:

<blockquote>
  Hi @glundgren,

  Check out my full working example. Rather than mucking around with chartjs-ror, I have switched to using straight ChartJS.

  The flow of events is:
  1. My controller calls my model which produces the data in the correct format
  2. My view defines a HTML canvas element with the data as HTML5 data attributes
  3. Then the javascript comes along and uses native ChartJS (i.e. new Chart(element, options) to produce the chart. The values are read directly off the data attributes, (i.e. resultDurationCanvas.data('duration')). This is where I convert the number of seconds to hh:mm:ss format for the labels

  I realise it's quite complicated but it allows me do the heavy lifting in ruby while giving me full power over the presentation of the labels etc without having to dance around with %= % in my erb.

  This is just one of many possibilities, but it may help you think about options.

  Let me know if you need any help with anything else!

  Dave

  [Source](https://www.bountysource.com/issues/7948443-graphing-times )(scroll down to the bottom).
  
  The full working example is here: [http://cycling.harris.org.nz/races/taupo-cycle-challenge](http://cycling.harris.org.nz/races/taupo-cycle-challenge) and his github for this is here: [https://github.com/daveharris/cycling.harris.org.nz](https://github.com/daveharris/cycling.harris.org.nz)
</blockquote>

Given the importance of mastering JavaScript in 2017 I've been working natively with chartjs and the Rails asset facilities but I thought it might be interesting to dip back to a gem based approach and see how far I got with it.  This led me to the [chartjs-ror](https://github.com/airblade/chartjs-ror) gem.

Here is the quick tutorial for using it:

1.  Add gem 'chartjs-ror' to your gemfile and bundle install.
2.  Add //= require Chart.min to application.js
3.  Add this example to a view:

    <%
        data = {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [
            {
                label: "My First dataset",
                background_color: "rgba(220,220,220,0.2)",
                border_color: "rgba(220,220,220,1)",
                data: [65, 59, 80, 81, 56, 55, 40]
            },
            {
                label: "My Second dataset",
                background_color: "rgba(151,187,205,0.2)",
                border_color: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19, 86, 27, 90]
            }
          ]
        }
     %>

    <% options = {} >    
    <%= line_chart data, options %>

That will work but it will generate a bloody enormous graph for you.  You need to set the options hash correctly to make it size to something resembling a correct web app by changing the options hash as follows:

    <%# options = { :responsive => true, maintainAspectRatio: false } %>   
    
I really don't understand how maintainAspectRatio: false makes it smaller but that seems to be a chartjs thing since discovering that bit of magic made my other graphs using chartjs magically work also so I'm just going to treat it as a *magic incantation* that works and leave it at that.  Honestly its no different than N other bits of technical knowledge that I don't understand but rely on (mysql tuning at times comes to mind; or apache configuration).

# Tying this in with ActiveRecord


# Common Errors

The first common error you might hit is this:

> (index):115 Uncaught ReferenceError: Chart is not defined   at initChart ((index):115)

That means "You need to add chartmin to application.js"
