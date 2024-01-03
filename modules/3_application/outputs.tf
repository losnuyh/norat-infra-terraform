output "api_app_invoke_url" {
  value = module.api_gateway.api_app_invoke_url
}

output "api_app_api_id" {
  value = module.api_gateway.api_app_api_id
}

output "stage_name" {
  value = module.api_gateway.stage_name
}

output "api_lambda_function_arn" {
  value = module.lambda.api_lambda_function_arn
}

output "api_lambda_function_name" {
  value = module.lambda.api_lambda_function_name
}
