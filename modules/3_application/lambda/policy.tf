resource "aws_iam_policy" "lambda_default" {
  name = "${var.project}_${var.env}_lambda_default_policy"
  policy = jsonencode({
    Version: "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = ["arn:aws:logs:*:*:*"]
      },
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface"
        ]
        Resource = ["*"]
      },
      {
        Action = [
          "rds-db:connect"
        ],
        Effect = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_policy" "user_upload_s3_pre_signed_url_policy" {
  name = "${var.project}_${var.env}_user_upload_s3_pre_signed_url_policy"
  policy = jsonencode({
    Version: "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
        ],
        Resource = [
          "${var.user_upload_s3_arn}/face_verification/*",
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
        ],
        Resource = [
          var.user_upload_s3_arn,
        ]
      }
    ]
  })
}