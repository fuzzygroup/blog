---
layout: post
title: Troubleshooting Rails with Passenger and Apache2
---
passenger-status

passenger-status --show=requests

passenger-memory-stats

sudo apt-get update

sudo apt-get upgrade

https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/aws/apache/oss/trusty/install_passenger.html

I'm going to make a pretty strong, very general statement about Passenger based on using it for almost a decade:

> If you find something wrong, it is generally you, not Passenger.  