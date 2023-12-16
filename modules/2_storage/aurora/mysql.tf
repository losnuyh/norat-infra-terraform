#module "aurora-mysql-cluster" {
#  source = "terraform-aws-modules/rds-aurora/aws"
#
#  name = "${var.project}-${var.env}-aurora-rd"
#  engine = "aurora-mysql"
#  engine_version = "8.0.mysql_aurora.3.04.0"
#
#  engine_mode = "provisioned"
#
#  vpc_id = var.vpc_id
#  create_db_subnet_group = true
#  subnets = var.private_subnet_ids
#
#  master_username = "admin"
#  master_password = aws_secretsmanager_secret_version.rds_master_password.secret_string
#  apply_immediately = true
#
#  instance_class = var.instance_class
#  instances = {
#    for i in range(var.instance_count) : element(["a", "b", "c", "d"], i) => {}
#  }
#  database_name = "${var.project}_${var.env}_database"
#  final_snapshot_identifier = "${var.project}-${var.env}-db-snapshot"
#  manage_master_user_password = false
#
#  security_group_rules = {
#    ex1_ingress = {
#      source_security_group_id = var.bastion_sg_id
#    }
#  }
#}