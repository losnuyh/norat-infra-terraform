module "lambda" {
  source = "./lambda"
  project = var.project
  env = var.env
  private_subnet_ids = var.private_subnet_ids
  api_lambda_sg_id = var.api_lambda_sg_id
  default_api_lambda_deploy = var.default_api_lambda_deploy
  api_lambda_source_dir = var.api_lambda_source_dir
}

module "api_gateway" {
  source = "./api_gateway"
  project = var.project
  region = var.region
  env = var.env
  api_lambda_invoke_arn = module.lambda.api_lambda_invoke_arn
  api_lambda_function_name = module.lambda.api_lambda_function_name
}
