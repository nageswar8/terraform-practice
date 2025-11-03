variable "ingress_port" {
  type    = list(number)
  default = [80, 3306, 27017, 8080]
}
