terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "coldsis"
}

resource "aws_subnet" "project_public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "project_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}