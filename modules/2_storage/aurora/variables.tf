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

variable "private_subnet_ids" {
  type = list(string)
}

variable "master_admin_name" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "instance_count" {
  type = number

  validation {
    condition     = var.instance_count <= 4
    error_message = "The count must be at least 5."
  }
}

variable "bastion_sg_id" {
  type = string
}
