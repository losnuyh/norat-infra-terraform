output "alb_dns" {
  value = module.application.alb_dns
}

output "application_instance_private_dns_list" {
  value = module.application.application_instance_private_dns_list
}
