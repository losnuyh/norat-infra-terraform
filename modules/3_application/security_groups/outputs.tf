output "lb_sg_id" {
  value = aws_security_group.for_alb.id
}

output "ec2_sg_id" {
  value = aws_security_group.for_ec2.id
}