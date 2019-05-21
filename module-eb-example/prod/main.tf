module "prod-eb-template" {
    source = "../eb-module"

    env_name               = "prod-environment"
    app_name               = "MySampleApp"
    env_tier               = "WebServer"
    stack_name             = "64bit Amazon Linux 2018.03 v2.8.9 running PHP 7.2"

    min_size               = "1"
    max_size               = "2"
    listener_protocol      = "HTTPS"
    instance_port          = "443"

    instance_type          = "t1.micro"

    ec2_keyname            = "mykey"

    batch_size             = "1"
    batch_size_type        = "Fixed"
    deployment_policy      = "Rolling"
    min_instance_in_service = "1"
    rolling_update_type    = "Health"
    rolling_update_enabled = "true"

    health_type            = "enhanced"

    associate_public_ip    = "true"

    email                  = "${var.email}"
    public_subnets         = "${var.public_subnets}"
    vpc_id                 = "${data.aws_vpc.selected.id}"
    cert_arn               = "${var.cert_arn}"

}