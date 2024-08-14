data "aws_vpc" "filtered" {
  filter {
    name   = "tag:Name"
    values = [var.vpc]
  }
}

data "aws_subnets" "subnets" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.filtered.id]
  }
}

data "aws_subnet" "first_subnet" {
  id = data.aws_subnets.subnets.ids[0]
}

data "aws_route53_zone" "dev" {
  name         = var.route53_name
  private_zone = false
}