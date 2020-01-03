resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.DemoVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.InternetGateway.id
  }

  tags = {
    Name = "PublicRouteTable"
	Terraformed = "True"
  }
}


resource "aws_route_table_association" "PublicRTAssociation1a" {
  subnet_id      = aws_subnet.PublicSubnet1a.id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "PublicRTAssociation1b" {
  subnet_id      = aws_subnet.PublicSubnet1b.id
  route_table_id = aws_route_table.PublicRT.id
}

