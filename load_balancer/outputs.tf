output "web_lb_tg" {
  value = aws_lb_target_group.project-web-lb-tg.arn
}

output "app_lb_tg" {
  value = aws_lb_target_group.project-app-lb-tg.arn
}
