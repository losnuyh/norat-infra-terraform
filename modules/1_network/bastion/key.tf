resource "aws_key_pair" "bastion_root_key" {
  key_name        = "${var.project}_${var.env}_bastion_root_key"
  public_key      = file(var.key_path)
}