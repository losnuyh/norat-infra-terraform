resource "aws_security_group" "for_alb" {
  vpc_id = var.vpc_id
  name = "${var.project}_${var.env}-alb-sg"
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "for_ec2" {
  vpc_id = var.vpc_id
  name = "${var.project}_${var.env}_ec2_sg"

  ingress {
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    security_groups = [aws_security_group.for_alb.id]
  }

  ingress {
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    security_groups = [var.bastion_sg_id]
  }

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    security_groups = [var.bastion_sg_id]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}