resource "aws_instance" "terraform-demo" {
  ami                    = var.ami_id
  instance_type          = var.env == "dev" ? var.instance_type : var.instance_type_prod
  vpc_security_group_ids = [aws_security_group.allow_all_terraform.id]


  tags = var.ec2_tages
}

resource "aws_security_group" "allow_all_terraform" {
  name        = var.sg_name
  description = var.sg_desc

  tags = {
    Name = var.sg_name
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
