output "static_bucket_domain_name" {
  value = aws_s3_bucket.static.bucket_domain_name
}

output "static_bucket_id" {
  value = aws_s3_bucket.static.id
}

output "static_bucket_arn" {
  value = aws_s3_bucket.static.arn
}

output "user_upload_bucket_arn" {
  value = aws_s3_bucket.user_upload.arn
}

output "user_upload_bucket_name" {
  value = aws_s3_bucket.user_upload.bucket
}