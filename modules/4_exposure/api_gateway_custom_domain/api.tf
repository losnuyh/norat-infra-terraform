provider "aws" {
  alias   = "virginia"
  region  = "us-east-1"
}

resource "aws_acm_certificate" "norat_api" {
  provider = aws.virginia

  domain_name = "api.${var.root_domain}"
  validation_method = "DNS"
}

resource "aws_route53_record" "norat_api" {
  for_each = {
    for dvo in aws_acm_certificate.norat_api.domain_validation_options : dvo.domain_name => {
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
  zone_id         = var.domain_zone_id
}

resource "aws_acm_certificate_validation" "norat_api" {
  provider = aws.virginia
  certificate_arn         = aws_acm_certificate.norat_api.arn
  validation_record_fqdns = [for record in aws_route53_record.norat_api : record.fqdn]
}

resource "aws_api_gateway_domain_name" "norat_api" {
  depends_on = [aws_acm_certificate.norat_api]

  domain_name = "api.${var.root_domain}"
  certificate_arn = aws_acm_certificate.norat_api.arn
  security_policy = "TLS_1_2"

  endpoint_configuration {
    types = ["EDGE"]
  }
}

resource "aws_api_gateway_base_path_mapping" "main" {
  api_id      = var.api_app_api_id
  domain_name = aws_api_gateway_domain_name.norat_api.id
  stage_name  = var.api_app_apigateway_stage_name
}

resource "aws_route53_record" "main" {
  name    = aws_api_gateway_domain_name.norat_api.domain_name
  type    = "A"
  zone_id = var.domain_zone_id

  alias {
    name                   = aws_api_gateway_domain_name.norat_api.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.norat_api.cloudfront_zone_id
    evaluate_target_health = true
  }
}
