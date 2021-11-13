variable "prefix" {
  description = "prefix for all resources created in this VPC"
  default     = "km"
}

variable "zone" {
  description = "availability zone that will be used"
  type        = string
  default     = "us-west-2a"
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
  default     =    ""
}