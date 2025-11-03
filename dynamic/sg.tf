resource "aws_security_group" "allow_all_terraform" {
  name        = "allow_all_terraform"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all_terraform"
  }
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.allow_all_terraform.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.allow_all_terraform.id
  count             = length(var.ingress_port)
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.ingress_port[count.index]
  to_port           = var.ingress_port[count.index]
  ip_protocol       = "tcp" # semantically equivalent to all ports
}


