locals {
  name_prefix = "${var.project}-${var.env}"
}

resource "aws_instance" "app" {
  for_each = {
    for idx, subnet_id in var.private_subnet_ids:
        idx => subnet_id
  }
  ami = var.application_instance_ami
  instance_type = var.instance_type
  subnet_id = var.private_subnet_ids[each.key]
  key_name = var.bastion_ssh_key_name
  vpc_security_group_ids = [var.app_instance_sg_id]

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello World" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${local.name_prefix} instance ${each.key + 1}"
  }
}