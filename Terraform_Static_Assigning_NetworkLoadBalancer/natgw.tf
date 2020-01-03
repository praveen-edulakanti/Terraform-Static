resource "aws_nat_gateway" "NATGateway1a" {
  allocation_id = aws_eip.NAT1a.id
  subnet_id     = aws_subnet.PublicSubnet1a.id

  tags = {
    Name = "NATGateway-1a"
	Terraformed = "True"
  }
}

resource "aws_nat_gateway" "NATGateway1b" {
  allocation_id = aws_eip.NAT1b.id
  subnet_id     = aws_subnet.PublicSubnet1b.id

  tags = {
    Name = "NATGateway-1b"
	Terraformed = "True"
  }
}