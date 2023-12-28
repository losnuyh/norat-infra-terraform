provider "aws" {
  alias = "virginia"
  region = "us-east-1"
}

resource "aws_acm_certificate" "norat_static_domain" {
  provider = aws.virginia

  domain_name = "static.${var.root_domain}"
  validation_method = "DNS"
}

resource "aws_route53_record" "norat_static_domain" {
  for_each = {
    for dvo in aws_acm_certificate.norat_static_domain.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.norat_io_url.zone_id
}

resource "aws_acm_certificate_validation" "norat_static_domain" {
  provider = aws.virginia
  certificate_arn = aws_acm_certificate.norat_static_domain.arn
  validation_record_fqdns = [for record in aws_route53_record.norat_static_domain : record.fqdn]
}

resource "aws_route53_record" "static_record" {
  name    = aws_acm_certificate.norat_static_domain.domain_name
  type    = "CNAME"
  zone_id = data.aws_route53_zone.norat_io_url.zone_id
  ttl = 300
  records = [aws_cloudfront_distribution.static.domain_name]
}