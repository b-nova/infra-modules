variable "name" {
  description = "name of the route table"
  default     = ""
}

variable "cidr_block" {
  description = "cidr_block"
  default     = "0.0.0.0/0"
}

variable "vpc_id" {
  description = "vpc id"
  default     = ""
}

variable "gateway_id" {
  description = "the gateway id"
  default     = ""
}

variable "nat_gateway_id" {
  description = "the nat gateway id"
  default     = ""
}
