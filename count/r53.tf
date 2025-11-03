resource "aws_route53_record" "roboshop" {
  count           = var.val
  zone_id         = var.zone_id
  name            = var.instances[count.index] != "frontend" ? "${var.instances[count.index]}.${var.domain_name}" : var.domain_name
  type            = "A"
  ttl             = 1
  records         = var.instances[count.index] == "frontend" ? [aws_instance.terraform-demo[count.index].public_ip] : [aws_instance.terraform-demo[count.index].private_ip]
  allow_overwrite = true
}

