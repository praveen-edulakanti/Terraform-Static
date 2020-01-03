resource "aws_security_group" "PublicSecurityGrp" {
  name        = "PublicSecurityGroup"
  description = "Allow Permission for Public Security Group inbound traffic"
  vpc_id      =  aws_vpc.DemoVPC.id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
	#add your IP address here
  }
  
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
	#add your IP address here
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PublicSecurityGroup"
	Terraformed = "True"
  }
}

resource "aws_security_group" "PrivateSecurityGrp" {
  name        = "PrivateSecurityGroup"
  description = "Allow Permission for Private Security Group inbound traffic"
  vpc_id      =  aws_vpc.DemoVPC.id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add your IP address here
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PrivateSecurityGroup"
	Terraformed = "True"
  }
}

resource "aws_security_group" "LoadBalSecurityGrp" {
  name        = "LoadBalSecurityGroup"
  description = "Allow Permission for Load Balancer Security Group inbound traffic"
  vpc_id      =  aws_vpc.DemoVPC.id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add your IP address here
  }
  
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add your IP address here
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LoadBalSecurityGroup"
	Terraformed = "True"
  }
}

resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  #cidr_blocks = "0.0.0.0/0"# add a CIDR block here
  source_security_group_id = aws_security_group.LoadBalSecurityGrp.id
  security_group_id = aws_security_group.PrivateSecurityGrp.id
  
}

