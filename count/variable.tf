variable "instances" {
  type    = list(string)
  default = ["mongo", "mysql", "redis", "rabbitmq"]
}

variable "zone_id" {
  default = "Z09590552TMQIL7M10P1I"
}

variable "domain_name" {
  default = "idiap.shop"
}

