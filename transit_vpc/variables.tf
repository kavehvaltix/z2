variable "prefix" {
  description = "prefix for all resources created in this VPC"
  default     = "kiran-spoke1"
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_bits" {
  description = "Number of additional bits (on top of the vpc cidr mask) to use in the subnets inside VPC (final subnet would be the mask of vpc cidr + the value provided for this variable)"
  default     = 8
}

variable "zones" {
  description = "availability zones that will be used"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "key_name" {
  description = "SSH Keypair name"
  default     = "valtix_vvdn_ssh_april12_2018"
}

variable "instance_type" {
  description = "type of demo instances to deploy"
  default     = "t3a.medium"
}
