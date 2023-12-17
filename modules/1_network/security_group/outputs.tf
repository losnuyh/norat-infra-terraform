output "aurora_mysql_sg_id" {
  value = aws_security_group.aurora_mysql.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "app_instance_sg_id" {
  value = aws_security_group.application_instance.id
}