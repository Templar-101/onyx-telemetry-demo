#############################################
# ONYX Telemetry Demo - Terraform Entry Point
#############################################

terraform {
  # Local backend for now — later you can switch to S3 + DynamoDB
  backend "local" {}
}

# Load variables (values come from terraform.tfvars)
locals {
  project     = var.project_name
  environment = var.environment
  name_prefix = "${var.project_name}-${var.environment}"
}

# This file intentionally contains no resources.
# All resources are defined in separate *.tf files:
# - ecr.tf
# - ecs_cluster.tf
# - ecs_task.tf
# - ecs_service.tf
# - sqs.tf
# - sns.tf
# - iam.tf
# - cloudwatch.tf
#
# main.tf acts as the root entry point for the project.
