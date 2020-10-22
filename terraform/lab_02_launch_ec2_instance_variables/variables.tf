variable "region" {
  default = "us-west-1"
}

variable "amis" {
  type = "map"
  default = {
    "us-west-1" = "ami-03fac5402e10ea93b"
    "us-west-2" = "ami-07a29e5e945228fa1"
  }
}
