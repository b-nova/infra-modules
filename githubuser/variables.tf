variable "username" {
  description = "Github username of the member"
  default     = ""
}

variable "role" {
  description = "Github company role for the user (admin or default: member)"
  default     = "member"
}

variable "teamMemberships" {
  type = list(object({
    teamId = string
    role   = string
  }))
  description = "map of teams and the memberships"
}
