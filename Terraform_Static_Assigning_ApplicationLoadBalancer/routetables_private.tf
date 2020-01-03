##################################################

resource "aws_route_table" "PrivateRT1a" {
  vpc_id = aws_vpc.DemoVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NATGateway1a.id
  }

  tags = {
    Name = "PrivateRouteTable-1a"
	Terraformed = "True"
  }
}

resource "aws_route_table_association" "PrivateRTAssociation1a" {
  subnet_id      = aws_subnet.PrivateSubnet1a.id
  route_table_id = aws_route_table.PrivateRT1a.id
}

##################################################
resource "aws_route_table" "PrivateRT1b" {
  vpc_id = aws_vpc.DemoVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NATGateway1b.id
  }


  tags = {
    Name = "PrivateRouteTable-1b"
  }
}

resource "aws_route_table_association" "PrivateRTAssociation1b" {
  subnet_id      = aws_subnet.PrivateSubnet1b.id
  route_table_id = aws_route_table.PrivateRT1b.id
}
