resource "aws_ecs_task_definition" "quest" {
  family                   = "quest-app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  container_definitions = jsonencode([
    {
      name      = "quest-app"
      image     = var.image_name
      essential = true
      portmappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]

    }
  ])
  tags = var.tags
}