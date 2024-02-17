resource "aws_api_gateway_rest_api" "admin_app" {
  name = "${var.project}-${var.env}-admin-api"
}

resource "aws_api_gateway_resource" "admin-proxy-resource" {
  path_part   = "{proxy+}"
  parent_id   = aws_api_gateway_rest_api.admin_app.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.admin_app.id
}

resource "aws_api_gateway_method" "admin_main" {
  authorization = "NONE"
  http_method   = "ANY"
  resource_id   = aws_api_gateway_resource.admin-proxy-resource.id
  rest_api_id   = aws_api_gateway_rest_api.admin_app.id
}

resource "aws_api_gateway_integration" "admin_main" {
  http_method = aws_api_gateway_method.admin_main.http_method
  integration_http_method = "POST"
  resource_id = aws_api_gateway_resource.admin-proxy-resource.id
  rest_api_id = aws_api_gateway_rest_api.admin_app.id
  type        = "AWS_PROXY"
  uri         = var.admin_api_lambda_invoke_arn
}

resource "aws_lambda_permission" "admin_apigateway" {
  statement_id = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.admin_api_lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.admin_app.id}/*/*/*"
}

resource "aws_api_gateway_deployment" "admin_deployment" {
  rest_api_id = aws_api_gateway_rest_api.admin_app.id
  depends_on = [aws_api_gateway_integration.admin_main]

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.admin_app.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "admin_main" {
  deployment_id = aws_api_gateway_deployment.admin_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.admin_app.id
  stage_name    = var.env
}
