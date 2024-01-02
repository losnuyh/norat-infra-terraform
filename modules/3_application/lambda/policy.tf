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
