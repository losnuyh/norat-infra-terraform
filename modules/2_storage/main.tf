module "aurora-mysql" {
  source = "./aurora"
  project = var.project
  region = var.region
  env = var.env
  vpc_id = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
  bastion_sg_id = var.bastion_sg_id
  instance_class = var.instance_class
  instance_count = var.instance_count
  master_admin_name = var.database_master_admin_name
  aurora_mysql_sg_id = var.aurora_mysql_sg_id
}

module "s3" {
  source = "./s3"
  project = var.project
  env = var.env
}