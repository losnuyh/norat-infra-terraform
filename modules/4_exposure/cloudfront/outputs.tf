output "static_cloudfront_domain_name" {
  value = aws_cloudfront_distribution.static.domain_name
}