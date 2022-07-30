---
layout: post
title: Using Ansible as a Development Tool with Rails and AWS for Large Scale Data Processing Automation
category: aws
tags: ["ansible", "aws", "rails", "ruby", "shell", "bash", "sidekiq", "devops", "meta_programming"]
description: We all think of Ansible as a devops tool but here I illustrate how Ansible can be a valuable application development environment.
image: https://img.stackshare.io/service/663/ElOjna20.png
---
{% pizzaforukraine  %}

Man it was a hell of a busy week last week.  Here's an illustration:

    ~/me/appdatallc/ansible-clean [master|✚ 1…1]
    01:34 $ find . -name '*.yml' | xargs wc -l
    ...
    283 total

    ~/me/appdatallc/ansible_monthly [master|✔]
    find . -name '*.yml' | xargs wc -l
    ...
     1066 total

Yep.  Starting last week, from Monday morning to Friday afternoon, working with [Winston](http://winstonkotzan.com/) to teach him [Ansible](https://www.ansible.com/), I authored almost 1,300 lines of Ansible. 

The really interesting part of this was using Ansible as a **development tool** with Rails.  The use case in question was automating production of large scale data processing jobs.  Example what these jobs did is highly proprietary but they basically had a shared architecture like this: 

* Execute on a developer's workstation
* Verify state of the application by calling an API server side
* Change the thread count as needed for the right amount of concurrency
* Clear the rails log
* Set the right redis server to isolate sidekiq from other concurrently executing jobs
* Clear the Sidekiq log
* Make an AMI of the EC2 instance
* Launch N instances of the AMI to do the needed data processing
* Fill the Sidekiq queue
* Display the count of items in the Sidekiq queue

There were a series of 8 different data processing jobs, 6 of which matched the above list and two of which were slightly different.  Each of the stages above was represented by a small Ansible playbook and the coordination between each of the playbooks was handled by a bash script which called each of the stages in succession.  

Classically Ansible is a devops tool for provisioning boxes but last week really illustrated to me the power of **Ansible as a development tool**.  Ansible's idempotent, state based approach of modeling the world as a succession of yaml files can definitely be funky but the model works.  

# Adding Status Tracking

Early Friday I realized that once these jobs were running, the developer running them would need to understand the status of the job on a highly discrete level.  Historically I've done this by directly querying the database and just *understanding* the objects involved and the tables that represent them.  But that comes from a huge amount of internal domain knowlege that Winston didn't have.  

This status would need to include:

* Amount of data left in the sidekiq queue 
* Amount of records produced for each job 

Sure in an idealized world this would be a pretty, graphical dashboard available on the web to all people in the company.  Practically speaking, the following is sufficient:

    TASK [run_rake_task_and_show_output : debug] *****************************
    ok: [monthly-categorization] => {
        "msg": [
            "in LoadError rescue statement",
            "Queue Size = 0",
            "Total categorization records = 271408",
            "Total distinct entities in categorization = 6783"
        ]
    }

The ability to run this at any point in the process is hugely useful and here's an example of how simple that code can be.  There are three key pieces:

* Ansible Playbook - a playbook which defined a Rake namespace and task to be executed
* Ansible Role - essentially a function which executes the Rake namespace and task, capturing its output and displaying it
* Rake Task - the business logic of what to analyze

## Ansible Playbook

```ansible      
    - hosts: monthly-categorization
      become: yes
      remote_user: ubuntu
      vars:
        - rake_task: "monthly:echo_stats"
      roles:
        - { role: run_rake_task_and_show_output }
```        
    
## Ansible Role

```ansible    
    - name: run a rake task on the target box
      shell: 
        chdir: /var/www/apps/rails_app/current
        cmd:  RAILS_ENV=production bundle exec rake {{ rake_task }}
      register: result

    - debug:
        msg: "{{ result.stdout.split('\n') }}"
```        
        
My first pass on all this had the output being listed as a jumbled mess (typical to captured output by Ansible).  Winston correctly pointed out something to the effect of "Looks a bit like arse".  Well a quick google led to this [StackOverflow post](http://stackoverflow.com/questions/34188167/ansible-print-message-debug-msg-line1-n-var2-n-line3-with-var3) where this technique:

> msg: "{{ msg.split('\n') }}"

could be applied.  In our case we had it as result so it was just a matter of replacing msg with result.stdout.  And, almost magically, that jumbled mess came into razor sharp focus.  My thanks to Winston for recognizing that this was an issue.  I was so close to the problem that I didn't even perceive it.
    
## Rake task being called by Playbook:

```ruby    
    task :echo_stats => :environment do
      j = Job.current
      data_shard = ShardedData.shard_for_date("service", j.date)
      distinct_entities = data_shard.select("entity_id").distinct.count
    
      puts "Queue Size = #{Sidekiq::Queue.new.size}"
      puts "Total categorization records from #{j.current.id} = #{data_shard.count}"    
      puts "Total distinct entity_ids in categorization from #{j.current.id} = #{distinct_entities}"    
    end
```
    
A more complex example of this based on Ruby meta-programming is shown below:

```ruby
    task :echo_other_stats => :environment do
      tables = []
      tables << "rating_estimates"
      tables << "type_estimates"
      tables << "category_estimates"
    
      stats = {}
    
      tables.each do |table|
        stats[table] = table.classify.constantize.where(:job_id => Job.current.id).count
      end
    
      stats.each do |k,v|
        puts "Table: #{k} = #{v} for Processing Run #{ProcessingRun.current.id}"
      end
    end
```

    
This approach was based on some internal analysis logic where we had an array of table names that we used for generating some SQL code dynamically.  It took about 5 minutes to convert that list of tables into this.  The table.classify.constantize call takes the name of the table and first converts it to a model name (classify) and the converts that model name to a constant that represents the class itself.  Once you have a class that inherits from ActiveRecord you can then call a .where statement to get a count.  Finally you inject the original table name and the count back into a hash to store the results.

# Conclusion

I've been managing this job production process for almost two years now and most of my approaches to making it better have evolved around different rake tasks and some fairly bad internal documentation.  By pulling Ansible into this, for the first time, we actually have a solution which:

* Goes end to end 
* Automates tasks like AMI creation and instance launching historically done with the AWS developer console
* Allows use of N instances to process the data 
* Fully uses our existing code base without change -- I can't emphasize this point enough
* Displays status on the running jobs at any point
* Is broken down into small, modular chunks -- each of our playbooks are maybe 10 lines in total

Ansible isn't how I expected to solve this problem but its approach really, really worked -- keep it in mind.