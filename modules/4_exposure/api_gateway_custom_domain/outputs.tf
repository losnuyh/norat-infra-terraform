output "custom_domain_api" {
  value = "https://${aws_api_gateway_base_path_mapping.main.domain_name}"
}
