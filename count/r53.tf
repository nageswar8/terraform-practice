resource "aws_route53_record" "roboshop" {
  count           = 4
  zone_id         = var.zone_id
  name            = "${var.instances[count.index]}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = [aws_instance.terraform-demo[count.index].private_ip]
  allow_overwrite = true
}

