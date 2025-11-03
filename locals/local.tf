locals {
  instance_type = "t2.micro"
  common_name   = "${var.project}-${var.environment}"
  ami           = data.aws_ami.join-dev.id
  ec2_tags = merge(
    var.common_tags,
    {
      Name = "${local.common_name}-local-demo"
    }
  )

}

