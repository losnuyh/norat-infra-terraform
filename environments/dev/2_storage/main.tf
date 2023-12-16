module "storage" {
  source = "../../../modules/2_storage"
  project = var.project
  env = var.env
  region = var.region
  vpc_id = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
  bastion_sg_id = var.bastion_sg_id
  instance_class = var.instance_class
  instance_count = var.instance_count
  database_master_admin_name = var.database_master_admin_name
}