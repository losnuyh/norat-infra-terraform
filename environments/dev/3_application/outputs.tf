output "api_app_invoke_url" {
  value = module.application.api_app_invoke_url
}

output "api_app_api_id" {
  value = module.application.api_app_api_id
}

output "api_app_apigateway_stage_name" {
  value = module.application.stage_name
}

output "api_lambda_function_arn" {
  value = module.application.api_lambda_function_arn
}
