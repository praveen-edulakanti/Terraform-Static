resource "aws_route53_record" "Route53Name" {
  zone_id = "Z24SDMK7FWJ00J"
  name    = "edulakanti.info"
  type    = "A"

  alias {
    name                   = aws_lb.LoadBalancer.dns_name
    zone_id                = aws_lb.LoadBalancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z24SDMK7FWJ00J"
  name    = "www.edulakanti.info"
  type    = "A"

  alias {
    name                   = aws_lb.LoadBalancer.dns_name
    zone_id                = aws_lb.LoadBalancer.zone_id
    evaluate_target_health = true
  }
}