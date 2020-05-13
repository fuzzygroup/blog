---
layout: post
title: Installing Jenkins on Ubuntu 18 on AWS
category: jenkins
tags: ["jenkins", "linux", "ubuntu"]
---
{:.center}
![IMG_2283.jpeg](/blog/assets/IMG_2283.jpeg)


Jenkins is an Open Source CI / CD software program that you can easily install on an AWS instance.

Here is how to install Jenkins:

    sudo apt install default-jre    
    wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins
    sudo systemctl start jenkins

Here are some additional useful commands:

    sudo systemctl status jenkins
    

Here are the next steps you need to follow:

1. Open a port in the AWS Security Group for your instance for port 8080 on  0.0.0.0/0 to allow http access to the Jenkins user interface.
2. Go to the instance's IP address at port 8080 to run through the Jenkins installation.
3. Confirm the Jenkins password per the instructions on screen.
4. Select the plugins that you need for your Jenkins installation.
5. Create your account and password.

## Sources

* [Installing Jenkins](https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-18-04)
* [Installing Java](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04#installing-specific-versions-of-openjdk)
