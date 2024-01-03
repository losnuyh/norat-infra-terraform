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
  database_name = var.database_name
  write_db_host = var.write_db_host
  write_db_user_name = var.write_db_user_name
  write_db_user_password = var.write_db_user_password
  read_db_host = var.read_db_host
  read_db_user_name = var.read_db_user_name
  read_db_user_password = var.read_db_user_password
  db_port = var.db_port
  cool_sms_api_key =  var.cool_sms_api_key
  cool_sms_api_secret_key = var.cool_sms_api_secret_key
  cool_sms_send_phone_number = var.cool_sms_send_phone_number
  jwt_signing_private_key = var.jwt_signing_private_key
}
