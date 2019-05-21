variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {}
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

variable "email" {
  description = "Email that will be in the sns topic automatically created by EB (Monitoring purpose)."
}

variable "public_subnets" {
  type        = "list"
  description = "List of private subnets to place EC2 instances."
}

variable "cert_arn" {}