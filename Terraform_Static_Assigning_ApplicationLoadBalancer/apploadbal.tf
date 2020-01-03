resource "aws_lb" "LoadBalancer" {
  name               = "LoadBalancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.PublicSubnet1a.id, aws_subnet.PublicSubnet1b.id]

  enable_deletion_protection = false

  tags = {
    Name = "LoadBalancer"
    Terraformed = "True"
  }
}

resource "aws_lb_target_group" "HTTPGrp" {
  name     = "TargetGrp1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.DemoVPC.id
  
  stickiness {
    enabled = false
    type = "lb_cookie"
  }
}

resource "aws_lb_target_group" "HTTPSGrp" {
  name     = "TargetGrp2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.DemoVPC.id
  stickiness {
    enabled = false
    type = "lb_cookie"
  }
}

resource "aws_lb_listener" "Listener80" {
  load_balancer_arn   = aws_lb.LoadBalancer.arn
  port                = 80
  protocol            = "HTTP"

  default_action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.HTTPGrp.arn
  }
}

resource "aws_lb_listener" "Listener443" {
  load_balancer_arn = aws_lb.LoadBalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::863896359115:server-certificate/EdulakantiInfoCertificate"
  #certificate_arn   = " arn:aws:acm:ap-south-1:863896359115:certificate/13492c39-a0af-4d9d-a0da-9053c84b9227"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.HTTPSGrp.arn
  }
}

resource "aws_lb_target_group_attachment" "HTTPGrpAttachmentInst1" {
  target_group_arn = aws_lb_target_group.HTTPGrp.arn
  target_id        = aws_instance.PrivateInstance1.id
  port             = 80
}

/*resource "aws_lb_target_group_attachment" "HTTPGrpAttachmentInst2" {
  target_group_arn = aws_lb_target_group.HTTPGrp.arn
  target_id        = aws_instance.PrivateInstance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "HTTPSGrpAttachmentInst1" {
  target_group_arn = aws_lb_target_group.HTTPSGrp.arn
  target_id        = aws_instance.PrivateInstance1.id
  port             = 80
}*/

resource "aws_lb_target_group_attachment" "HTTPSGrpAttachmentInst2" {
  target_group_arn = aws_lb_target_group.HTTPSGrp.arn
  target_id        = aws_instance.PrivateInstance2.id
  port             = 80
}

#Application Load Balancer
resource "aws_lb_listener_rule" "http80" {
  listener_arn = aws_lb_listener.Listener80.arn
  priority     = 90

  action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.HTTPGrp.arn
  }

  condition {
    field  = "path-pattern"
    values = ["/user*"]
  }
  
}

resource "aws_lb_listener_rule" "http80-1" {
  listener_arn = aws_lb_listener.Listener80.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.HTTPGrp.arn
  }

  condition {
    field  = "path-pattern"
    values = ["/dashboard*"]
  }
}

resource "aws_lb_listener_rule" "http443" {
  listener_arn = aws_lb_listener.Listener443.arn
  priority     = 90

  action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.HTTPSGrp.arn
  }
  
  condition {
    field  = "path-pattern"
    values = ["/user*"]
  }
  
}

resource "aws_lb_listener_rule" "http443-1" {
  listener_arn = aws_lb_listener.Listener443.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.HTTPSGrp.arn
  }
  
  condition {
    field  = "path-pattern"
    values = ["/dashboard*"]
  }
}


