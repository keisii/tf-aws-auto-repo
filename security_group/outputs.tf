output "web_app_security_group_id" {
  value = aws_security_group.project-web-app-sg.id
}

output "db_security_group_id" {
  value = aws_security_group.project-db-sg.id
}
