resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"

  tags = {
    team = var.team
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_repository" {
  repository = aws_ecr_repository.ecr_repository.name

  policy = jsonencode({
    "rules" : [
      {
        rulePriority : 1,
        description : "Retain the last 5 images",
        selection : {
          "tagStatus" : var.tagStatus,
          "tagPrefixList" : var.tagPrefixList,
          "countType" : "imageCountMoreThan",
          "countNumber" : var.numberImages
        },
        action : {
          "type" : "expire"
        }
      },
      {
        rulePriority : 2,
        description : "delete all untagged images after 1 day",
        selection : {
          "tagStatus" : "untagged",
          "countType" : "sinceImagePushed",
          "countUnit" : "days"
          "countNumber" : 1
        },
        action : {
          "type" : "expire"
        }
      }
    ]
  })
}

