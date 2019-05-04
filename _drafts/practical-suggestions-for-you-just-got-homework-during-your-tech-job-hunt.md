---
layout: post
title: Practical Suggestions for You Just got Homework During Your Tech Job Hunt
category: jobhound
tags: ["jobhound", "techjobs", "job_hunt", "homework"]
---
Practical Suggestions for You Just got Homework During Your Job Hunt

This blog post talks about the trend towards homework during applications for tech jobs (largely programming) and gives some practical suggestions for doing a better job on it.

In terms of full disclosure, at the end of this article, I’m going to pitch you on a [new tool](https://www.jobhound.io/) I built for managing your personal job hunt, but don’t worry, it’s free to use. I found the job hunt process so absolutely distasteful that the only way I could get through it was to actually create some software based on what I learned.

## Rule 0: Accept That You Have to Do It -- Or Someone Else Will

I've had a number of people tell me that job candidates **should not do** homework.  They typically argue that the investment of time for a candidate needs to be similar to the company and that homework is unfair and should be done.  That's a wonderful intellectual argument and it might be morally correct but here's the simple truth:

**If you don't do it then someone else will.**

The unfortunate reality of today's job hunt (I'm writing this in mid 2018) is that job hunters need the companies with the jobs **more** than the companies need the candidate.  I know it sucks but I repeat if you don't do it, someone else will.  

I'd also point out that the essence of being a software developer is continuous learning and even a crappy project to get a job can teach you something.  I recently submitted just about [a hundred applications](http://fuzzyblog.io/blog/jobhound/2018/04/24/ten-things-i-learned-from-a-job-hunt-for-a-senior-engineering-role.html) and I learned something from every one that had homework.  I wasn't necessarily happy about the requirement but I was happy about the learning.

A final point benefit to doing homework is that it can be placed on your Github profile and that does boost who you are as a developer.  Personally I think that's a good thing.

## Rule 1: Start with Time Bounding

I started every one of my homework projects by *time bounding* them to a known amount of time.  Time bounding is the process of deciding in advance just how much time you are willing to commit to something and then accomplishing it within that boundary.  Sometimes I did this because the job required it -- "Spend no more than 8 hours on it".  Sometimes I assessed the opportunity and spent less time if I thought it wasn't as good a job.  Sometimes I spent more time on it because I thought it was a great job.  And sometimes I broke the time bounding rule just because I got interested in it and I spent whatever it took to do a good job.

We all know that coding projects always take as much time as available and time bounding is a fantastic way to avoid that.  If you're going to apply to more than a handful of jobs then you absolutely need to time bound your homework.

## Rule 2: Be Wary

The one thing that I've been warned about from others is that some companies are unethical and use homework as a way of getting free coding.  Watch out for homework which is suspiciously large and may represent the starting point for an internal project regardless of hire.  One approach to avoiding this would be to put your homework on Github and attach the [AFGPL license](https://www.gnu.org/licenses/agpl-3.0.en.html) so it technically cannot be used without disclosure.  I know this may not succeed but it is at least some protection for your rights.

**Note**: I did not encounter this in my job hunt but other people I know and respect have.

## Rule 3: Don't Be Afraid to Ask Questions

One thing that you should know is that homework projects can be *incomplete* or have things missing *deliberately* to see how you handle them.  Don't feel like you are supposed to figure out everything by yourself. If anything is unclear or you are making any assumptions, ask a question or start a discussion thread as a demonstration of your ability to work collaboratively.  

## Rule 4: Know What You're Good At and Focus on That

Every engineer worth their salt knows what they're good at and what they're bad at.  And if you know that then make sure to stick to them when you're given homework as much as the project allows.  Don't futz around with a new framework and try and push your boundaries as it is all too easy to get bit by something and have it cost you.  The goal here is always, always to get the job.  That's really why you are doing the homework.

## Sidebar - How to Impress Me When I'm Hiring

One thing that I didn't talk about in my last article was that I've actually been on the hiring side of the job equation more than I ever have been on the applying side.  Here are **the** three things that impress me when I'm hiring:

