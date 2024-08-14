resource "aws_acm_certificate" "quest_cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
  tags = var.tags
}

resource "aws_route53_record" "quest_record" {
  for_each = {
    for dvo in aws_acm_certificate.quest_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.dev.zone_id
}

resource "aws_acm_certificate_validation" "quest_valdiation" {
  certificate_arn         = aws_acm_certificate.quest_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.quest_record : record.fqdn]
}