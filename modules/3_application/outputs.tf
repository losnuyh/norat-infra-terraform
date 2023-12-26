output "alb_dns" {
  value = module.lb.alb_dns
}

output "application_instance_private_dns_list" {
  value = module.target_group.instance_private_dns_list
}
