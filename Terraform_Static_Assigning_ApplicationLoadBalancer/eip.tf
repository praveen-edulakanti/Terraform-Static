resource "aws_eip" "NAT1a" {
    vpc      = true
	tags = {
		Name = "EIP-1a"
		Terraformed = "True"
    }
}

resource "aws_eip" "NAT1b" {
    vpc      = true
	tags = {
		Name = "EIP-1b"
		Terraformed = "True"
    }
}