output "vpc_id" {
  value = data.aws_vpc.filtered.id
}

output "subnet_id" {
  value = data.aws_subnet.first_subnet.id
}

output "ecs_cluster" {
  value = aws_ecs_cluster.quest.name
}

output "ecs_service" {
  value = aws_ecs_service.quest_service.name
}

output "ecs_task" {
  value = aws_ecs_task_definition.quest.arn
}

output "alb" {
  value = aws_lb.quest_alb.id
}

output "security_group" {
  value = aws_security_group.sg_quest.id
}

output "acm" {
  value = aws_acm_certificate.quest_cert.arn
}