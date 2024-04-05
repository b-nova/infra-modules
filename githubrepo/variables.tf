variable "name" {
  description = "Name of the github repository"
  default     = ""
}

variable "visibility" {
  default = "private"
}

variable "teams" {
  type        = list(string)
  description = "list of teams"
  default     = []
}

variable "permissions" {
  description = "The permissions for the group or user to the repository. Must be one of pull, triage, push, maintain, or admin, defaults to push"
  default     = "push"
}

variable "delete_branch_on_merge" {
  description = "Delete branch after merging to head"
  default     = true
}

variable "archived" {
  description = "Is this repository archived"
  default     = false
}

variable "enforce_admins" {
  description = "Admins could not bypass branch protection rules "
  default     = true
}

variable "pull_request_bypassers" {
  type        = list(string)
  description = "This accounts can directly push to the main branch"
  default     = []
}
