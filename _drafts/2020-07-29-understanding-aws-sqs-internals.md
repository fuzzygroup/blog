---
layout: post
title: Understanding AWS SQS Internals
category: AWS
tags: ["AWS", "SQS"]
---
SQS, Amazon's Simple Queue Service, is one of those pieces of software that I view as close to pure magic. SQS provides a highly reliable queue that you can scale close to horizontally just by shoving more worker boxes in front of it.  But what does the underlying data in SQS actually look like?  I'm currently debugging some issues with my queue processors and I thought this was a great time 

messages
{'Messages': [{'MessageId': '4d42be40-e7c1-419c-a0c3-20cd2a73988b', 'ReceiptHandle': 'AQEB4Mb6cANwT4IZ4rhkA7+BNrVwRc/OOapZO3W1DdnKyeDrF2chySApdvnPTKrMlElWUMLlYJRQAIKneqD3t0jPt6mPiknMIL3B1q+DX+U95xniRoYh1iUfgVHI3w+jYVKN5K6GS0AH5XtSgmjEG1H0Q1M8oM0Aze+xsoceU6ufsinKs2xEb3TtoJg3d42LBbozlEghiQPm5vA4kduJO3xZU+TdXwYLNzdBPRc2DSdRLnasXZ7PXvZKaQRSLfEarHGG7H+eeJ0Bf6qAF82+AlvnW/TO2JGXVKYc3mBPhYlWwwSGvguBx9k3Petu176ssXkDMptXG5B+6svIlbiicj6wKhzCHnispcZT5tvJuWFRrZh3EX5jdOd+YEWbUxHb1Kom3UBTtSgUfuAOQmTjpd9P8A==', 'MD5OfBody': '705de2f047941d503565d58b46cbedf4', 'Body': '[{"bucket": 1592917500046, "sequence": 1592917524523800166, "sequence_range": 57846, "hashcode": "NkjskQhOO0bSijtKwax3BcKXq3Y", "resource": "https://twitter.com/_sandaaay/status/1275414506156339202", "date_found": "2020-06-23T13:05:24Z", "index_method": "TWITTER_TASK", "version": "6.5.338", "last_updated": "2020-06-23T13:05:24Z"
