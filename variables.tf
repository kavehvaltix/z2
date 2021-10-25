# Valtix Variable Declaration
variable "valtix_aws_region" {
	type	= string
}
variable "valtix_aws_azs" {
	type	= list (string)
}
variable "valtix_aws_account" {
	type	= string
}
variable "valtix_csp_name" {
	type	= string
}
variable "valtix_csp_regions" {
	type	= list (string)
}
variable "valtix_aws_controller_role_arn" {
	type	= string
}
variable "valtix_aws_firewall_role_arn" {
	type	= string
}
variable "valtix_aws_external_id" {
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
variable "valtix_policy_ruleset_egress_name" {
	type	= string
}
variable "valtix_policy_ruleset_ingress_name" {
	type	= string
}
variable "valtix_gateway_egress_name" {
	type	= string
}
variable "valtix_gateway_ingress_name" {
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
variable "valtix_certificate_name" {
	type	= string
}
variable "valtix_decryption_name" {
	type	= string
}
variable "valtix_dlp_name" {
	type	= string
}
variable "valtix_fqdn_name" {
	type	= string
}
variable "valtix_ips_name" {
	type	= string
}
variable "valtix_mips_name" {
	type	= string
}