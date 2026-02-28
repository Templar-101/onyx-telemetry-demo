#############################################
# ECR Repository for ONYX Telemetry Worker
#############################################

resource "aws_ecr_repository" "worker" {
  name = "${local.name_prefix}-worker"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}

