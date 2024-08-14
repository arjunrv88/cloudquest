resource "aws_lb" "quest_alb" {
  name               = "quest-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_quest.id]
  subnets            = [data.aws_subnet.first_subnet.id]
  tags               = var.tags
}

resource "aws_lb_target_group" "quest_target_group" {
  name     = "quest-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.filtered.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "quest_listener_http" {
  load_balancer_arn = aws_lb.quest_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.quest_target_group.arn
  }
}

resource "aws_lb_listener" "quest_listener_https" {
  load_balancer_arn = aws_lb.quest_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.quest_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.quest_target_group.arn
  }
  tags = var.tags
}