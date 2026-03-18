provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "web" {
  count         = 4
  ami           = "ami-0c1c30571d2dae5c9" # Ubuntu (cambia según región)
  instance_type = "t2.micro"

  associate_public_ip_address = true

  tags = {
    Name = "web-${count.index}"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
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