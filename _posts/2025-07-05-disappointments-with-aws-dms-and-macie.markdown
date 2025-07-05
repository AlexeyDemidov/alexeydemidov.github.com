---
layout: single
title: "Disappointments with AWS Database Migration Service and Macie"
date: 2025-07-05 10:51:40 +0400
comments: true
categories: DevOps
---

AWS Database Migration Service is probably my worst experience with AWS services so far. Wasted half a day just trying to start a replication instance. It appeared to have been stuck in the `Starting...` state. There is no progress indicator, no logs. I was blindly changing security groups, adding VPC endpoints, subnets, tweaking IAM roles and attached policies, searching CloudWatch and CloudTrail. I read the entire sections on replication instances and troubleshooting in the AWS DMS documentation through and through, hoping to find any hints on how to turn on the logs for the instance creation.

Then I found [an old GitHub issue][1] for the Terraform AWS provider that suggested increasing default timeouts to 15 minutes. Given that the DMS replication instances use the same classes as EC2, I expected them to start within a few minutes and waited for 10 minutes before assuming that it hung. It actually took 17 minutes to start an instance in my case. The current [default timeout][2] for the `aws_dms_replication_instance` terraform resource is 40 minutes.

When I got the instance running, the fun didn't end. First, it didn't like the database password due to some special characters. The database accepted that password. The AWS Secrets Manager also accepted it. DMS - nope, there are some characters I can't handle.  Ok, no problem, just generated a long alphanumeric password. Then I tried to run 'Pre-migration assessments'. One of the tests failed to run at all, but no error logs again. Try to run it again - the assessment fails to run at all. Ok, not important, move on. Try to run the migration task itself. It failed. CloudWatch logs contain a lot of output, but don't tell why the task failed. Ok, when you click on the task status in the console, it shows that it ran out of memory. With a database that can fit entirely into the memory even on t3.micro. Ok, another 20 minutes of waiting to change the instance class. Try again, run out of memory again. Didn't log the memory failure into CloudWatch logs. Another 20 minutes of waiting.

When I finally got the tables dumped into S3 in Parquet format and moved to the final goal of this adventure: run AWS Macie to detect sensitive information. Another disappointment - it detected only two entries, and one was a false positive. In the end, it was more efficient to review the SQL dump manually - I spent half the time I wasted on DMS and Macie and found more than 30 columns in different tables with sensitive information.

[1]:https://github.com/hashicorp/terraform-provider-aws/issues/1182
[2]:https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_instance#timeouts
