terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

resource "aws_instance" "ubuntu_18.04" {
  ami = "ami-03fac5402e10ea93b"
  instance_type = "t2.micro"
}
