module "application" {
  source = "../../../modules/3_application"
  project = var.project
  env = var.env
  vpc_id = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  private_subnet_ids = var.private_subnet_ids
  instance_type = var.instance_type
  application_instance_ami = var.application_instance_ami
  bastion_sg_id = var.bastion_sg_id
}
