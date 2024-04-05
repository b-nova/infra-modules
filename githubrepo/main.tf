terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_repository" "repository" {
  name        = var.name
  description = "Repository for ${var.name}"

  has_downloads = false
  has_issues    = true
  has_projects  = false
  has_wiki      = false

  archived = var.archived

  visibility = var.visibility

  delete_branch_on_merge = var.delete_branch_on_merge
}

resource "github_team_repository" "team_repo" {
  count      = length(var.teams)
  team_id    = var.teams[count.index]
  repository = github_repository.repository.name
  permission = var.permissions
}

resource "github_branch_protection" "repository" {
  count                           = var.archived ? 0 : 1
  repository_id                   = github_repository.repository.node_id
  allows_deletions                = false
  allows_force_pushes             = false
  enforce_admins                  = var.enforce_admins
  force_push_bypassers            = []
  lock_branch                     = false
  pattern                         = "main"
  require_conversation_resolution = true
  require_signed_commits          = false
  required_linear_history         = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    dismissal_restrictions          = []
    pull_request_bypassers          = var.pull_request_bypassers
    require_code_owner_reviews      = false
    require_last_push_approval      = false
    required_approving_review_count = 1
    restrict_dismissals             = false
  }
}
