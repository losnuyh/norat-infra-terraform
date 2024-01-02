variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "api_lambda_sg_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "api_lambda_source_dir" {
  type = string
}

variable "default_api_lambda_deploy" {
  type = bool
}
