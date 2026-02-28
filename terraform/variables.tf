variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "project_name" {
  description = "Base name for all ONYX resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "ecs_cpu" {
  description = "CPU units for ECS task"
  type        = number
}

variable "ecs_memory" {
  description = "Memory (MB) for ECS task"
  type        = number
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}
