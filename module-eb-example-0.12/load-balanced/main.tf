module "lb-eb-template" {
    source                         = "../eb-module"

    env_name                       = "load-balanced-webserver-app"
    app_name                       = "Process-Automation"
    env_tier                       = "WebServer"
    stack_name                     = "64bit Amazon Linux 2018.03 v2.8.9 running PHP 7.2"

    vpc_id                         = "${data.aws_vpc.selected.id}"

    env_conf                       = {
        "EnvironmentType"          = "LoadBalanced"
        "ServiceRole"              = "aws-elastcibeanstalk-service-role"
    }

    asg                            = {
        "MinSize"                  = "1"
        "MaxSize"                  = "2"
    }

    elb_listener                   = {
        "ListenerProtocol"         = "HTTPS"
        "InstancePort"             = "443"
        "InstanceProtocol"         = "HTTPS"
        "SSLCertificateId"         = "${var.cert_arn}"
    }

    instance_port                  = "443"

    launch_config                  = {
        "InstanceType"             = "t1.micro"
        "EC2KeyName"               = "mykey"
        "IamInstanceProfile"       = "aws-elasticbeanstalk-ec2-role"
    }

    vpc_conf                       = {
        "VPCId"                    = "${data.aws_vpc.selected.id}"
        "Subnets"                  = "${join(",", var.public_subnets)}"
        "ELBSubnets"               = "${join(",", var.public_subnets)}"
        "AssociatePublicIpAddress" = true
    }

}