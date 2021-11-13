variable "prefix" {
  description = "prefix for all resources created in this VPC"
  default     = "km"
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  default     = "10.110.0.0/16"
}

variable "subnet_bits" {
  description = "Number of additional bits (on top of the vpc cidr mask) to use in the subnets inside VPC (final subnet would be the mask of vpc cidr + the value provided for this variable)"
  default     = 8
}

variable "zone" {
  description = "availability zone that will be used"
  default     = "us-west-2a"
}

variable "aws_provider_alias"{
  default = "default"
}