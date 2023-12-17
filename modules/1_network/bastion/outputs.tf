output "bastion_public_dns" {
  value = aws_instance.bastion.public_dns
}

output "bastion_ssh_key_name" {
  value = aws_key_pair.bastion_root_key.key_name
}
