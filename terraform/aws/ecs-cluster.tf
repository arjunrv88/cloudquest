resource "aws_ecs_cluster" "quest" {
  name = var.cluster_name
  tags = var.tags
}