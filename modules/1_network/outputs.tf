output "vpc_id" {
  value = module.vpc.vpc_id
}

output "bastion_public_dns" {
  value = module.bastion.bastion_public_dns
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "bastion_sg_id" {
  value = module.security_group.bastion_sg_id
}

output "aurora_mysql_sg_id" {
  value = module.security_group.aurora_mysql_sg_id
}

output "alb_sg_id" {
  value = module.security_group.alb_sg_id
}

output "app_instance_sg_id" {
  value = module.security_group.app_instance_sg_id
}

output "bastion_ssh_key_name" {
  value = module.bastion.bastion_ssh_key_name
}

