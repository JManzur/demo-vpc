# N. Virginia
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

###  Tags Variables ###

variable "project-tags" {
  type = map(string)
  default = {
    service     = "demo-vpc",
    environment = "demo"
    owner       = "example@mail.com"
  }
}

variable "resource-name-tag" {
  type    = string
  default = "demo"
}