resource "aws_security_group" "api_lambda" {
  name = "${var.project}-${var.env}-api-lambda-sg"
  vpc_id = var.vpc_id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}