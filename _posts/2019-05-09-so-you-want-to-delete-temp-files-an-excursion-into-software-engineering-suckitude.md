---
layout: post
title: So You Want to Delete Temp Files - An Excursion into Software Engineering Suckitude
category: software_engineering
tags: ["software_engineering", "rails", "ruby"]
---
So today was a day of epic software engineering failure.  Let's consider, just for a second, this string of commit messages:

    feature/ATT-1551-f - And goodbye ... it all goes away like the bad dream that it was
    feature/ATT-1551-e - It is called a constant; sigh; oh and an entire rewrite
    feature/ATT-1551-d - And let's go again - there are still hours in the day to get this wrong ...
    feature/ATT-1551-c - hopefully, possibly the last iteration on this humiliating bit of work
    feature/ATT-1551-b - Argggh !!!!
    feature/ATT-1551-a - Debugging hooks for understanding this bit of madness

Any experienced engineer can read between the lines of that level of *gallows humor* in these commit messages and know, I mean *know*, what's coming.  This whole blog post is an illustration of how something that is drop dead simple can really, really bite you in the ass.  And you can take away from this either a smug feeling of "I'm smarter than that" or you are raising a glass to me somewhere and saying "you poor damn bastard, there, there".

## The Problem

This all started with the git branch *feature/ATT-1551* which added a feature to our architecture which cleaned up straggling temp files that had been left behind by a variety of different processes that generated data locally that was then queued up to S3.  Yes, yes, yes I know fix the cause not the symptom but that was out of the scope of the defined work; you know the drill.

We are a Rails application and I made the decision to implement this as a Capistrano post deploy hook that executed a Capistrano rake task.  That was, unbeknownst to me, my *first* mistake.  The specification on the ticket said that the need was to clean up any files in shared/tmp that were older than 10 days.  My initial pass on this ended up being about maybe 25 lines of ruby implemented in lib/capistrano/tasks/tmp_files.rake. 

## And Here's Where It All Began

My code went thru the pull review process just fine until there was a comment that said something to the effect of "Wouldn't it be better if the 10 days was not fixed in the code but could be adjustable from outside so we didn't have to redeploy if we needed a different amount of days".  That sounds logical, right?  The pull request discussion thread diverged between passing in a parameter or using an environment variable and it ultimately converged on an environment variable because a parameter didn't work since this was already buried inside an Ansible based deploy engine that executed a Capistrano task (that then called a post deploy hook).  So with that decision, the descent into madness truly began.  And if my description of Ansible spawning Capistrano spawning a post deploy hook feels virtually Cthulian to you, well, *yep*.

*Sidebar:* I'd love to tell you that all of this was easily resolved but that wouldn't be fun, now would it?  Instead, while the initial code was written by me, getting this actually debugged and solved took two senior software engineers most of a day. And it is an excellent illustration of just how complex even something simple can be in today's world.  The second engineer got pulled in right about here, after the pull review process centered around environment variables.

## Nothing is Actually Simple Anymore

