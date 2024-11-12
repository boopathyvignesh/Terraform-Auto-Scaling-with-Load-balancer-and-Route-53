variable "aws_region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/20"
}

variable "subnets_cidr" {
  type = list (any)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  type = list (any)
  default = ["us-east-2a", "us-east-2b"]
}

variable "webservers_ami" {
  default = "ami-050cd642fd83388e4"
}

variable "instance_type" {
  default = "t2.micro"
}