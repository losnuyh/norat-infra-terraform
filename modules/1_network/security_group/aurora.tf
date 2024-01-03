resource "aws_security_group" "aurora_mysql" {
  name = "${var.project}-${var.env}-aurora-mysql-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [
      aws_security_group.bastion.id,
      aws_security_group.api_lambda.id,
    ]
  }
}