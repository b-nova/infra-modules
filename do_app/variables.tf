variable "name" {
  type        = string
  description = "The name of the app. Must be unique across all apps in the same account."
}

variable "region" {
  type        = string
  default     = "fra1"
  description = "The slug for the DigitalOcean data center region hosting the app."
}

variable "environment_slug" {
  type        = string
  description = "An environment slug describing the type of this app."
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "The amount of instances that this component should be scaled to."
}

variable "instance_size_slug" {
  type        = string
  default     = "basic-xxs"
  description = "The instance size to use for this component. This determines the plan (basic or professional) and the available CPU and memory. The list of available instance sizes can be found with the API or using the doctl CLI (doctl apps tier instance-size list)"
}

variable "repo" {
  type        = string
  description = "The fullname of the github repository. Example: 'username/repo'"
}

variable "deploy_on_push" {
  type        = bool
  default     = false
  description = "Whether to automatically deploy new commits made to the repo."
}

variable "env" {
  type = list(object({
    key   = string
    value = string
    scope = optional(string, "RUN_TIME")
    type  = optional(string, "SECRET")
  }))
  default     = []
  description = <<EOT
    env = {
      key : "The name of the environment variable."
      value : "The value of the environment variable."
      scope : "The visibility scope of the environment variable. One of RUN_TIME, BUILD_TIME, or RUN_AND_BUILD_TIME (default)."
      type : "The type of the environment variable, GENERAL or SECRET."
    }
  EOT
}