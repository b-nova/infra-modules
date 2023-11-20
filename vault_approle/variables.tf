variable "backend" {
  type        = string
  description = "The backend path to use"
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the role or application (eg. contendifiy)."
}

variable "policies" {
  type        = list(string)
  description = "policies that are attached to the approle"
  default     = null
}
