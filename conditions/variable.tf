variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {

  type    = string
  default = "t2.micro"

}

variable "instance_type_prod" {

  type    = string
  default = "t2.medium"

}

variable "env" {

  default = "dev"

}

variable "ec2_tages" {

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
