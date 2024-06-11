provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sentry" {
  ami           = "ami-00beae93a2d981137" 
  instance_type = "m5zn.xlarge" 

  tags = {
    Name = "SentryServer"
  }

  key_name = "Terraform_key" 

  root_block_device {
    volume_size = 30 
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              EOF


  vpc_security_group_ids = [aws_security_group.sentry_sg.id]
}

resource "aws_security_group" "sentry_sg" {
  name        = "sentry-sg"
  description = "Allow traffic to Sentry instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
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

output "instance_ip" {
  value = aws_instance.sentry.public_ip
}
