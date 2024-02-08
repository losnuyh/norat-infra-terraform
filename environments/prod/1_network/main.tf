module "network" {
  source = "../../../modules/1_network"
  project = var.project
  env = var.env
  region = var.region
  vpc_cidr_block = var.vpc_cidr_block
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  bastion_ami = var.bastion_ami
  bastion_key_path = var.bastion_key_path
  bastion_instance_type = var.bastion_instance_type
}
