resource "aws_vpc" "vpc" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = var.cidr_block
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags                             = {
    "Name" = var.name
  }
}
