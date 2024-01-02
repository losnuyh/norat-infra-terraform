output "static_bucket_domain_name" {
  value = module.s3.static_bucket_domain_name
}

output "static_bucket_id" {
  value = module.s3.static_bucket_id
}

output "static_bucket_arn" {
  value = module.s3.static_bucket_arn
}

output "db_write_host" {
  value = module.aurora-mysql.db_write_host
}

output "db_read_host" {
  value = module.aurora-mysql.db_read_host
}

output "db_port" {
  value = module.aurora-mysql.db_port
}
