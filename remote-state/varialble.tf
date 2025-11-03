variable "instance_type" {
  default = "t2.micro"
}

data "aws_ami" "join-dev" {
  owners      = ["973714476881"]
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}
