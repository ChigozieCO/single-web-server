provider "aws" {
  region = "us-east-1"
}

# Configure a single EC2 Instance. 
# Because we have not specified any VPC ID, this instance would be deployed in the default VPC with the subnet chosen at random.

resource "aws_instance" "server1" {
  ami                    = "ami-0a6b2839d44d781b2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.server1-SG.id]

  # This Bash script is what will be used to the return the "hello world" text on our web server.

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello, World" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF

  user_data_replace_on_change = true

  tags = {
    Name = "tf-server1"
  }
}

# Now we will create a security to allow HTTP traffic to reach our web server (we are using port 8080, rather than the default HTTP port 80, as listening on any port less than 1024 requires root user privileges. 
# This is a security risk, because any attacker who manages to compromise your server would get root privileges, too.)
resource "aws_security_group" "server1-SG" {
  name = "server1-SG"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}