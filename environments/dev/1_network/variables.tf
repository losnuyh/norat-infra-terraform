variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnets" {
  type = list(object({
    cidr = string
    az = string
  }))
}

variable "private_subnets" {
  type = list(object({
    cidr = string
    az = string
  }))
}

variable "bastion_ami" {
  type = string
}

variable "bastion_instance_type" {
  type = string
}

variable "bastion_key_path" {
  type = string
}

