resource "aws_internet_gateway" "InternetGateway" {
  vpc_id = aws_vpc.DemoVPC.id

  tags = {
    Name = "InternetGateway"
	Terraformed = "True"
  }
}