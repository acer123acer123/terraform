variable "region" {
  default = "us-west-1"
}

variable "ip_range" {
  default = "0.0.0.0/0"  #CHANGE to your IP range!!!!
}

variable "key_name" {
  default = "chrisryan"
}

variable "amis" {
  description = "Amazon Linux AMI: us-west-1"
  default = {
    us-west-1 = "ami-6e84fa0e"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.128.1.0/24"
}
