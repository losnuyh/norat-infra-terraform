module "exposure" {
  source = "../../../modules/4_exposure"
  project = var.project
  env = var.env
  region = var.region
  static_bucket_domain_name = var.static_bucket_domain_name
  static_bucket_id = var.static_bucket_id
  static_bucket_arn = var.static_bucket_arn
  root_domain = var.root_domain
  api_app_invoke_url = var.api_app_invoke_url
  api_app_api_id = var.api_app_api_id
  api_app_apigateway_stage_name = var.api_app_apigateway_stage_name
  api_lambda_function_arn = var.api_lambda_function_arn
}
