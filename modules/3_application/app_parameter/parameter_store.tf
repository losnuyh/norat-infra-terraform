locals {
  prefix = "/${var.project}/${var.env}"
  admin_prefix = "/${var.project}/ADMIN/${var.env}"
  main_prefix = "/${var.project}/MAIN/${var.env}"
  common_prefix = "/${var.project}/COMMON/${var.env}"
}

# main

resource "aws_ssm_parameter" "neis_key_for_main" {
  name = "${local.main_prefix}/NEIS_KEY"
  type = "SecureString"
  value = var.neis_key
}

# common

resource "aws_ssm_parameter" "jwt_signing_private_key_for_common" {
  name = "${local.common_prefix}/JWT_SIGNING_PRIVATE_KEY"
  type = "SecureString"
  value = var.jwt_signing_private_key
}

resource "aws_ssm_parameter" "write_db_user_name_for_common" {
  name = "${local.common_prefix}/WRITE_DB_USER_NAME"
  type = "String"
  value = var.write_db_user_name
}

resource "aws_ssm_parameter" "write_db_user_password_for_common" {
  name = "${local.common_prefix}/WRITE_DB_USER_PASSWORD"
  type = "SecureString"
  value = var.write_db_user_password
}

resource "aws_ssm_parameter" "write_db_host_for_common" {
  name = "${local.common_prefix}/WRITE_DB_HOST"
  type = "String"
  value = var.write_db_host
}

resource "aws_ssm_parameter" "read_db_user_name_for_common" {
  name = "${local.common_prefix}/READ_DB_USER_NAME"
  type = "String"
  value = var.read_db_user_name
}

resource "aws_ssm_parameter" "read_db_user_password_for_common" {
  name = "${local.common_prefix}/READ_DB_USER_PASSWORD"
  type = "SecureString"
  value = var.read_db_user_password
}

resource "aws_ssm_parameter" "read_db_host_for_common" {
  name = "${local.common_prefix}/READ_DB_HOST"
  type = "String"
  value = var.read_db_host
}

resource "aws_ssm_parameter" "db_port_for_common" {
  name = "${local.common_prefix}/DB_PORT"
  type = "String"
  value = var.db_port
}

resource "aws_ssm_parameter" "database_name_for_common" {
  name = "${local.common_prefix}/DATABASE_NAME"
  type = "String"
  value = var.database_name
}

resource "aws_ssm_parameter" "cool_sms_api_key_for_common" {
  name = "${local.common_prefix}/COOL_SMS_API_KEY"
  type = "SecureString"
  value = var.cool_sms_api_key
}

resource "aws_ssm_parameter" "cool_sms_secret_key_for_common" {
  name = "${local.common_prefix}/COOL_SMS_SECRET_KEY"
  type = "SecureString"
  value = var.cool_sms_api_secret_key
}

resource "aws_ssm_parameter" "cool_sms_send_phone_number_for_common" {
  name = "${local.common_prefix}/COOL_SMS_SEND_PHONE_NUMBER"
  type = "String"
  value = var.cool_sms_send_phone_number
}
resource "aws_ssm_parameter" "port_one_key_for_common" {
  name = "${local.common_prefix}/PORT_ONE_KEY"
  type = "SecureString"
  value = var.port_one_key
}

resource "aws_ssm_parameter" "port_one_secret_for_common" {
  name = "${local.common_prefix}/PORT_ONE_SECRET"
  type = "SecureString"
  value = var.port_one_secret
}

resource "aws_ssm_parameter" "user_upload_bucket_name_for_common" {
  name = "${local.common_prefix}/USER_UPLOAD_S3_BUCKET_NAME"
  type = "String"
  value = var.user_upload_bucket_name
}
