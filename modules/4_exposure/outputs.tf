output "static_cloudfront_domain_name" {
  value = module.cloudfront.static_cloudfront_domain_name
}

output "github_role_arn" {
  value = module.github_deploy_role.github_role_arn
}