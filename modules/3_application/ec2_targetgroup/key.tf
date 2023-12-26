resource "aws_key_pair" "ec2_root_key" {
  key_name        = "${var.project}_${var.env}_ec2_root_key"
  public_key      = file(var.ec2_key_path)
}