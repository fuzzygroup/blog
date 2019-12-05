---
layout: post
title: Startup Learnings - What Taylor Williams Taught Me
category: startup
tags: ["startup", "learnings", "git", "taylor_williams"]
---
![IMG_0469.jpeg](/blog/assets/IMG_0469.jpeg)

**Note**: Code Cat watches disapprovingly as I work ...

The bulk of my career has been spent at the **small** scale of the startup universe -- companies with 15 people or less; often a lot less; more than a few times, I've been the *only* engineer. I have done three stints with companies at or near the three figure number of employees: Dataware, Mascot Network and Seas Education.  One of the characteristics of working at the small scale of startups is that what matters is *results*.  How you do it generally doesn't matter -- that you do it *does matter*.  

And, perhaps unsurprisingly, this can lead to some bad things when it comes to *engineering processes*.  To this point, I've actually been dubbed "the anti process" in at least one organization I spent some time at.  So keep that in mind as you read on ...

I'm actively working on an (unlaunched) side project and I noticed this today:

{:.center}
![500_pull_requests.png](/blog/assets/500_pull_requests.png)

That's from the repo on my side project and it indicates that I've created *500* pull requests (this was tied to issue #444 which only got merged this morning; the current issue number is 501.  Issue 444 was a major refactor that has been a long coming.

I'd like to joke that aggressively using pull requests, even on an unlaunched, personal side project, is "how Mother Johnson taught me to do open source" but that would be an untruth.  This is a [Startup Learnings](https://fuzzyblog.io/blog/tag.html#learnings) post and I learned this from **Taylor Williams**.

Taylor Williams is currently the head of software engineering for [Seas Education](https://www.seaseducation.com), a SAAS product focused on record keeping for special education.  I worked for Seas for about 18 months during which time I focused on AWS infrastructure, deployment, Ansible and back end features.  When I came into Seas, Taylor was still a bit on the junior side but I watched him grow and develop as he took on a larger and larger role, culminating in a promotion where he took on leadership of all software engineering, across all product lines.  

What Taylor taught me was git discipline, specifically:

* All development is done in feature branches tied to a ticket number
* Feature branches should be atomic and only include changes specific to that ticket
* The develop branch accepts changes from a feature branch once the tests pass
* The master branch is always pristine and can be deployed at any time
* Pull requests are how you merge your feature branch into develop

**Note**: I actually believe in this process so thoroughly that I [documented it](https://fuzzyblog.io/blog/git/2019/06/27/understanding-a-small-organization-s-git-development-model.html) for anyone who works on my side project.  And I've brought it into my current consulting engagement.

Now I've been using version control for a long time (I started with [PVCS](https://en.wikipedia.org/wiki/PVCS)) but I've **never** had this kind of discipline before my time at Seas.  Taylor had no problem saying to me what amounted to "Dude - you're doing it wrong; we do it this way."  And I'll admit that I didn't like hearing that because I'm a pretty senior technical guy and criticism can be hard.  But Taylor did it well and I listened and **he was right**.  

I've now brought over 7,000 lines of brand new code into the world using this approach so I think I've pretty firmly adopted it.

    ❯ bundle exec rake stats
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Controllers          |   1757 |   1155 |      28 |     136 |   4 |     6 |
    | Helpers              |    490 |    382 |       0 |      49 |   0 |     5 |
    | Jobs                 |      2 |      2 |       1 |       0 |   0 |     0 |
    | Models               |   2980 |   1709 |      27 |     189 |   7 |     7 |
    | Mailers              |      4 |      4 |       1 |       0 |   0 |     0 |
    | Channels             |      8 |      8 |       2 |       0 |   0 |     0 |
    | JavaScripts          |   4351 |   3599 |       0 |     183 |   0 |    17 |
    | Libraries            |   1446 |    929 |       0 |       9 |   0 |   101 |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Total                |  11038 |   7788 |      59 |     566 |   9 |    11 |
    +----------------------+--------+--------+---------+---------+-----+-------+
      Code LOC: 7788     Test LOC: 0     Code to Test Ratio: 1:0.0

**Note**: There are tests; rspec tests don't show up here; my test ratio isn't great yet but it is a work in progress:

    find . -name '*.rb' | xargs wc -l
         115 ./spec_helper.rb
      ...
        1720 total

So thank you Taylor for breaking my "anti process" tendencies.  I am much, much happier with my code management practices now.

And, in closing, I would be remiss in not thanking my former pairing partner, [Sean Kennedy](https;//csphere.github.io/) for fixing some of the git mishaps that occurred on the way down this learning process.  Thanks Sean!