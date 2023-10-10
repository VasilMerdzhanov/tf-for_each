terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "example" {
  for_each = {
    ami_amazon = "ami-067d1e60475437da2"
    ami_ubuntu = "ami-053b0d53c279acc90"
  }

  ami           = each.value
  instance_type = "t2.micro"
  tags = {
    Name = "example-instance-${each.key}"
  }
}