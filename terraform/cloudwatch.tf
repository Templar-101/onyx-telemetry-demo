#############################################
# CloudWatch Log Group for ECS Task Logs
#############################################

resource "aws_cloudwatch_log_group" "ecs_worker_logs" {
  name              = "/ecs/${local.name_prefix}-worker"
  retention_in_days = 7

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}

output "cloudwatch_log_group_name" {
  value = aws_cloudwatch_log_group.ecs_worker_logs.name
}
