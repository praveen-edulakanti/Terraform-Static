resource "aws_vpc" "DemoVPC" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy ="default"
  enable_dns_hostnames = true

  
  tags = {
    Name = "DemoVPC"
	Terraformed = "True"
  }
  
}

