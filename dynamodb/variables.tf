variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
  default = []
}

variable "name" {
  type = string
}

variable "hashkey" {
  type = string
}

variable "rangekey" {
  type    = string
  default = ""
}

variable "team" {
  type    = string
  default = "developer"
}

variable "billing_mode" {
  type    = string
  default = "PROVISIONED"
}

variable "read_capacity" {
  type    = number
  default = 1
}

variable "write_capacity" {
  type    = number
  default = 1
}

variable "stream_enabled" {
  type    = bool
  default = false
}
