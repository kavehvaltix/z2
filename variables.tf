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
variable "valtix_csp_regions" {
	type	= list (string)
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
variable "valtix_tgw_name" {
	type	= string
}
variable "valtix_svpc_name" {
	type	= string
}
variable "valtix_svpc_region" {
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
variable "valtix_gateway_region" {
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