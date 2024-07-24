resource "tls_private_key" "project-key-algorithm" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "project-public-key" {
  key_name = "project-public-key"
  public_key = tls_private_key.project-key-algorithm.public_key_openssh
}

resource "local_file" "project-private-key" {
  filename = "project-public-key.pem"
  content = tls_private_key.project-key-algorithm.private_key_pem
}

resource "aws_launch_template" "project-web-lt" {
  name = "project-web-launch-template"
  image_id = "ami-0edc5427d49d09d2a"
  instance_type = "t2.micro"
  
  key_name = aws_key_pair.project-public-key.key_name
 
  user_data = filebase64("${path.module}/server.sh")

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [var.web_app_security_group_id]
  }
}

resource "aws_autoscaling_group" "project-web-ag" {
  name = "project-web-asg"
  min_size = 2
  max_size = 2
  desired_capacity = 2
 
  target_group_arns = [var.web_lb_tg]
  vpc_zone_identifier = [var.subnet01_id, var.subnet02_id]
  
  launch_template {
    id = aws_launch_template.project-web-lt.id
    version = "$Latest"
  }
  
  tag {
    key	= "Name"
    value = "project-web"
    propagate_at_launch = true
  }
}

resource "aws_launch_template" "project-app-lt" {
  name = "project-app-launch-template"  
  image_id = "ami-0edc5427d49d09d2a"
  instance_type = "t2.micro"

  key_name = aws_key_pair.project-public-key.key_name

  user_data = filebase64("${path.module}/server.sh")

  network_interfaces {
    associate_public_ip_address = false
    security_groups = [var.web_app_security_group_id]
  }
}

resource "aws_autoscaling_group" "project-app-ag" {
  name = "project-asg"
  min_size = 2
  max_size = 2
  desired_capacity = 2

  target_group_arns = [var.app_lb_tg]
  vpc_zone_identifier = [var.subnet03_id, var.subnet04_id]

  launch_template {
    id = aws_launch_template.project-app-lt.id
    version = "$Latest"
  }

  tag {
    key = "Name"
    value = "project-app"
    propagate_at_launch = true
  }
}
