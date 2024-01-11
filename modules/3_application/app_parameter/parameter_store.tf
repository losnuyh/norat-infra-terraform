locals {
  prefix = "/${var.project}/${var.env}"
}

resource "aws_ssm_parameter" "write_db_user_name" {
  name = "${local.prefix}/WRITE_DB_USER_NAME"
  type = "String"
  value = var.write_db_user_name
}

resource "aws_ssm_parameter" "write_db_user_password" {
  name = "${local.prefix}/WRITE_DB_USER_PASSWORD"
  type = "SecureString"
  value = var.write_db_user_password
}

resource "aws_ssm_parameter" "write_db_host" {
  name = "${local.prefix}/WRITE_DB_HOST"
  type = "String"
  value = var.write_db_host
}

resource "aws_ssm_parameter" "read_db_user_name" {
  name = "${local.prefix}/READ_DB_USER_NAME"
  type = "String"
  value = var.read_db_user_name
}

resource "aws_ssm_parameter" "read_db_user_password" {
  name = "${local.prefix}/READ_DB_USER_PASSWORD"
  type = "SecureString"
  value = var.read_db_user_password
}

resource "aws_ssm_parameter" "read_db_host" {
  name = "${local.prefix}/READ_DB_HOST"
  type = "String"
  value = var.read_db_host
}

resource "aws_ssm_parameter" "db_port" {
  name = "${local.prefix}/DB_PORT"
  type = "String"
  value = var.db_port
}

resource "aws_ssm_parameter" "database_name" {
  name = "${local.prefix}/DATABASE_NAME"
  type = "String"
  value = var.database_name
}

resource "aws_ssm_parameter" "cool_sms_api_key" {
  name = "${local.prefix}/COOL_SMS_API_KEY"
  type = "SecureString"
  value = var.cool_sms_api_key
}

resource "aws_ssm_parameter" "cool_sms_secret_key" {
  name = "${local.prefix}/COOL_SMS_SECRET_KEY"
  type = "SecureString"
  value = var.cool_sms_api_secret_key
}

resource "aws_ssm_parameter" "cool_sms_send_phone_number" {
  name = "${local.prefix}/COOL_SMS_SEND_PHONE_NUMBER"
  type = "String"
  value = var.cool_sms_send_phone_number
}

resource "aws_ssm_parameter" "jwt_signing_private_key" {
  name = "${local.prefix}/JWT_SIGNING_PRIVATE_KEY"
  type = "SecureString"
  value = var.jwt_signing_private_key
}

resource "aws_ssm_parameter" "neis_key" {
  name = "${local.prefix}/NEIS_KEY"
  type = "SecureString"
  value = var.neis_key
}

resource "aws_ssm_parameter" "port_one_key" {
  name = "${local.prefix}/PORT_ONE_KEY"
  type = "SecureString"
  value = var.port_one_key
}

resource "aws_ssm_parameter" "port_one_secret" {
  name = "${local.prefix}/PORT_ONE_SECRET"
  type = "SecureString"
  value = var.port_one_secret
}

resource "aws_ssm_parameter" "user_upload_bucket_name" {
  name = "${local.prefix}/USER_UPLOAD_S3_BUCKET_NAME"
  type = "String"
  value = var.user_upload_bucket_name
}
