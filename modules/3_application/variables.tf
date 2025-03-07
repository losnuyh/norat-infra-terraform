variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "bastion_sg_id" {
  type = string
}

variable "api_lambda_sg_id" {
  type = string
}

variable "api_lambda_source_dir" {
  type = string
}

variable "default_api_lambda_deploy" {
  type = bool
  default = false
}

variable "default_admin_api_lambda_deploy" {
  type = bool
  default = true
}

variable "write_db_user_name" {
  type = string
}

variable "write_db_user_password" {
  type = string
}

variable "write_db_host" {
  type = string
}

variable "db_port" {
  type = string
}

variable "read_db_user_name" {
  type = string
}

variable "read_db_user_password" {
  type = string
}

variable "read_db_host" {
  type = string
}

variable "database_name" {
  type = string
}

variable "cool_sms_api_key" {
  type = string
}

variable "cool_sms_api_secret_key" {
  type = string
}

variable "cool_sms_send_phone_number" {
  type = string
}

variable "jwt_signing_private_key" {
  type = string
}

variable "neis_key" {
  type = string
}

variable "port_one_key" {
  type = string
}

variable "port_one_secret" {
  type = string
}

variable "user_upload_s3_arn" {
  type = string
}

variable "user_upload_s3_bucket_name" {
  type = string
}

variable "admin_token" {
  type = string
}
