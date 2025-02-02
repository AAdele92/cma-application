resource "aws_acm_certificate" "cert" {
  domain_name       = "cma-app-${var.environment}.deledemo.com"
  validation_method = "DNS"

  tags = {
    Environment = "cma"
  }

  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_route53_record" "cma_app_cert_record" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      zone_id = var.zone_id
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = each.value.zone_id
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cma_app_cert_record : record.fqdn]
}
