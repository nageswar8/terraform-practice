resource "aws_instance" "terraform-demo" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_terraform.id]

  tags = {
    Name = "terraform-dev"
  }

  provisioner "local-exec" {
    command    = "echo ${self.public_ip} > inventory.ini"
    on_failure = continue
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
    on_failure = continue

  }

  #   provisioner "remote-exec" {
  #     inline = [

  #       "echo server stop"
  #     ]
  #     when = destroy
  #   }

  provisioner "local-exec" {
    when    = destroy
    command = "echo security group created"
  }
}

resource "aws_security_group" "allow_all_terraform" {
  name        = "allow_all_terraform"
  description = "Allow all inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all_terraform"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo security group created"
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
