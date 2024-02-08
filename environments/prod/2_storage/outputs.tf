output "static_bucket_domain_name" {
  value = module.storage.static_bucket_domain_name
}

output "static_bucket_id" {
  value = module.storage.static_bucket_id
}

output "static_bucket_arn" {
  value = module.storage.static_bucket_arn
}

output "user_upload_bucket_arn" {
  value = module.storage.user_upload_bucket_arn
}

output "user_upload_bucket_name" {
  value = module.storage.user_upload_s3_bucket_name
}

output "db_write_host" {
  value = module.storage.db_write_host
}

output "db_read_host" {
  value = module.storage.db_read_host
}

output "db_port" {
  value = module.storage.db_port
}

