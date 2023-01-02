## Deploying a Single Web Server

The idea is to create simple projects that are easy to replicate from day 1 (for the absolute novice) and then build on the knowledge and write more advanced codes for more complicated infrastructures.

This project will create an EC2 instance and run a web server on the instance.
The EC2 will be launched in one of our default VPC so if you have deleted the default VPC for the region you are using you can switch to a different region that still has it's default VPC.

The goal is to deploy the simplest web architecture possible: a single web server that can respond to HTTP requests

To keep it simple, the web server we would run will always return the text "Hello, World".

We will write a Bash script that writes the text “Hello, World” into index.html

:warning: AMI IDs are different in every AWS region, so if you change the region parameter to something other than us-east-1, you’ll need to manually look up the corresponding Ubuntu AMI ID for that region , and copy it into the ami parameter. As we advance, you’ll see how to fetch the AMI ID completely automatically