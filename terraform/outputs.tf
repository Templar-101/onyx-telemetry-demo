#############################################
# Global Outputs for ONYX Telemetry Project
#############################################

output "ecr_repository_url" {
  description = "ECR repository URL for the worker image"
  value       = aws_ecr_repository.worker.repository_url
}

output "sqs_queue_url" {
  description = "SQS queue URL"
  value       = aws_sqs_queue.telemetry_queue.id
}

output "sqs_queue_arn" {
  description = "SQS queue ARN"
  value       = aws_sqs_queue.telemetry_queue.arn
}

output "sns_topic_arn" {
  description = "SNS topic ARN"
  value       = aws_sns_topic.telemetry_topic.arn
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.onyx_cluster.name
}

output "ecs_task_definition_arn" {
  description = "ECS task definition ARN"
  value       = aws_ecs_task_definition.worker_task.arn
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.worker_service.name
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group for ECS worker"
  value       = aws_cloudwatch_log_group.ecs_worker_logs.name
}
