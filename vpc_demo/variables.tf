# N. Virginia
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

###  Tags Variables ###

variable "demo_tags" {
  type = map(string)
  default = {
    service     = "jm-demo",
    environment = "demo"
    owner       = "jmanzurst@gmail.com"
  }
}

variable "tag_project" {
  type    = string
  default = "demo"
}