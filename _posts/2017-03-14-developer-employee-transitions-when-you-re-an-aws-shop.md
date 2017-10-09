---
layout: post
title: Developer Employee Transitions When You're an AWS Shop
category: aws
tags: ["aws", "management"]
---
So I find myself advising a former employer on how to lock out an employee with fairly pervasive access (and, yes, I am the employee).  Here was my advice:

1.  The safest option would be to move to white listing **all** ip addresses needed for SSH login.  That would be an absolute ban on any incoming SSH logins from the old employee and, while inconvenient, is a wonderful means to lock down a system.
2.  [Re-issue a new SSH pem file](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair).
3.  Delete the old SSH pem file on your machine and then verify login to at least 2 systems with the new PEM file.  I'd make sure to verify access to the primary db server using the new PEM file but that's just me.
4.  [De-authorize the old PEM file](https://stackoverflow.com/questions/31912037/how-to-delete-deactivate-the-current-pem-file-and-create-new-one-in-aws).
5.  [Delete the API keys that the employee had access to](https://docs.aws.amazon.com/cli/latest/reference/apigateway/delete-api-key.html).  Make sure that you delete them in all regions where they were valid.
