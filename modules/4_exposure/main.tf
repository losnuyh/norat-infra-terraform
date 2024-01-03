module "cloudfront" {
  source = "./cloudfront"
  project = var.project
  env = var.env
  static_bucket_domain_name = var.static_bucket_domain_name
  static_bucket_id = var.static_bucket_id
  static_bucket_arn = var.static_bucket_arn
  root_domain = var.root_domain
}

module "api_gateway_custom_domain" {
  source = "./api_gateway_custom_domain"
  project = var.project
  env = var.env
  api_app_invoke_url = var.api_app_invoke_url
  api_app_api_id = var.api_app_api_id
  api_app_apigateway_stage_name = var.api_app_apigateway_stage_name
  domain_zone_id = data.aws_route53_zone.norat_io_url.zone_id
  root_domain = var.root_domain
}

module "github_deploy_role" {
  source = "./github_deploy_role"
  project = var.project
  region = var.region
  env = var.env
  account_id = data.aws_caller_identity.current.account_id
  api_lambda_function_arn = var.api_lambda_function_arn
}