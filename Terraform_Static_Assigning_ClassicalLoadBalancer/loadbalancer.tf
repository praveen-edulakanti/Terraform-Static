# Create a new load balancer
resource "aws_elb" "LoadBalancer" {
  name      = "LoadBalancer"
  subnets = [aws_subnet.PublicSubnet1a.id, aws_subnet.PublicSubnet1b.id]
  security_groups = [aws_security_group.LoadBalSecurityGrp.id]
  #availability_zones = ["ap-south-1a", "ap-south-1b"]

  #access_logs {
    #bucket        = "foo"
    #bucket_prefix = "bar"
    #interval      = 60
  #}

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::AccountID:server-certificate/CertificateName"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 10
  }

  instances                   = [aws_instance.PrivateInstance1.id, aws_instance.PrivateInstance2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "LoadBalancer"
	Terraform = true
  }
}
