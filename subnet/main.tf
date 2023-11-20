resource "aws_subnet" "subnet" {
  assign_ipv6_address_on_creation = false
  availability_zone               = var.availability_zone
  cidr_block                      = var.cidr_block
  map_public_ip_on_launch         = true
  tags                            = {
    "Name" = var.name
  }
  vpc_id = var.vpc_id

  timeouts {}
}
