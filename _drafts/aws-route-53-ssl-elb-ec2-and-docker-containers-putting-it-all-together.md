---
layout: post
title: AWS Route 53, SSL, ELB, EC2 and Docker Containers - Putting It All Together
category: aws
tags: ["aws", "route_53", "ssl", "elb", "docker", "aws_certificate_manager"]
---
For the past several months I've been building a SAAS app and I'm at the deploy stage.  I now have a number of ec2 instances, most of which have multiple containers and I need to assemble this into a logical whole.  I know the tooling that I need but putting it all together, well, there in lies the magic.  In this blog post I'm going to walk you through the different technologies to show you how to put together a small multi node cluster of boxes that represent a multi tenant SAAS app with wildcard DNS.  As always I'm going to do this with AWS.  

**Disclosure**: I am an Amazon shareholder (as are a lot of us).  I still think AWS is overall the best option for any type of cloud development.

**Disclaimer**:  I'm not done yet so all of this will be based around the mythical domain name mysaas.com.

# Definitions

Let's start with some definitions:

* **AWS EC2** -- Amazon's underlying server architecture; each server is generally called an instance.
* **AWS Route 53** -- Amazon's DNS Service.   This is where we'll define a domain name like mysaas.com, admin.mysaas.com and also turn on DNS wildcarding so customername.mysaas.com will map to the right set of boxes.
* **Hosted Zone** -- A hosted zone is a DNS term which basically refers to "all the DNS related crap for a single name like mysaas.com".  You generally start working in Route 53 by selecting a hosted zone.  My apologies to real DNS experts who are now ready to throttle me over how I explained this.
* **Record Set** -- A record set is a set of instructions to DNS on how to handle a single name.  Again apologies to DNS experts.
* **SSL** -- The industry standard Secure Sockets Layer.  SSL support for any type of login based application is absolutely essential now that Chrome aggressively argues against you filling in login forms that aren't hosted by SSL.
* **AWS Certificate Manager** -- The Amazon tool for creating SSL certificates and binding them to an ELB.
* **AWS ELB** -- The Amazon Elastic Load Balancer which routes incoming requests to the correct host (and port) on your boxes.  An ELB automatically handles SSL termination allowing a certificate from the AWS Certificate Manager to be routed to the correct instance or group of instances and http port.
* **AWS ELB Listener** -- A listener on an elb listens for traffic and sends it, evaluating it with a rule based criteria, to an ELB target group.
* **AWS ELB Target Group** -- A target group is a collection of AWS instances that are the destination of a listener.
* **Port** -- The underlying input channel on an http connection where an HTTP based service exist.  Ports are important because you often want multiple http services on the same physical instance and the solution is to run them on different ports.
* **Docker Containers** -- Docker containers are a way to manage and deploy stacks of related code in an overall grouping called a container.  I could talk a lot more about Docker but my friend Nick Janetakis does it better in his course [Dive into Docker](https://diveintodocker.com/courses/dive-into-docker).

# Mapping It All Out

Here are my instances:

* 2 Instances for Redundancy
  * website1.mysaas.com, port 80 (these two will map to www.mysaas.com / mysaas.com)
  * website2.mysaas.com, port 80
  * shop1.mysass.com, port 3205 (these two will map to shop.mysass.com)
  * shop2.mysaas.com, port 3205
* 1 Instance, Internal Tooling to Support the Service; Not Customer Facing
  * pagearchiver.mysaas.com, no port
  * admin.mysaas.com, port 3203 (this maps to admin.mysaas.com)
  * pagearchiveapi.mysaas.com, port 3230 (this maps to pagearchiveapi.mysaas.com)
* 2 Instances for Redundancy
  * webapp1.mysaas.com, port 80 (these two map to *.mysaas.com)
  * webapp2.mysaas.com, port 80
  * webappapi1.mysaas.com, port 3220 (these two map to webappapi.mysaas.com)
  * webappapi2.mysaas.com, port 3220
  
You'll notice that some of my services are running directly on 80 and others on a port in the 3200 range.  I develop this entire stack locally starting at port 3200 (website) and port 3210 (webapp) and the reason I don't run everything on port 32xx is that when you are debugging a load balancer it is very, very helpful to be able to go directly to a dns instance and test something.  Please note that unless you deliberately open a firewall port for say 3203 or 3230, you wouldn't be able to go directly to those instances for testing on that port.  So for the admin tools you will need to go through the overall load balancer.

# Process

Here's the overall process that needs to be followed:

1. Use AWS Route 53 to setup your baseline domain, mysaas.com 
2. Use AWS Certificate Manager to set up a certificate for https for the domain name *.mysaas.com (this lets you define whatever subdomain names you want)
3. Use AWS Route 53 to assign dns names to every server you have that you want to be available on port 80 (since we're not opening firewall ports, you don't need anything that's not on 80); this guarantees access to the low level resources at least on port 80.  These dns names are the ones with numbers like:
   * website1.mysaas.com
   * website2.mysaas.com
   * webapp1.mysaas.com
   * webapp2.mysaas.com
  
4. Create an Elastic Load Balancer of the type Application Load Balancer (do not use classic -- it doesn't support port mapping and traffic routing rules which you absolutely need).
5. Create top level domain names in Route 53 for all the things that need to be fed through the load balancer.  Each of these domain names will be assigned to a DNS alias where you will select the load balancer.  Here are those domain names:
  * mysaas.com
  * www.mysaas.com
  * shop.mysaas.com
  * admin.mysaas.com
  * pagearchiverapi.mysaas.com
  * webappapi.mysaas.com
  * *.mysaas.com
6. Back in the Elastic Load Balancer you need to create a series of traffic groups and listeners.  The traffic group has to be created **first** because the listener has to have a destination.

# Two Tips to Make this Easier

Like a lot of us I use a laptop for all my computing, specifically a MacBook Pro.  I did all of this work with the AWS web based user interface and trying to use it without a big, external monitor was absolutely **maddening**.  If you don't have an external monitor hooked up to your Mac before you do this, you are making a big mistake because the web user interface for AWS simply doesn't display enough information for you to do this easily.  So having an external monitor available is the first tip.

The second tip is that you will be constantly shifting between the AWS ELB interface and the AWS route 53 interface so open both of these at the start in separate browser windows. You will likely also want additional tabs for each but I would personally keep the Route 53 and ELB tasks in two separate browser windows.
  
