variable "instances" {
  type = map(string)
  default = {
    mongo    = "t2.micro",
    mysql    = "t2.micro",
    redis    = "t2.micro",
    rabbitmq = "t2.micro",
  }
}


variable "zone_id" {
  default = "Z09590552TMQIL7M10P1I"
}

variable "domain_name" {
  default = "idiap.shop"
}

variable "val" {

  default = 10

}

