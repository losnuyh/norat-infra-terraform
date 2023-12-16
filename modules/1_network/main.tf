module "vpc" {
  source = "./vpc"
  project = var.project
  env = var.env
  region = var.region
  vpc_cidr_block = var.vpc_cidr_block
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
}

module "bastion" {
  source = "./bastion"
  project = var.project
  env = var.env
  region = var.region
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  ami = var.bastion_ami
  instance_type = var.bastion_instance_type
  key_path = var.bastion_key_path
}