We have a file of environment variables that are automatically defined by our application using the [Figaro gem](https://github.com/laserlemon/figaro).  Normally I'm not an environment var fan but this really works well so I followed our normal process for this:

* Go into our Ansible stack
* Decrypt the environment variable files (these are YAML files and that becomes relevant later on)
* Add the new variable to each of our environments (production, training, staging)
* Encrypt the environment variables
* Move the environment variable files up to our Jenkins deployment box

The reason for the convoluted process is that we don't have these files as part of our Capistrano deployment since they expose serious credentials.  Instead our Ansible wrapper around the deployment handles moving these up and in place.  And this uses Ansible's transparent encrypting / decrypting as well.

After a few go arounds of "what should this variable be named", I added to our Ansible stack two shell files:

 * decrypt_all.sh
 * encrypt_all.sh 

So at least that makes this process suck less given that each command line for this is about 112 characters long and I have to do it three times every single time.  I try and follow a boy scout's approach to code where you leave things better than you found them whenever possible.  And this did make things better.

## Using the Environment Variables 

Once this was done, that led to modifying the code to pull the value out of the environment variable.  Now this should have been nothing more than reading ENV['DELETE_TMP_FILE_DAYS'] for the value TRUE, couldn't be easier, right?  Ha!  *Shudder*. Given that this was implemented as a Capistrano post deploy hook, getting any bit of this tested boiled down to this process:

* Create a new branch for every single debugging attempt (because we have to go thru a pull review process)
* Write code
* Git commit / add / push
* Go thru pull review process
* Deploy
* Wait thru a roughly 11 minute deploy cycle for something to fail
* Read logs to analyze failure
* Lather / Rinse / Repeat

Given that this is a post deploy hook executed Rake task there is no way to debug this easily.  Yes you can check the code.  And you can execute it manually in Rails console but that's not quite the same as it actually running in the environment … or is it?

## Cutting to the Chase Or 11 Steps Into Madness

This is getting kind of long already so I'm going to cut to the chase and bullet point the issues as we hit them:

1. The first issue was that we kept defaulting to the if / else case where our environment variable wasn't being set.  And since I was casting this to a constant for safety (remember this code deletes files on a file system so it is wise to be damn careful with it), this meant that the constant kept failing a defined? check.  We had put in a raise "Constant not defined" unless defined?(CONSTANT_NAME) check before anything got deleted as a safe guard and that one line of code entirely saved us.  Kudos to my coding partner, Sean Kennedy, for that.
2. This first issue ultimately ended up being tied to recognizing that a Capistrano post deploy hook *DOES NOT RUN UNDER RAILS*!  And that means that anything loaded by a Rails initializer isn't available — meaning the Figaro gem never executed so the values in our environment variable file weren't even being seen.  But since our environment variable file syntax was read from using ENV['VARIABLE_NAME'] we weren't getting failures due to ENV not existing (ENV always exists, even in an IRB environment).  We would just get a nil value instead of the expected string value of TRUE or FALSE.
3. Figuring out that we weren't in a Rails environment was one of those face palm moments — you've seen the meme, the one with Picard.  I'm more than a bit embarrassed to point out how long that took so we're just going to move on past that issue.
4. Once we recognized that Figaro wasn't available and that we would never get a value for our environment variable key, it wasn't hard to write our own YAML reading routine.  That went thru a deploy cycle and we were fairly certain that it would be solved any minute now — what a crock!
5. What we found was that even though our YAML file had a structure of KEY_NAME=TRUE, we weren't getting back TRUE, we were getting back true.  So, of course, our if test which matched on 'TRUE' would fail.  
6. At this point we started testing using the IRB (remember you aren't using Rails) console and YAML parsing.  And this led us to realize that YAML has automatic type coercion for a range of possible true / false values. The first clue was when my editor showed color coding on the YAML value we had, but not when we changed it to something odd like "ASDF".  And we ultimately found the [YAML spec](https://yaml.org/type/bool.html) which takes about booleans.  Who even knew there was a spec for YAML???  Any of these in a YAML file will automatically get coerced into a boolean: *yY, yes, Yes, YES, n, N, no, No, NO, true, True, TRUE, false, False, FALSE, on, On, ON, off, Off, OFF*
7. I don't know about any other developer but to hell with that noise!  I changed our value from TRUE to 1.  And because I wasn't sure if that would come to me as a value or a string, I ended up with a logical check like this: [1,"1"].include?(ENV['DELETE_TMP_FILE_DAYS']).
8. The next hurdle was that we realized that it was ambiguous where we should be looking for the YAML file.  The backtrace indicated that the YAML file should be found on the box where Capistrano was executing but logically because the post deploy hook executes each node being deployed, it should be on that machine.  And given that there was an 11 minute minimum cycle time per attempt to figure this out, we simply said to heck with it and tested for each directory and read from whichever existed.  And don't even bring up the fact that the exception Ruby throws on an invalid directory isn't Errno::ENOENT but instead a system call exception.  Sheesh.
9. Once we finally got past nothing more than the boolean test of whether or not to run this (remember that's all we've been trying to do so far, isolate a boolean from inside the code base to an environment variable), we found the code failing entirely.  And this time the failure was weird and unclear.  It had the feeling that Capistrano itself was swallowing at least one exception.  Doing a read of the code line by line made is realize that the date time math was using a Rails-ism, 10.days.  And, remember, we aren't in Rails now (even though this is a Rails app), this is a Capistrano post deploy hook so we are really running an an IRB context without ActiveSupport.
10. And that brought in the need to treat this not as logical days but instead as old school Unix epoch math.  So it become a matter of comparing a File.ctime(path_to_file).to_i (for the epoch conversion) against Time.now.to_i - (10 * 86400).  My pairing partner wanted to bring in ActiveSupport for the clarity of the 10.days expression but I was having none of that, ActiveSupport is a beast.
11. With each of these changes, we would make the code better and better, each time and we were finally at a point where the code was actually what even I would call good.  It was well structured, well written and clean.  

## Sidebar: What About Test Coverage

Someone out there reading this is pounding their desk and shouting "YOU SHOULDA WRITTEN TESTS DUMB ASS!!!".  Now normally I would agree with you but there are a few problems with that:

 * Rake tasks aren't well testable; God bless Jim Weirich but rake tasks have always been an aside to testing
 * There isn't, to my knowledge, a way to test a rake task that is executing under Capistrano and isn't actually part of Rails

## And that Brings Us to The Final Solution 

And with the code finally rewritten and being actually implemented in a very service object pattern, my co worker said "WAIT!  Why are we doing this as a Capistrano post deploy hook anyway?  Why isn't this just a CRON job calling a rake task"  This led to a discussion of the issues around CRON and [RbEnv](https://github.com/rbenv/rbenv) and the need for the DevOps around getting a CRON job installed on N boxes.  And then he said the magic incantation: "Why don't we just use [Ansible](https://www.ansible.com/) for this and execute it regularly via [Jenkins](https://jenkins.io/)?"  Ansible is an outstandingly good DevOps environment and one that I actually taught him.  My initial argument to him against Ansible was because this was fundamentally an imperative task and Ansible was declarative.  His counter was why not just use Ansible to solve this via a [bash shell expression](https://fuzzyblog.io/blog/linux/2019/05/09/linux-tip-find-all-files-older-than-10-days-and-delete-them.html).  I thought about it for a few, and, son of a bitch, he was right.  In about 40 minutes:

* We tossed out all of the Ruby
* We tossed out the entire Capistrano post deploy task
* We tossed out the invocation of the call back (ok I remembered this right now as I wrote this section of the blog post) 
* We spun up an Ansible Playbook and Role that executed a shell one liner and had it running on a dozen plus boxes.  This included researching and testing how to do this with shell.
* We defined a Jenkins scheduled task that ran this every 7 days at an off time using a simple CRON syntax

Here is the before / after on the final Ansible implementation showing the change in our disc space utilization:

### BEFORE

    ok: [194.55.22.38] =>
      msg: 'Actual free disc space: 5.3G'
    ok: [194.55.19.230] =>
      msg: 'Actual free disc space: 5.6G'
    ok: [194.55.23.18] =>
      msg: 'Actual free disc space: 5.6G'
    ok: [194.55.23.10] =>
      msg: 'Actual free disc space: 8.5G'
    ok: [194.55.30.164] =>
      msg: 'Actual free disc space: 8.5G'
    ok: [194.55.20.214] =>
      msg: 'Actual free disc space: 11G'
    ok: [194.55.30.119] =>
      msg: 'Actual free disc space: 8.2G'
    ok: [194.55.29.248] =>
      msg: 'Actual free disc space: 8.7G'
    ok: [194.55.26.185] =>
      msg: 'Actual free disc space: 6.7G'
    ok: [194.55.24.235] =>
      msg: 'Actual free disc space: 6.6G'
    ok: [194.55.30.37] =>
      msg: 'Actual free disc space: 2.3G'
    ok: [194.55.31.216] =>
      msg: 'Actual free disc space: 2.4G'
    ok: [194.55.29.170] =>
      msg: 'Actual free disc space: 11G'
    ok: [194.55.29.107] =>
      msg: 'Actual free disc space: 11G'
  
### AFTER

    ok: [194.55.22.38] =>
      msg: 'Actual free disc space: 5.3G'
    ok: [194.55.19.230] =>
      msg: 'Actual free disc space: 5.8G'
    ok: [194.55.23.18] =>
      msg: 'Actual free disc space: 5.8G'
    ok: [194.55.23.10] =>
      msg: 'Actual free disc space: 8.5G'
    ok: [194.55.30.164] =>
      msg: 'Actual free disc space: 8.5G'
    ok: [194.55.20.214] =>
      msg: 'Actual free disc space: 11G'
    ok: [194.55.30.119] =>
      msg: 'Actual free disc space: 8.3G'
    ok: [194.55.29.248] =>
      msg: 'Actual free disc space: 8.7G'
    ok: [194.55.26.185] =>
      msg: 'Actual free disc space: 6.7G'
    ok: [194.55.24.235] =>
      msg: 'Actual free disc space: 6.6G'
    ok: [194.55.30.37] =>
      msg: 'Actual free disc space: 7.2G'
    ok: [194.55.31.216] =>
      msg: 'Actual free disc space: 7.0G'
    ok: [194.55.29.170] =>
      msg: 'Actual free disc space: 11G'
    ok: [194.55.29.107] =>
      msg: 'Actual free disc space: 11G'

You'll notice that boxes 194.55.30.37 and 194.55.31.216 went from 2 odd gigs of free disc space to 7 odd gigs of disc space.  That's a huge win.  

## Conclusion

The hardest part about debugging anything is when your mental model doesn't match what's actually going on under the hood.  The actual epiphany moment was when I realized that this wasn't running under Rails itself.  After that things started to fall into place.

## Thank Yous

A big shout out to Sean Kennedy who did a fantastic job debugging this with me and came up with a great final solution.  Kudos also to various friends who im'd with me over the course of the day and provided moral support on an extremely frustrating day. 