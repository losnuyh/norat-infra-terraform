module "cloudfront" {
  source = "./cloudfront"
  project = var.project
  env = var.env
  static_bucket_domain_name = var.static_bucket_domain_name
  static_bucket_id = var.static_bucket_id
  static_bucket_arn = var.static_bucket_arn
  root_domain = var.root_domain
}
