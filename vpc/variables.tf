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

variable "zones" {
  description = "availability zones that will be used"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "aws_provider_alias"{
  default = "default"
}