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
  tags = {
    Name = "Ubuntu"
  }
}

resource "aws_key_pair" "deployer" {
   key_name   = "id_rsa"
   public_key = var.public_key
}