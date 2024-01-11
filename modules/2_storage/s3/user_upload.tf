resource "aws_s3_bucket" "user_upload" {
  bucket_prefix = "${var.project}-${var.env}-user-upload-"
}
