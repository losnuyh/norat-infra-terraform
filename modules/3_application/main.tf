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

module "app_parameter" {
  source = "./app_parameter"
  project = var.project
  env = var.env
  database_name = var.database_name
  write_db_host = var.write_db_host
  write_db_user_name = var.write_db_user_name
  write_db_user_password = var.write_db_user_password
  read_db_host = var.read_db_host
  read_db_user_name = var.read_db_user_name
  read_db_user_password = var.read_db_user_password
  db_port = var.db_port
  cool_sms_api_key =  var.cool_sms_api_key
  cool_sms_api_secret_key = var.cool_sms_api_secret_key
  cool_sms_send_phone_number = var.cool_sms_send_phone_number
  jwt_signing_private_key = var.jwt_signing_private_key
  neis_key = var.neis_key
}