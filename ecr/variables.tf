variable "name" {
  description = "name of the codepipeline"
  default     = ""
}

variable "team" {
  description = "name of the team tag to add to the ecr repo"
  default     = ""
}

variable "tagStatus" {
  type        = string
  description = "tag status (tagged, untagged, any)"
  default     = "any"
}

variable "tagPrefixList" {
  type        = list(string)
  description = "tag prefixed of images to retain"
  default     = null
}

variable "numberImages" {
  description = "number of images to retain"
  default     = 5
  type        = number
}

variable "retentionRules" {
  type = list(object({
    description    = string
    tagPatternList = list(string)
  }))
  description = "Optional. When set, replaces the single tagPrefixList retention rule with one 'imageCountMoreThan numberImages' rule per entry (priority follows list order). When null, the legacy single-rule behavior (tagStatus/tagPrefixList) is used."
  default     = null
}
