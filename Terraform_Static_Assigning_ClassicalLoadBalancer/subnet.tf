resource "aws_subnet" "PublicSubnet1a" {
  vpc_id     = aws_vpc.DemoVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-1a"
	Terraformed = "True"
  }
}

resource "aws_subnet" "PublicSubnet1b" {
  vpc_id     = aws_vpc.DemoVPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-1b"
	Terraformed = "True"
  }
}

resource "aws_subnet" "PrivateSubnet1a" {
  vpc_id     = aws_vpc.DemoVPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet-1a"
	Terraformed = "True"
  }
}

resource "aws_subnet" "PrivateSubnet1b" {
  vpc_id     = aws_vpc.DemoVPC.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet-1b"
	Terraformed = "True"
  }
}