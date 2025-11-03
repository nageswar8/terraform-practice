variable "instances" {
  type    = list(string)
  default = ["mongo", "mysql", "redis", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}


variable "zone_id" {
  default = "Z09590552TMQIL7M10P1I"
}

variable "domain_name" {
  default = "idiap.shop"
}

variable "val" {

  default = 1

}

