resource "aws_security_group" "application_instance" {
  vpc_id = var.vpc_id
  name = "${var.project}_${var.env}_app_instance_sg"

  ingress {
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}