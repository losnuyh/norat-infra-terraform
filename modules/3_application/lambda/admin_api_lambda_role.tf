resource "aws_iam_role" "admin_api_lambda" {
  name = "${var.project}_${var.env}_admin_api_lambda_role"
  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement = [{
      Effect: "Allow",
      Action = ["sts:AssumeRole"],
      Principal: {
        Service: "lambda.amazonaws.com",
      },
    }],
  })
}

resource "aws_iam_role_policy_attachment" "admin_api_lambda_role_1" {
  policy_arn = aws_iam_policy.lambda_default.arn
  role       = aws_iam_role.api_lambda.name
}
