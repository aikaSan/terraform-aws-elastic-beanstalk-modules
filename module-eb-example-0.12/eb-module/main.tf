###############################
#   EB Configuration
###############################
resource "aws_elastic_beanstalk_environment" "lb-app" {
  name                = "${var.env_name}"
  application         = "${var.app_name}"
  tier                = "${var.env_tier}"
  solution_stack_name = "${var.stack_name}"

###############################
#   LB Configuration
###############################

  dynamic "setting"{
    for_each = var.env_conf
    content{
        namespace = "aws:elasticbeanstalk:environment"
        name      = setting.key
        value     = setting.value
    }
  }

  dynamic "setting"{
    for_each = var.asg
    content{
      namespace = "aws:autoscaling:asg"
      name      = setting.key
      value     = setting.value
    }
  }

  dynamic "setting"{
    for_each = var.elb_listener
    content{
      namespace = "aws:elb:listener:${var.instance_port}"
      name      = setting.key
      value     = setting.value
    }
  }

  dynamic "setting"{
      for_each = var.launch_config
      content{
          namespace = "aws:autoscaling:launchconfiguration"
          name      = setting.key
          value     = setting.value
      }
  }

  dynamic "setting"{
      for_each = var.vpc_conf
      content{
          namespace = "aws:ec2:vpc"
          name      = setting.key
          value     = setting.value
      }
  }

} #End configuration