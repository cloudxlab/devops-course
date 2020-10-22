terraform {

  /* The provider block configures the named provider, in our case aws, which is responsible for creating and managing resources. A provider is a plugin that Terraform uses to translate the API interactions with the service. A provider is responsible for understanding API interactions and exposing resources. Because Terraform can interact with any API, you can represent almost any infrastructure type as a resource in Terraform. 
  */
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

/* 
The provider block configures the named provider, in our case aws, which is responsible for creating and managing resources. A provider is a plugin that Terraform uses to translate the API interactions with the service. A provider is responsible for understanding API interactions and exposing resources. Because Terraform can interact with any API, you can represent almost any infrastructure type as a resource in Terraform.

*/

provider "aws" {
  profile = "default" # Profile name in the ~/.aws/credentials
  region  = "us-west-1"
}

/*
The resource block defines a piece of infrastructure. A resource might be a physical component such as an EC2 instance, or it can be a logical resource such as a Heroku application.
*/

resource "aws_instance" "ubuntu" {
  count         = 1
  ami           = "ami-03fac5402e10ea93b"
  instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu"
  }
}
