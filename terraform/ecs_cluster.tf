#############################################
# ECS Cluster for ONYX Telemetry Worker
#############################################

resource "aws_ecs_cluster" "onyx_cluster" {
  name = "${local.name_prefix}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}


