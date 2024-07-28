//1. create VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

//2. create subnet
variable "vpc_availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-west-2a", "us-west-2b"]
}


resource "aws_subnet" "publicA" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"
  tags = {
    Name = "PublicSubnetA"
  }
}


resource "aws_subnet" "publicB" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2b"
  tags = {
    Name = "PublicSubnetB"
  }
}


resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "PrivateSubnet"
  }
}
