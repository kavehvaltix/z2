variable "prefix" {
  description = "prefix for all resources created in this VPC"
  default     = "km"
}

variable "transit_vpc_cidr" {
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

variable "key_name" {
  description = "SSH Keypair name"
  default     = "kaveh_71121"
}

variable "instance_type" {
  description = "type of demo instances to deploy"
  default     = "t3a.medium"
}

variable "aws_provider_alias"{
  default = "default"
}

variable "vpc_id"{
  default =""
}

variable "subnet_id"{
  default     =    "subnet-09c1e4a677fe41cd1"
  type = string
}