* Writing Tests
* Writing Documentation - one of the best Rails developers I ever hired was someone who never made a single open source code contribution but had written documentation for the builtin Rails helpers 
* Good version control skills

Each of these points is discussed further in the next three sections.

## Rule 6: Write Tests

I've been on the hiring side of the equation a whole bunch of the time (more often actually than the job application side) and when engineers ask me what impresses me most, my answer is simple and one word:

**Tests**

If you're not writing tests when you submit a homework project in 2018 then you ought to have a **damn good** reason for it.  And if you're going to have a reason for it then explain it in your Screencast (see below under the Screencast section).

Whether or not you submit full test coverage is up to you but you should absolutely have enough tests to illustrate that you know how to write tests. 

## Rule 7: Write Documentation and Do It Well

My second answer to what impresses me when I'm on the hiring equation is **documentation**.  A homework project is a great opportunity to showcase your ability to document your work.  Here's how I go about it.

### Start with a Plan

Sitting down and hacking out some code can be a wonderful pleasure -- but we (generally) don't do that in the workplace.  Instead we start with a plan and writing that plan down should be the first step in your homework project.  For all my homework projects, I started with a markdown file called plan.md which laid out the basic overview of the project and broke it down into steps.  Having a plan gave me a path to follow and helped when I inevitably got into the weeds.  

### Document Your Progress

The open source world has evolved a lot of conventions for project management and the presence of a notes.md file is one of them.  Create a NOTES.md file in the root of the project and document your progress as you go. This should cover problems, approaches, solutions, and concerns.  Make a concerted attempt not only to do the things described, but explicitly state that you are doing these things and why, otherwise reviewers may not notice these efforts; if they go unnoticed, they are less likely to make it into the candidate evaluations as things which will make you stand out against the crowd. Finally you want to specifically direct the code reviewer to the notes.md file or it might not be noticed.

todo; rewrite this section; unclear

### You Aren't Getting Paid for This

Always remember that you aren't getting paid for this. If you know you have another 5 or 10 hours of cleanup to make the submission what you would call "presentable," be realistic and document everything you would do next if you were actually on the job and has the project as an assignment. With this approach, you can mitigate judgments made about your knowledge and skill set based on the submission by balancing it with this forward-thinking documentation.

### Tickets Can Be Documentation Too

For developers that are used to an agile workflow, the process of decomposing work into tickets is actually a natural thing.  If you are delivering your code as a git repo hosted on Github then you do have a ticketing system in the form of Github issues.  Personally I would view those tickets as a great example of good work practices.

### Scalability Can Be Written About

Pretend your app is going into production and might need to scale, but don't prematurely optimize (as it is the root of all evil). Instead, document points in the code you imagine could become bottlenecks at scale, and outline how you might approach optimization at that time.

### Think About the Product Perspective

Consider the homework from a product perspective as well. Think "big picture" about improvements and issues at organizational, logistical, and marketing levels as well, documenting your thoughts.




## Rule 8: Use Version Control Well

There is absolutely no excuse, in 2018, for a any type of software developer to not use version control.  The tools are now industry standard, they are free and online hosting of version controlled files is also free.  

### Small Atomic Commits

My first tip to using version control well 
Make sure to track your changes in version control, via small commits with very clear messages.

### Use Branches for Requirements

Map itemized requirements in the homework description to branches.

### How You Do Version Control is a Model of Your Approach to Development

Don't try to commit "pristine" when on your branches. Be transparent. Let your trial-and-error show through prototype/WIP commits which ultimately leads up to a solution you are happy with.

When you have reached a solution you are happy with, on a branch for a given requirement, again, don't try to make the history "pristine" by squashing the history of the branch into a single item that hides all of your exploratory development and iteration.

A lot of your potential value as an employee, provided in a homework submission, can be revealed when the reviewer explored the history. [Sane] reviewers will see a transparency of history, within your iterative process, expressed through your commits, positively because...

