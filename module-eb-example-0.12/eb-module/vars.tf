variable "vpc_id" {}
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

variable "env_name" {
    description = "Name of the EB environment."
}

variable "env_tier" {
  description = "WebServer or Worker Tier."
}

variable "app_name" {
  description = "Name of the Application that the environment will be deployed."
}

variable "stack_name" {
  description = "Solution stack of the environment (e.g. 64bit Amazon Linux 2018.03 v2.8.9 running PHP 7.2)."
}

variable "instance_port" {
  description = "The port that this listener uses to communicate with the EC2 instances."
}

variable "env_conf" {
  type = map(string)
}


variable "asg" {
  type = map(string)
}

variable "elb_listener" {
  type = map(string)
}

variable "launch_config" {
    type = map(string)
}

variable "vpc_conf" {
    type = map(string)
}

/*

variable "email" {
  description = "Email that will be in the sns topic automatically created by EB (Monitoring purpose)."
}

variable "batch_size" {
  description = "Percentage or fixed number of EC2 instances in the ASG on which to simultaneously perform deployments."
}

variable "batch_size_type" {
  description = "The type of number that is specified in BatchSize. (e.g. Fixed or Percentage)"
}

variable "min_instance_in_service" {
  description = "Minimum number of instances that must be in service within the ASG while other instances are terminated."
}

variable "rolling_update_type" {
  description = "	Time-based, Health-based or Immutable rolling updates."
}

variable "rolling_update_enabled" {
  description = "If true, enables rolling updates which are useful when you need to make small, frequent updates to the software application and want to avoid application downtime."
}

variable "health_type" {
  description = "Enhanced or Basic monitoring of EB Application"
}

variable "deployment_policy" {
  description = "Choose a deployment policy for application version deployments."
}

variable "public_subnets" {
  type        = "list"
  description = "List of private subnets to place EC2 instances."
}

variable "associate_public_ip" {
  description = "Specifies whether to launch instances with public IP addresses in your Amazon VPC."
}

*/