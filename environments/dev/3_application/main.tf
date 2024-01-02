module "application" {
  source = "../../../modules/3_application"
  project = var.project
  env = var.env
  region = var.region
  vpc_id = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  private_subnet_ids = var.private_subnet_ids
  instance_type = var.instance_type
  application_instance_ami = var.application_instance_ami
  bastion_sg_id = var.bastion_sg_id
  api_lambda_sg_id = var.api_lambda_sg_id
  default_api_lambda_deploy = var.default_api_lambda_deploy
  api_lambda_source_dir = "./file/default_api_lambda_source"
}
