variable "subnet01_id" {
  description = "First public Subnet ID"
  type = string
}

variable "subnet02_id" {
  description = "Second public Subnet ID"
  type = string
}

variable "subnet03_id" {
  description = "First private Subnet ID"
  type = string
}

variable "subnet04_id" {
  description = "Second private Subnet ID"
  type = string
}

variable "web_app_security_group_id" {
  description = "Security group For Web and App"
  type = string
}

variable "web_lb_tg" {
  description = "Web Load Balancer Target Group"
  type = string
}

variable "app_lb_tg" {
  description = "App Load Balancer Target Group"
  type = string
}
