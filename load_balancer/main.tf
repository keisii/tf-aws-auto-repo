resource "aws_lb" "project-web-lb" {
  name = "project-web-lb"
  load_balancer_type = "application"
  internal = false
  subnets = [var.subnet01_id, var.subnet02_id]
  security_groups = [var.web_app_security_group_id]
}

resource "aws_lb_target_group" "project-web-lb-tg" {
  name = "project-web-lb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "project-web-lb-listener" {
  load_balancer_arn = aws_lb.project-web-lb.arn
  port = 3000
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.project-web-lb-tg.arn
  }
}

resource "aws_lb" "project-app-lb" {
  name = "project-app-lb"
  load_balancer_type = "application"
  internal = false
  subnets = [var.subnet03_id, var.subnet04_id]
  security_groups = [var.web_app_security_group_id]
}

resource "aws_lb_target_group" "project-app-lb-tg" {
  name = "project-app-lb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "project-app-lb-listener" {
  load_balancer_arn = aws_lb.project-app-lb.arn
  port = 3000
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.project-app-lb-tg.arn
  }
}
