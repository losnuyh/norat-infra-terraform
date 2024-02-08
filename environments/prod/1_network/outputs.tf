output "bastion_public_dns" {
  value = module.network.bastion_public_dns
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "bastion_sg_id" {
  value = module.network.bastion_sg_id
}

output "aurora_mysql_sg_id" {
  value = module.network.aurora_mysql_sg_id
}

output "bastion_ssh_key_name" {
  value = module.network.bastion_ssh_key_name
}

output "api_lambda_sg_id" {
  value = module.network.api_lambda_sg_id
}
