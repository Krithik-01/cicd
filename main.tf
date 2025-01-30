provider "aws" {
  access_key = "AKIA54WIGLYEIZ6UQZXM"
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "allow inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "appserver" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_all.name]

  associate_public_ip_address = true

  tags = {
    name = "appserver"
  }
}

output "ec2_public_ip" {
  value = aws_instance.appserver.public_ip
}
