resource "aws_instance" "PublicInstance" {
	ami = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
	availability_zone = "ap-south-1a"
	instance_type = "t2.micro"
	#key_name = aws_key_pair.terraform-demo.key_name
	key_name = "terraform-demo"
	vpc_security_group_ids = [aws_security_group.PublicSecurityGrp.id]
	subnet_id = aws_subnet.PublicSubnet1a.id
	associate_public_ip_address = true
	user_data = file("install_apache.sh")
	tags = {
		Name = "PublicInstance"	
		Terraform = true
	}
}

resource "aws_instance" "PrivateInstance1" {
	ami = "ami-0123b531fc646552f"
	availability_zone = "ap-south-1a"
	instance_type = "t2.micro"
	#key_name = aws_key_pair.terraform-demo.key_name
	key_name = "terraform-demo"
	vpc_security_group_ids = [aws_security_group.PrivateSecurityGrp.id]
	subnet_id = aws_subnet.PrivateSubnet1a.id
	user_data = file("install_apache1.sh")
	tags = {
		Name = "PrivateInstance1"	
		Terraform = true
	}
}

resource "aws_instance" "PrivateInstance2" {
	ami = "ami-0123b531fc646552f"
	availability_zone = "ap-south-1b"
	instance_type = "t2.micro"
	#key_name = aws_key_pair.terraform-demo.key_name
	key_name = "terraform-demo"
	vpc_security_group_ids = [aws_security_group.PrivateSecurityGrp.id]
	subnet_id = aws_subnet.PrivateSubnet1b.id
	user_data = file("install_apache2.sh")
	tags = {
		Name = "PrivateInstance2"	
		Terraform = true
	}
}