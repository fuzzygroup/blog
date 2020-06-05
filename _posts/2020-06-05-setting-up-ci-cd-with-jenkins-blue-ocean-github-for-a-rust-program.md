---
layout: post
title: Setting Up CI / CD with Jenkins, Blue Ocean, Github for a Rust Program
category: cicd
tags: ["cicd", "ci", "cd", "jenkins", "blue_ocean", "github", "rust"]
---
{:.center}
![IMG_0928.jpeg](/blog/assets/IMG_0928.jpeg)

CI / CD or "Continuous Integration / Continuous Deployment" is the process of: 

* taking a source code base
* running tests against it
* compiling it (if applicable)
* deploying it

CI / CD is an ongoing process that runs continuously and responds to pull requests on your source code repo.  

In this blog post we are going to: 

* Take a git repo with a Rust code base
* Run it thru CI / CD using Jenkins with the [Blue Ocean plugin](https://www.jenkins.io/projects/blueocean/)
* Compile it
* Deploy it

I'm not using Circle CI or another hosted CI / CD system as our overall deploy strategy is complex and Ansible based.

## Step 1: Correct Git Work Flow 

The git workflow we are using is: 

* master branch
* develop branch
* feature branch

All work happens in feature branches.  Feature branches are then merged into develop and develop is merged into master.  The goal here is that the master branch is always kept pristine.  

This means that you need to make some change to your github settings:

* Github Settings / Branches / Default branch -- needs to be set to develop
* Github Settings / Branches / Branch protection rules -- develop needs to be protected

Here's what you need to do:

1.  Create a git repo.
2.  Push the code base to it.
3.  Create a develop branch in the code base.
4.  Change into that branch.
5.  Push that branch also.
6.  Go to settings for the repo.
7.  Click on branches.
8.  Set develop as the default branch.
9.  Click on branch protection rules.
10.  Add develop as a protected branch.  This will turn on require pull requests before merging and you can set the number of people who have to approve pull requests before the merge.
11. Add master as a protected branch.  For this one you don't want pull requests on; you just want master protected.

## Step 2: Test the Git Work Flow

Now you want to go into your repo and:

1. Create a feature branch, call it "readme", and create / update the readme for the repo.  
2. Then you want to push the branch 
3. Then you want to follow the pull request url on the branch and submit it by clicking Create Pull Request

## Step 3: Get Jenkins Setup Traditionally with Blue Ocean

Setting up all of Jenkins with Blue Ocean is beyond the scope of this article but it is work that needs to be done.  Here's the quick summary:

1. Install Jenkins on a cloud instance.
2. Install Nginx.
3. Install let's encrypt.
4. Set Jenkins up behind Nginx.
5. Install Blue Ocean

## Step 4: Add a Jenkinsfile to your Repo

A Jenkinsfile is a Blue Ocean construct that defines how the CI / CD process works.  This is an ASCII file that looks something like this for a Rust project:

    pipeline {
      agent any
      stages {
        stage('Build') {
          steps {
            sh 'cargo build'
          }
        }

        stage('Test') {
          steps {
            sh 'cargo test'
          }
        }

      }
    }

Ideally there would likely be a stage('Deploy') but we haven't built that with Blue Ocean yet so I might be wrong.  Watch this blog post for an update.

Here's what to do:

1. In develop create a new branch called jenkinsfile i.e. git branch jenkinsfile
2. Change into this branch i.e. git co jenkinsfile
3. Create the file i.e. touch Jenkinsfile
4. Add the contents above to Jenkinsfile
5. Do the add / commit / push dance
6. Create the pull request on Github
7. Go thru the code review / merge dance.

## Step 5: Use Blue Ocean to Setup a CI / CD Pipeline

**Note**: I manually put the above Jenkinsfile in place before doing this.  I am told that Blue Ocean will do this automatically if you don't do it yourself.

Blue Ocean is an open source toolkit that makes CI / CD drop dead easy for Jenkins.  I'm an old school Jenkins guy and someone described Jenkins versus Blue Ocean as "Jenkins makes me tear my hair out" (thanks Don) and he was absolutely correct.  Here are the steps needed to use Blue Ocean to setup a build / test pipeline.

1. From the Jenkins sidebar, click Open Blue Ocean.
2. Click the New Pipeline button on the upper right.
3. Select github as your source code host (or whatever).
4. Click the organization that owns the repo.
5. Select the repo.
6. Click the Create Pipeline button.
7. Click on the latest branch.
8. Click on the Pencil icon to make any changes.
9. Click Save and Run.

This starts the build process.  You may need to edit the Jenkinsfile to match the details of your code base if you didn't already create it.

## Step 6: Setup Jenkins Traditionally

**Note**: If you are using Blue Ocean then you don't need to this.  I wrote this before I was shown the magnificent awesomeness that is is Blue Ocean.  I left it here though to illustrate just how much simpler Blue Ocean makes the CI / CD process.

Within Jenkins there is a dashboard of your items.  An item is a project that you want to build.  Here's what to do:

1. In Jenkins select New Item.
2. From the list item items, when you have Blue Ocean installed, then you have the Multi Branch Pipeline item type.  Select that.
3. Name your item and click Ok at the bottom.
4. A very long form is displayed; this is normal for Jenkins.
5. Set the Name and Description fields.
6. Set the Repository HTTPS URL to: your github repo.
7. Set the Discover Branches strategy to: All Branches.
8. Set the Discover pull requests from forks strategy to: Merging the pull request with the current target branch revision
9. Set the Trust to: From users with Admin or Write permission
10. Set the Discover pull requests from origin strategy to: Merging the pull request with the current target branch revision
11. Set the Property strategy to: All branches get the same strategy
12. Set the Build Configuration to by Jenkinsfile
13. Set the Script path to by Jenkinsfile
14. Click Ok at the bottom to save the Jenkins project. 

And at this point you still really need to go into Blue Ocean.  My advice is don't do it this way and just follow Step 5 above.