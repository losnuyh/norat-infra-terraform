resource "random_password" "rds_master_password" {
  length = 32
  special = true
  min_special = 5
  override_special = "!#$^&*-_=+:,.?"
}

resource "random_string" "random_key" {
  length = 3
  special = false
  upper = true
  numeric = true
}

resource "aws_secretsmanager_secret" "rds_master_password" {
  name = "${var.project}-${var.env}-rds-master-password-${random_string.random_key.result}"
}

resource "aws_secretsmanager_secret_version" "rds_master_password" {
  secret_id = aws_secretsmanager_secret.rds_master_password.id
  secret_string = random_password.rds_master_password.result
}

resource "aws_ssm_parameter" "db_master_password" {
  name = "/${var.project}/${var.env}/DB_MASTER_PASSWORD"
  type = "SecureString"
  value = aws_secretsmanager_secret_version.rds_master_password.secret_string
}