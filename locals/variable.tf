variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {

  type    = string
  default = "t2.micro"

}

# variable "ec2_tages" {

#   type = map(string)

#   default = {
#     Name      = "terraform-prac"
#     terraform = "true"
#     Project   = "demo"
#   }

# }

variable "common_tags" {
  type = map(string)

  default = {
    Name      = "terraform-prac"
    terraform = "true"
    Project   = "demo"
  }

}

variable "sg_name" {
  type    = string
  default = "allow_all_terraform"
}

variable "sg_desc" {
  default = "Allow all inbound traffic and all outbound traffic"
}

variable "cidr_ipv4" {
  default = "0.0.0.0/0"
}

variable "ip_protocol" {
  default = "-1"
}

variable "allow_all" {
  default = "allow_all"
}

variable "project" {

  default = "roboshop"

}

variable "environment" {

  default = "dev"

}

data "aws_ami" "join-dev" {
  owners      = ["973714476881"]
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}
