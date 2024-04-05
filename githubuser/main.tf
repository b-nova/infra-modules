terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_membership" "member" {
  username = var.username
  role     = var.role
}

resource "github_team_membership" "team_membership" {
  for_each = {for i, v in var.teamMemberships :  i => v}
  team_id  = each.value.teamId
  username = var.username
  role     = each.value.role
}
