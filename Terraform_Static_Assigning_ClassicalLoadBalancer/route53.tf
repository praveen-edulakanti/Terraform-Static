resource "aws_route53_record" "Route53Name" {
  zone_id = ""
  name    = "edulakanti.info"
  type    = "A"

  alias {
    name                   = aws_elb.LoadBalancer.dns_name
    zone_id                = aws_elb.LoadBalancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = ""
  name    = "www.edulakanti.info"
  type    = "A"

  alias {
    name                   = aws_elb.LoadBalancer.dns_name
    zone_id                = aws_elb.LoadBalancer.zone_id
    evaluate_target_health = true
  }
}