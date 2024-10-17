resource "aws_route53_record" "cma_app_route53" {
  zone_id = var.zone_id
  name    = "cma-app-${var.environment}.deledemo.com"
  type    = "A"
  alias {
    name                   = aws_lb.cma_app_lb.dns_name
    zone_id                = aws_lb.cma_app_lb.zone_id
    evaluate_target_health = true
  }
}