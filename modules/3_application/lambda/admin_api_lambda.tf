data "archive_file" "admin_api_code" {
  type        = "zip"
  source_dir = var.api_lambda_source_dir
  output_path = "lambda_admin_api_function.zip"
}

resource "aws_lambda_function" "admin_api_lambda" {
  function_name = "${var.project}_${var.env}_admin_lambda"
  role          = aws_iam_role.api_lambda.arn
  description = "${var.project} ${var.env} admin api lambda"
  handler = "lambda_admin_api_function.lambda_handler"
  architectures = ["arm64"]

  vpc_config {
    security_group_ids = [var.api_lambda_sg_id]
    subnet_ids         = var.private_subnet_ids
  }

  package_type = "Zip"

  filename = "lambda_admin_api_function.zip"
  source_code_hash = var.default_admin_api_lambda_deploy ? data.archive_file.admin_api_code.output_base64sha256 : null

  runtime = "python3.11"
  timeout = 30
  memory_size = 512

  environment {
    variables = {
      ENV = var.env
    }
  }
}
