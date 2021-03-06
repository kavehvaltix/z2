# Valtix Variable Declaration
variable "valtix_aws_region" {
	type	= string
}
variable "valtix_aws_azs" {
	type	= list (string)
}
variable "valtix_csp_name" {
	type	= string
}
variable "valtix_aws_firewall_role_arn" {
	type	= string
}
variable "valtix_aws_keypair_name" {
	type	= string
}
variable "valtix_account_name" {
	type	= string
}
variable "valtix_api_key_file" {
	type	= string
}

variable "aws_principle_spoke_vpc" {
	type	= string
}
variable "valtix_svpc_name" {
	type	= string
}
variable "valtix_svpc_cidr" {
	type	= string
}
variable "valtix_policy_ruleset_eastwest_name" {
	type	= string
}
variable "valtix_gateway_eastwest_name" {
	type	= string
}
variable "valtix_gateway_version" {
	type	= string
}
variable "valtix_gateway_autoscale_min" {
	type	= string
}
variable "valtix_gateway_autoscale_max" {
	type	= string
}
variable "aws_workspaces_account_vpc_id" {
	type	= string
}

variable "spoke_vpc_csp_account_name" {
	type = string
}

variable "spoke_route_table_ids" {
  description = "Route table Ids on which the default route is set to the TGW"
  type = list(string)
}

variable "ec2_ssh_key_name" {
  description = "SSH Key pair name"
  default     = "zuora_valtix"
}

variable "spoke_vpcs" {
  description = "a list of spoke vpc variables"
  type = map(object({
    prefix      = string
    vpc_cidr    = string
    subnet_bits = number
	aws_provider_alias = string
  }))
}

variable "spoke_vms" {
  description = "a list of spoke VM variables"
  type = map(object({
    prefix      = string
	aws_provider_alias = string
  }))
}

variable "ec2_instance_type" {
  description = "App EC2 instance type"
  default     = "t3a.medium"
}
