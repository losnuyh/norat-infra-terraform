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
    master_username = var.master_admin_name
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
