resource "aws_lb_target_group" "main" {
  name = "${var.project}-${var.env}-target-group"
  port = 8080
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/"
    port = 8080
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "main" {
  for_each = {
    for idx, instance in aws_instance.app:
        idx => instance.id
  }

  target_group_arn = aws_lb_target_group.main.arn
  target_id        = each.value
  port = 8080

  lifecycle {
    create_before_destroy = true
  }
}