module "security_group" {
  source = "./security_groups"
  project = var.project
  env = var.env
  vpc_id = var.vpc_id
  bastion_sg_id = var.bastion_sg_id
}

module "target_group" {
  source = "./ec2_targetgroup"
  project = var.project
  env = var.env
  vpc_id = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
  instance_type = var.instance_type
  ec2_sg_id = module.security_group.ec2_sg_id
  application_instance_ami = var.application_instance_ami
  bastion_ssh_key_name = var.bastion_ssh_key_name
}

module "lb" {
  source = "./lb"
  project = var.project
  env = var.env
  vpc_id = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  lb_sg_id = module.security_group.lb_sg_id
  target_group_arn = module.target_group.target_group_arn
}