resource "aws_instance" "bastion" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.for_bastion.id]
  subnet_id = var.public_subnet_id
  key_name = aws_key_pair.bastion_root_key.key_name
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true
    tags                  = {
      Name = "${var.project}-${var.env}-bastion-ec2-block"
    }
  }
  tags = {
    Name = "${var.project}-${var.env}-bastion-ec2"
  }
}
