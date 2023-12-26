output "target_group_arn" {
  value = aws_lb_target_group.main.arn
}

output "instance_private_dns_list" {
  value = [for instance in aws_instance.app: instance.private_dns]
}
