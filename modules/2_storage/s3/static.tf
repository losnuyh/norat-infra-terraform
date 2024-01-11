resource "aws_s3_bucket" "static" {
  bucket_prefix = "${var.project}-${var.env}-static-"
}

resource "aws_s3_bucket_ownership_controls" "static_bucket" {
  bucket = aws_s3_bucket.static.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "static_bucket_acl" {
  bucket = aws_s3_bucket.static.id
  acl = "private"

  depends_on = [aws_s3_bucket_ownership_controls.static_bucket]
}
