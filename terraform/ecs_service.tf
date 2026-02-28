#############################################
# ECS Service for ONYX Telemetry Worker
#############################################

resource "aws_ecs_service" "worker_service" {
  name            = "${local.name_prefix}-worker-service"
  cluster         = aws_ecs_cluster.onyx_cluster.id
  task_definition = aws_ecs_task_definition.worker_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = data.aws_subnets.default.ids
    security_groups = [aws_security_group.worker_sg.id]
    assign_public_ip = true
  }

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}

#############################################
# Networking for ECS Service
#############################################

# Use default VPC subnets
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security group for ECS task
resource "aws_security_group" "worker_sg" {
  name        = "${local.name_prefix}-worker-sg"
  description = "Security group for ONYX worker"
  vpc_id      = data.aws_vpc.default.id

  # Outbound only (worker pulls from SQS, SNS, ECR, CloudWatch)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}


