resource "aws_instance" "terraform-demo" {
  for_each               = var.instances
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_all_terraform.id]


  tags = {
    Name = each.key

  }
}

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
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

