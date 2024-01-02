output "static_cloudfront_domain_name" {
  value = module.exposure.static_cloudfront_domain_name
}

output "deploy_github_action_role_arn" {
  value = module.exposure.github_role_arn
}