it shows you don't have ego problems (putting off PR until you are sure not to be judged based on the contents)
it shows you value the clarity and truth of the history above how others might judge you for the mistakes you make along the way (no one gets it right on the first swing)
it addresses the question of how you might have arrived at a particular solution in one of the most "real" ways
it provides an easy means of going through your thought process, hurdles you ran into, and improvements/optimizations you made during an interactive review
it shows you have a good sense of where the stopping points are within a larger problem, which in turn shows you are good at breaking a larger problem into smaller, prioritized problems
the repository history as a whole self-documents everything you did, and in what order, without placing on the reviewer the burden of diffing the initial homework project against your submission


## Always Build for the User Not the Developer 

You are likely being interviewed for a position in which you will be building products for users - not developers. Think strongly about UX and get the requirements met, but make sure your solution is friendly to the user before becoming hyper-concerned with code style and cleanliness.

## Write a Cover Letter

## Finishing Things Off - The Actual Submission

When you get to the end point and you're ready to submit it, there are a number of options:

* An actual Github repo
* A Zip file
* A Google drive attachment 

All of these things work well.  The benefit to a full Github repo is that it illustrates your version control skills

One thing that bit me recently was 

## Make a Screencast

One thing that I did do to stand out from the crowd for almost all my homework assignments was to record a screencast talking through my work and illustrating what I thought were the best points. I had several interviewers tell me that "thank you; I've never seen that before". This gets the interviewer past any issues with getting code installed / setup, etc.  I used a demo version of [ScreenFlow](https://www.telestream.net/screenflow/overview.htm) to make these but [Screencast-O-Matic](https://screencast-o-matic.com/) also works great.

So you have examples of screencasts to go from, I put all of mine on YouTube:

* [Homework Screencast for A Company in the Wedding Business](https://youtu.be/YcZlsmrHm-Y)
* [Homework Screencast for A Company in the Fashion Business](https://youtu.be/dl7Mx83QrSI)
* [Homework Screencast for A Company in the Education Business](https://youtu.be/uVTAc3mwVXY)
* [Homework Screencast for A Company in the Hiring Business](https://youtu.be/p4oHEJW31uQ)
* [Homework Screencast for A Company in the Insurance Business](https://youtu.be/cte-t7WHTvI)

## Get Someone to Do a Code Review for You

I would never encourage anyone to cheat on a homework project but I don't think there's anything wrong with getting someone to code review your work.  In today's world, code reviews are a key component of any software engineering project.  Why shouldn't you apply the same techniques that an employer would require for your actual work?

## Expect Unfairness in the Judging Process

The saddest part of doing homework is that not only are you unlikely to get a grade, you should be aware that the judging process can be absolutely unfair.  One of the projects I submitted was dinged because "It wouldn't scale up to 500x the data volume".  This as an absolutely BS approach to judging it given that the requirements:

* Provided the data
* Gave no guidance on data volume
* Precluded using any external tooling that was designed for the problem at hand (search)

You may have the opportunity to discuss your solution -- but you may not.  This is the reason that I recommend making a screencast -- only you know how to best demonstrate what you created and your design approach.

## Thank You

The usual thank you goes out to [Nick Janetakis](https://nickjanetakis.com/blog/) who reviewed this.  [Sean Kennedy](https://www.twitter.com/csphere) also did yeoman's work in submitting a huge number of points for this essay.  Thank you both.

## And Here’s the Pitch for Job Hound

As I discussed at the start, I recently did a major job search.  The end result of that while I did end up with a full time job, I also ended up creating a new free product, [Job Hound](https://www.jobhound.io/) to make applying for tech jobs (generally programming) easier. Job Hound is a job application tracking system and it puts the job application firmly in charge of the process. I built it because after I had applied for about 15 jobs, I had no idea where I was in the process and I couldn’t give my wife a decent answer about my progress because I simply had no idea. Job Hound isn’t a SAAS product, it is 100% free and I’d encourage you to check it out.

[My new free product is Job Hound: Make applying for tech jobs suck less! Sign Up Today.](https://www.jobhound.io/)

Also here is [Job Hound on Product Hunt](https://www.producthunt.com/posts/job-hound) in case you want to toss me an upvote. Thanks in advance.

# Conclusion




 







      



