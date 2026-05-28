variable "name" {
  type = string
}

variable "team" {
  type    = string
  default = "developer"
}

variable "policy" {
  type = string
}

variable "create_access_key" {
  description = "Whether to create an access key"
  type        = bool
  default     = false
}