resource "aws_ecr_repository" "eugene_repo" {
  name                 = "eugenerepo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "eugene_repo_policy" {
  repository = aws_ecr_repository.eugene_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "minieugene_repo" {
  name                 = "minieugene"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "minieugene_repo_policy" {
  repository = aws_ecr_repository.minieugene_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "constellationjs_repo" {
  name                 = "constellationjs"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "constellationjs_repo_policy" {
  repository = aws_ecr_repository.constellationjs_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "fluigicloud_repo" {
  name                 = "fluigicloud"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "fluigicloud_repo_policy" {
  repository = aws_ecr_repository.fluigicloud_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "raven_repo" {
  name                 = "raven"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "raven_repo_policy" {
  repository = aws_ecr_repository.raven_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "clothov4_repo" {
  name                 = "clothov4"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "clothov4_repo_policy" {
  repository = aws_ecr_repository.clothov4_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "clothov3_repo" {
  name                 = "clothov3"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "clothov3_repo_policy" {
  repository = aws_ecr_repository.clothov3_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}


resource "aws_ecr_repository" "cellov1_repo" {
  name                 = "cellov1"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "cellov1_repo_policy" {
  repository = aws_ecr_repository.cellov1_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "cellov2_repo" {
  name                 = "cellov2"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "cellov2_repo_policy" {
  repository = aws_ecr_repository.cellov2_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository" "fpselection_repo" {
  name                 = "fpselection"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "fpselection_repo_policy" {
  repository = aws_ecr_repository.fpselection_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}


resource "aws_ecr_repository" "parchmint_repo" {
  name                 = "parchmint"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "parchmint_repo_policy" {
  repository = aws_ecr_repository.parchmint_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}



resource "aws_ecr_repository" "aquarium_repo" {
  name                 = "aquarium"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "aquarium_repo_policy" {
  repository = aws_ecr_repository.aquarium_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}


resource "aws_ecr_repository" "knox_repo" {
  name                 = "knox"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    "env"       = "prod"
    "createdBy" = "gjohnson"
  }
}

resource "aws_ecr_lifecycle_policy" "knox_repo_policy" {
  repository = aws_ecr_repository.knox_repo.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 700 days",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 700
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
