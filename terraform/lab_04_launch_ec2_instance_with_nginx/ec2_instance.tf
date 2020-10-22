terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default" # Profile name in the ~/.aws/credentials
  region  = var.region
}

resource "aws_instance" "ubuntu" {
  count         = 1
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  key_name      = "deployer"
  tags = {
    Name = "Ubuntu"
  }

  connection {
    host        = self.public_ip
    user        = "root"
    type        = "ssh"
    private_key = file(var.private_key)
    timeout     = "2m"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = var.public_key
}
