provider "aws" {
    region = "us-east-1"
}

# Configure a single EC2 Instance. 
# Because we have not specified any VPC ID, this instance would be deployed in the default VPC with the subnet chosen at random.

resource "aws_instance" "server1" {
    ami = "ami-0a6b2839d44d781b2"
    instance_type = "t2.mirco"

    tags = {
        Name = "tf-server1"
    }
}
