variable "project" {
  type = string
}

variable "env" {
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

variable "instance_type" {
  type = string
}

variable "application_instance_ami" {
  type = string
}

variable "bastion_sg_id" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

variable "app_instance_sg_id" {
  type = string
}

variable "ec2_key_path" {
  type = string
}
