###############################
#   EB Configuration
###############################
resource "aws_elastic_beanstalk_environment" "prod" {
  name                = "${var.env_name}"
  application         = "${var.app_name}"
  tier                = "${var.env_tier}"
  solution_stack_name = "${var.stack_name}"

###############################
#   LB Configuration
###############################

  setting = {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting = {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "${var.min_size}"
  }

  setting = {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "${var.max_size}"
  }

  setting = {
    namespace = "aws:elb:listener:${var.instance_port}"
    name      = "ListenerProtocol"
    value     = "${var.listener_protocol}"
  }

  setting = {
    namespace = "aws:elb:listener:${var.instance_port}"
    name      = "InstancePort"
    value     = "${var.instance_port}"
  }

  setting = {
    namespace = "aws:elb:listener:${var.instance_port}"
    name      = "InstanceProtocol"
    value     = "HTTP"
  }

  setting = {
    namespace = "aws:elb:listener:${var.instance_port}"
    name      = "SSLCertificateId"
    value     = "${var.cert_arn}"
  }

###############################
#   Instance type
###############################

  setting = {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "${var.instance_type}"
  }

###############################
#   Instance Key
###############################

  setting = {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "${var.ec2_keyname}"
  }

###############################
#   Email Notification
###############################

  setting = {
    namespace = "aws:elasticbeanstalk:sns:topics"
    name      = "Notification Endpoint"
    value     = "${var.email}"
  }

###############################
#   Roles Configuration
###############################

  setting = {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }

  setting = {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

###############################
#   Instance Update
###############################

  setting = {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "${var.batch_size}"
  }

  setting = {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = "${var.batch_size_type}"
  }

  setting = {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "${var.deployment_policy}"
  }

  setting = {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = "${var.min_instance_in_service}"
  }

  setting = {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "${var.rolling_update_type}"
  }

  setting = {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "${var.rolling_update_enabled}"
  }
################################
#   Health Reporting
################################

  setting = {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "${var.health_type}"
  }

#################################
#  VPC Configutaion
#################################
  setting = {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${data.aws_vpc.selected.id}"
  }

  setting = {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${join(",", var.public_subnets)}"
  }

  setting = {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${join(",", var.public_subnets)}"
  }

  setting = {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "${var.associate_public_ip}"
  }

} #End configuration