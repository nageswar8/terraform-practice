data "aws_ami" "join-dev" {
  owners      = ["973714476881"]
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}

data "aws_instance" "instance_data" {

  instance_id = "i-0dfde9239b6912d3d"

}


output "instance_data" {
  value = data.aws_instance.instance_data
}
