resource "aws_db_subnet_group" "main" {
    name = "${var.project}-${var.env}-aurora-subnet-group"
    subnet_ids = var.private_subnet_ids

    tags = {
        Name = "${var.project}_${var.env} Subnet group"
    }
}

resource "aws_rds_cluster" "main" {
    cluster_identifier = "${var.project}-${var.env}-aurora-rd"
    engine = "aurora-mysql"
    engine_version = "8.0.mysql_aurora.3.04.0"
    engine_mode = "provisioned"
    db_subnet_group_name = aws_db_subnet_group.main.name
    database_name = "${var.project}_${var.env}_database"
    final_snapshot_identifier = "${var.project}-${var.env}-db-snapshot"
    apply_immediately = true
    allow_major_version_upgrade = false
    master_username = "admin"
    master_password = aws_secretsmanager_secret_version.rds_master_password.secret_string
    deletion_protection = true
    port = 3306
    preferred_backup_window = "02:00-03:00"
    preferred_maintenance_window = "sun:05:00-sun:06:00"
    skip_final_snapshot = false
    storage_encrypted = true
    vpc_security_group_ids = [var.aurora_mysql_sg_id]
}

resource "aws_rds_cluster_instance" "main" {
    count = var.instance_count
    apply_immediately = true
    copy_tags_to_snapshot = false
    cluster_identifier = aws_rds_cluster.main.id
    instance_class = var.instance_class
    engine = aws_rds_cluster.main.engine
    engine_version = aws_rds_cluster.main.engine_version
    auto_minor_version_upgrade = true
    db_subnet_group_name = aws_db_subnet_group.main.name
    preferred_maintenance_window = "sun:05:00-sun:06:00"
    identifier = "${var.project}-${var.env}-aurora-rd-${element(["a", "b", "c", "d"], count.index)}"
}


