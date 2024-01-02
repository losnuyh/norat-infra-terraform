data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "app" {
  name = "${var.project}-${var.env}-api"
}

resource "aws_api_gateway_resource" "proxy-resource" {
  path_part   = "{proxy+}"
  parent_id   = aws_api_gateway_rest_api.app.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.app.id
}

resource "aws_api_gateway_method" "main" {
  authorization = "NONE"
  http_method   = "ANY"
  resource_id   = aws_api_gateway_resource.proxy-resource.id
  rest_api_id   = aws_api_gateway_rest_api.app.id
}

resource "aws_api_gateway_integration" "main" {
  http_method = aws_api_gateway_method.main.http_method
  integration_http_method = "POST"
  resource_id = aws_api_gateway_resource.proxy-resource.id
  rest_api_id = aws_api_gateway_rest_api.app.id
  type        = "AWS_PROXY"
  uri         = var.api_lambda_invoke_arn
}

resource "aws_lambda_permission" "apigateway" {
  statement_id = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.api_lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.app.id}/*/*/*"
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.app.id
  depends_on = [aws_api_gateway_integration.main]

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.app.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "main" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.app.id
  stage_name    = var.env
}
