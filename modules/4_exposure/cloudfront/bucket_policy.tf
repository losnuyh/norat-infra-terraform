resource "aws_s3_bucket_policy" "static" {
  bucket = var.static_bucket_id
  policy = jsonencode({
    Version: "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
        ],
        Resource = [
          "${var.static_bucket_arn}/*",
        ],
        Principal = {
          Service = ["cloudfront.amazonaws.com"],
        },
      }
    ]
  })
}