terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "Rengier" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t3a.xlarge"

  tags = {
    Name = "Hello Rengier Challenge 2"
  }
}

resource "aws_vpc" "rengier" {
 cidr_block = "10.0.0.0/16"

 tags = {
   Name = "Rengier VPC"
 }
}

resource "aws_subnet" "public_subnets" {
 count      = length(var.subnet)
 vpc_id     = var.vpc
 cidr_block = element(var.subnet, count.index)

 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
}

resource "tls_private_key" "private_key" {
  algorithm = "ECDSA"
}

resource "local_file" "key_details" {
  content  = tls_private_key.private_key.private_key_pem
  filename = "/home/derick/terraform-local-file/key.txt"

}

resource "local_file" "crazy" {
  content  = var.content
  filename = var.filename
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "local_file" "mypasswd" {
      content= random_password.password.result
      filename = "/home/derick/mypass.txt"
}
resource "aws_db_instance" "example" {
  instance_class    = "db.t3.micro"
  allocated_storage = 64
  engine            = "mysql"
  username          = "someone"
  password          = random_password.password.result
}

