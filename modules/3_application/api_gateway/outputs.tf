output "api_app_invoke_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}

output "api_app_api_id" {
  value = aws_api_gateway_rest_api.app.id
}

output "stage_name" {
  value = aws_api_gateway_stage.main.stage_name
}

output "admin_api_app_invoke_url" {
  value = aws_api_gateway_deployment.admin_deployment.invoke_url
}

output "admin_api_app_api_id" {
  value = aws_api_gateway_rest_api.admin_app.id
}

output "admin_stage_name" {
  value = aws_api_gateway_stage.admin_main.stage_name
}
