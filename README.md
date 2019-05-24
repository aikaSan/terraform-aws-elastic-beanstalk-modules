# Terraform modules example with ElasticBeanstalk

This folder contains an example of creating modules with Terraform and ElasticBeanstalk. This code asumes that there's a VPC, Certificate and at least two subnets already created.
Default EB Roles have been applied.

## Folders

module-eb-example:
1. Using version 0.11.14 of Terraform

module-eb-example-0.12
1. Using version 0.12.0 of Terraform.
2. With dynamic blocks to create clean code for the settings on EB.

For more information about version 0.12 can be found [here](https://github.com/hashicorp/terraform/blob/v0.12.0/CHANGELOG.md).
