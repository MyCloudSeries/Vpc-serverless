resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_subnet" "project_public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "project_public_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
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