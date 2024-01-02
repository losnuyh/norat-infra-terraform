output "api_app_invoke_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}

output "api_app_api_id" {
  value = aws_api_gateway_rest_api.app.id
}

output "stage_name" {
  value = aws_api_gateway_stage.main.stage_name
}
