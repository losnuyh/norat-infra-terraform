resource "aws_cloudfront_origin_access_control" "static-file-s3-oac" {
  name                              = "${var.project} ${var.env} static s3 OAC"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

locals {
  s3_origin_id = "${var.project}-${var.env}-static-bucket-origin"
}

resource "aws_cloudfront_distribution" "static" {
  enabled = true

  origin {
    domain_name = var.static_bucket_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.static-file-s3-oac.id
    origin_id = local.s3_origin_id
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.norat_static_domain.arn
    ssl_support_method = "sni-only"
  }

  aliases = [aws_acm_certificate.norat_static_domain.domain_name]

  default_cache_behavior {
    allowed_methods        = ["HEAD", "GET"]
    cached_methods         = ["HEAD", "GET"]
    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"

      locations = []
    }
  }
}