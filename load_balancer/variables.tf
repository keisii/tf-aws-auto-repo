variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "subnet01_id" {
  description = " First public Subnet ID"
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
  description = "Security group ID for Web and App"
  type = string
}
