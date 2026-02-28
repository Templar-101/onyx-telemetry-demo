#############################################
# SQS Queue for ONYX Telemetry Worker
#############################################

resource "aws_sqs_queue" "telemetry_queue" {
  name = var.sqs_queue_name

  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400   # 1 day
  receive_wait_time_seconds  = 10      # long polling

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}


