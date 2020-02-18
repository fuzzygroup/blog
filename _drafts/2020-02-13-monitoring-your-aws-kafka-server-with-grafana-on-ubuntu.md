---
layout: post
title: Monitoring Your AWS Kafka Server with Grafana on Ubuntu
category: grafana
tags: ["grafana", "kafka", "ubuntu"]
---
Grafana is a popular Open Source monitoring tool.  In this blog post, I'm going to walk you through installing Grafana on an AWS instance and then set Grafana up to monitor your Kafka instance.

## Installing Grafana on Ubuntu

Here are the steps that you want to follow to install Grafana.  I did this on a t2.micro instance running Ubuntu 18 based on the [standard Grafana docs](https://grafana.com/docs/grafana/latest/installation/debian/).

### Ubuntu Updates

Your first steps to get Grafana installed are the same that you use for almost any apt-get based install:

    sudo apt-get install -y apt-transport-https
    sudo apt-get install -y software-properties-common wget
    
### Add Grafana Key and Repo

The next step us to add the grafana key and repo:

    wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
    sudo add-apt-repository "deb https://packages.grafana.com/enterprise/deb stable main"

### The Actual Installation

Here are the steps to actually install grafana:

    sudo apt-get update
    sudo apt-get install grafana-enterprise

Once installation is done then you need to start the systemd service that actually runs grafana:

    sudo systemctl daemon-reload
    sudo systemctl start grafana-server
    sudo systemctl status grafana-server

