resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"

  tags = {
    team = var.team
  }
}

locals {
  # Purges untagged images; appended last in both policy variants.
  untagged_rule = {
    description = "delete all untagged images after 1 day"
    selection = {
      tagStatus   = "untagged"
      countType   = "sinceImagePushed"
      countUnit   = "days"
      countNumber = 1
    }
    action = { type = "expire" }
  }

  # Legacy single-rule policy. Used when var.retentionRules is not set, so existing
  # consumers of this module keep their current behavior unchanged.
  legacy_policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Retain the last 5 images"
        selection = {
          tagStatus     = var.tagStatus
          tagPrefixList = var.tagPrefixList
          countType     = "imageCountMoreThan"
          countNumber   = var.numberImages
        }
        action = { type = "expire" }
      },
      merge(local.untagged_rule, { rulePriority = 2 }),
    ]
  })

  # One "imageCountMoreThan numberImages" rule per entry in var.retentionRules,
  # priority following list order, with the untagged-purge rule appended last.
  retention_rules = var.retentionRules == null ? [] : var.retentionRules

  versioned_policy = jsonencode({
    rules = concat(
      [
        for idx, rule in local.retention_rules : {
          rulePriority = idx + 1
          description  = rule.description
          selection = {
            tagStatus      = "tagged"
            tagPatternList = rule.tagPatternList
            countType      = "imageCountMoreThan"
            countNumber    = var.numberImages
          }
          action = { type = "expire" }
        }
      ],
      [merge(local.untagged_rule, { rulePriority = length(local.retention_rules) + 1 })],
    )
  })
}

resource "aws_ecr_lifecycle_policy" "ecr_repository" {
  repository = aws_ecr_repository.ecr_repository.name

  policy = var.retentionRules == null ? local.legacy_policy : local.versioned_policy
}
