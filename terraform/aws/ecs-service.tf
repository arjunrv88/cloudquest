resource "aws_ecs_service" "quest_service" {
  name            = "quest_service"
  cluster         = aws_ecs_cluster.quest.id
  task_definition = aws_ecs_task_definition.quest.arn
  desired_count   = var.no_of_containers

  network_configuration {
    subnets          = [data.aws_subnet.first_subnet.id]
    security_groups  = [aws_security_group.sg_quest.id]
    assign_public_ip = true
  }
  depends_on = [
    aws_ecs_cluster.quest,
    aws_security_group.sg_quest
  ]
  tags = var.tags
}