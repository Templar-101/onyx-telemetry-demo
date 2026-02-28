#############################################
# SNS Topic for ONYX Telemetry Notifications
#############################################

resource "aws_sns_topic" "telemetry_topic" {
  name = var.sns_topic_name

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}


