resource "aws_instance" "terraform-demo" {
  ami                    = local.ami
  instance_type          = local.instance_type # varaibles can overridden, locals can not 
  vpc_security_group_ids = [aws_security_group.allow_all_terraform.id]
  tags                   = local.ec2_tags
}

resource "aws_security_group" "allow_all_terraform" {
  name        = "${local.common_name}-allow-all"
  description = var.sg_desc

  tags = {
    Name = "${local.common_name}-allow-all"
  }
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.allow_all_terraform.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol # semantically equivalent to all ports

  tags = {
    Name = var.allow_all
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.allow_all_terraform.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol # semantically equivalent to all ports

  tags = {
    Name = var.allow_all
  }
}
