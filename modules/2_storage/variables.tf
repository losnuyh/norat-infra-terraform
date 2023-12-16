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

variable "bastion_sg_id" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "database_master_admin_name" {
  type = string
}

variable "aurora_mysql_sg_id" {
  type = string
}