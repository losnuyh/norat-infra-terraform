output "api_lambda_invoke_arn" {

  value = aws_lambda_function.api_lambda.invoke_arn
}

output "api_lambda_function_name" {
  value = aws_lambda_function.api_lambda.function_name
}

output "api_lambda_function_arn" {
  value = aws_lambda_function.api_lambda.arn
}

output "admin_api_lambda_invoke_arn" {
  value = aws_lambda_function.admin_api_lambda.invoke_arn
}

output "admin_api_lambda_function_name" {
  value = aws_lambda_function.admin_api_lambda.function_name
}

output "admin_api_lambda_function_arn" {
  value = aws_lambda_function.admin_api_lambda.arn
}