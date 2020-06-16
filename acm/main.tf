resource "aws_acm_certificate" "cert" {
  domain_name               = "${var.env_fqdn["${var.env}"]}"
  validation_method         = "DNS"

  subject_alternative_names = var.env_san[var.env]


  lifecycle {
    create_before_destroy = true
  }
}

output "cert_arn" {
  value = aws_acm_certificate.cert.arn
}
