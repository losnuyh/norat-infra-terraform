module "target_group" {
  source = "./ec2_targetgroup"
  project = var.project
  env = var.env
  vpc_id = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
  instance_type = var.instance_type
  app_instance_sg_id = var.app_instance_sg_id
  application_instance_ami = var.application_instance_ami
  ec2_key_path = var.ec2_key_path
}

module "lb" {
  source = "./lb"
  project = var.project
  env = var.env
  vpc_id = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  lb_sg_id = var.alb_sg_id
  target_group_arn = module.target_group.target_group_arn
}