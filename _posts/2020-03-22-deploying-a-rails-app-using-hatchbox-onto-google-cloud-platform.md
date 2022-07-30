---
layout: post
title: Deploying a Rails App Using HatchBox onto Google Cloud Platform 
category: rails
tags: ["rails", "hatchbox"]
---
{% pizzaforukraine  %}

This blog post is a quickie where I document how I deployed CovidNearMe onto Google Cloud Platform or GCP using [HatchBox.io](https://www.hatchbox.io).  I need to start by giving a huge shout out to **Tony Carnevale** from Google who went above and beyond in providing outstanding support.

Here are the stages.

## Stage 1: Create a Cluster

**Note**: Even a single machine is considered a cluster.

1. Go to [HatchBox.io](https://www.hatchbox.io)
2. Login with your account.
3. Click on Clusters and define a [New Cluster](https://www.hatchbox.io/clusters/new).
4. Name the cluster **GCP Covid Near Me** (or that's what I did).
5. Select **Somewhere Else** as the hosting provider.
6. Select the **Everything on a Single Server** option.
7. If you are using the GCP Cloud SQL (postgresql) and GCP Redis then remove these options from the Roles list.
8. Enter the IP address under public ip.
9. Set the private IP to 127.0.0.
10. There appears to be a bug where you can't provision the server unless a local redis installation is selected so add it back.
11. Click provision the server and you will be given an SSH command to run as root on the box.  You SSH in, do a sudo su, execute the command and exit out
12. You click Test / Provision (I forget which) and your server will be flawlessly setup.

## Stage 2: Create an App on the Cluster

1. Click on [Apps](https://www.hatchbox.io/apps).
2. Click on [Create a New App](https://www.hatchbox.io/apps/new).
3. Choose the cluster from the drop down list.
4. Click on your git repo host.
5. Set the name of your application (I like to include the name of the cluster with the app name since this app is already deployed to digital ocean).
6. Enter the name of the repo (easily find this from .git/config in your Rails root directory).
7. Set external host for the database if you are using Google's Cloud SQL.  This means that you need to  define a postgres configuration url.  The format for this url is this: **postgresql://user:password@databasehost.com/database**.  You simply need to replace user with your username, password with your password, databasehost.com with your database server and database with the name of the database.
8. Define your Rails Master Key right away so you don't screw this up and have to ask [Chris Oliver](https://gorails.com) for support (and thus sound like an idiot).  Your rails Master Key can be found in and copied with: cat config/master.key | pbcopy (if you are on OSX)
9. Do an initial deploy.  This will give you an HTTP only application.  You can't have HTTPS until you have a domain assigned to the server so you have to start with HTTP.
10. You can then define SSL.  I'd like to illustrate those steps but I didn't write them down well enough so that will have to be a future blog post.
11. Make sure that you have SSH on the GCP cluster open to the IP address for the Hatchbox deployment engine.  This ip address, today, March 24, 2020, is **94.53.199.250**.