#  # module.storage.module.aurora-mysql.module.aurora-mysql-cluster.aws_db_subnet_group.this[0] will be created
#  + resource "aws_db_subnet_group" "this" {
#      + arn                     = (known after apply)
#      + description             = "For Aurora cluster second-dev-aurora-rd"
#      + id                      = (known after apply)
#      + name                    = "second-dev-aurora-rd"
#      + name_prefix             = (known after apply)
#      + subnet_ids              = [
#          + "subnet-00c89b12e0f7394a8",
#          + "subnet-00c9cb260674d79c3",
#        ]
#      + supported_network_types = (known after apply)
#      + tags_all                = (known after apply)
#      + vpc_id                  = (known after apply)
#    }
#
#  # module.storage.module.aurora-mysql.module.aurora-mysql-cluster.aws_rds_cluster.this[0] will be created
#  + resource "aws_rds_cluster" "this" {
#      + allocated_storage               = (known after apply)
#      + allow_major_version_upgrade     = false
#      + apply_immediately               = true
#      + arn                             = (known after apply)
#      + availability_zones              = (known after apply)
#      + backup_retention_period         = (known after apply)
#      + cluster_identifier              = "second-dev-aurora-rd"
#      + cluster_identifier_prefix       = (known after apply)
#      + cluster_members                 = (known after apply)
#      + cluster_resource_id             = (known after apply)
#      + copy_tags_to_snapshot           = false
#      + database_name                   = "second_dev_database"
#      + db_cluster_parameter_group_name = (known after apply)
#      + db_subnet_group_name            = "second-dev-aurora-rd"
#      + db_system_id                    = (known after apply)
#      + delete_automated_backups        = true
#      + enable_global_write_forwarding  = false
#      + enable_http_endpoint            = false
#      + endpoint                        = (known after apply)
#      + engine                          = "aurora-mysql"
#      + engine_mode                     = "provisioned"
#      + engine_version                  = "8.0.mysql_aurora.3.04.0"
#      + engine_version_actual           = (known after apply)
#      + final_snapshot_identifier       = "second-dev-db-snapshot"
#      + hosted_zone_id                  = (known after apply)
#      + iam_roles                       = (known after apply)
#      + id                              = (known after apply)
#      + kms_key_id                      = (known after apply)
#      + master_password                 = (sensitive value)
#      + master_user_secret              = (known after apply)
#      + master_user_secret_kms_key_id   = (known after apply)
#      + master_username                 = "admin"
#      + network_type                    = (known after apply)
#      + port                            = 3306
#      + preferred_backup_window         = "02:00-03:00"
#      + preferred_maintenance_window    = "sun:05:00-sun:06:00"
#      + reader_endpoint                 = (known after apply)
#      + skip_final_snapshot             = false
#      + storage_encrypted               = true
#      + storage_type                    = (known after apply)
#      + tags_all                        = (known after apply)
#      + vpc_security_group_ids          = (known after apply)
#
#      + timeouts {}
#    }
#
#  # module.storage.module.aurora-mysql.module.aurora-mysql-cluster.aws_rds_cluster_instance.this["a"] will be created
#  + resource "aws_rds_cluster_instance" "this" {
#      + apply_immediately                     = true
#      + arn                                   = (known after apply)
#      + auto_minor_version_upgrade            = true
#      + availability_zone                     = (known after apply)
#      + ca_cert_identifier                    = (known after apply)
#      + cluster_identifier                    = (known after apply)
#      + copy_tags_to_snapshot                 = false
#      + db_parameter_group_name               = (known after apply)
#      + db_subnet_group_name                  = "second-dev-aurora-rd"
#      + dbi_resource_id                       = (known after apply)
#      + endpoint                              = (known after apply)
#      + engine                                = "aurora-mysql"
#      + engine_version                        = "8.0.mysql_aurora.3.04.0"
#      + engine_version_actual                 = (known after apply)
#      + id                                    = (known after apply)
#      + identifier                            = "second-dev-aurora-rd-a"
#      + identifier_prefix                     = (known after apply)
#      + instance_class                        = "db.t4g.medium"
#      + kms_key_id                            = (known after apply)
#      + monitoring_interval                   = 0
#      + monitoring_role_arn                   = (known after apply)
#      + network_type                          = (known after apply)
#      + performance_insights_enabled          = (known after apply)
#      + performance_insights_kms_key_id       = (known after apply)
#      + performance_insights_retention_period = (known after apply)
#      + port                                  = (known after apply)
#      + preferred_backup_window               = (known after apply)
#      + preferred_maintenance_window          = "sun:05:00-sun:06:00"
#      + promotion_tier                        = 0
#      + publicly_accessible                   = (known after apply)
#      + storage_encrypted                     = (known after apply)
#      + tags_all                              = (known after apply)
#      + writer                                = (known after apply)
#
#      + timeouts {}
#    }
#
#  # module.storage.module.aurora-mysql.module.aurora-mysql-cluster.aws_security_group.this[0] will be created
#  + resource "aws_security_group" "this" {
#      + arn                    = (known after apply)
#      + description            = "Control traffic to/from RDS Aurora second-dev-aurora-rd"
#      + egress                 = (known after apply)
#      + id                     = (known after apply)
#      + ingress                = (known after apply)
#      + name                   = (known after apply)
#      + name_prefix            = "second-dev-aurora-rd-"
#      + owner_id               = (known after apply)
#      + revoke_rules_on_delete = false
#      + tags                   = {
#          + "Name" = "second-dev-aurora-rd"
#        }
#      + tags_all               = {
#          + "Name" = "second-dev-aurora-rd"
#        }
#      + vpc_id                 = "vpc-02715bde4430be15b"
#    }
#
#  # module.storage.module.aurora-mysql.module.aurora-mysql-cluster.aws_security_group_rule.this["ex1_ingress"] will be created
#  + resource "aws_security_group_rule" "this" {
#      + from_port                = 3306
#      + id                       = (known after apply)
#      + protocol                 = "tcp"
#      + security_group_id        = (known after apply)
#      + security_group_rule_id   = (known after apply)
#      + self                     = false
#      + source_security_group_id = "sg-0a74cb23506b2b9e0"
#      + to_port                  = 3306
#      + type                     = "ingress"
#    }
