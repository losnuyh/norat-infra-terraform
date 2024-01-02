data "aws_route53_zone" "norat_io_url" {
  name = var.root_domain
  private_zone = false
}
