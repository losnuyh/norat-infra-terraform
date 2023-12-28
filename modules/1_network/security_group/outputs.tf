output "aurora_mysql_sg_id" {
  value = aws_security_group.aurora_mysql.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}
